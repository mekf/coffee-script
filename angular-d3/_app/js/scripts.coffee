# module for custom directives
angularD3Demo = angular.module 'angularD3Demo', []

# controller logics
angularD3Demo.controller 'AppCtrl', AppCtrl = ($scope, $http) ->
	# init the model
	$scope.user = 'angular'
	$scope.repo = 'angular.js'

	readableDate = (d) ->
		"#{d.getUTCMonth()} / #{d.getUTCDate()}"

	# helper for reformatting the Github API response into a form we can pass to D3
	formatGithubResponse = (data) ->
		# sort the data by author date (rather than commit date)
		data.sort (a, b) ->
			if (new Date(a.commit.author.date) > new Date(b.commit.author.date)) then -1 else 1

		# date objects representing the first/last commit dates, days between
		date0 = new Date(data[data.length - 1].commit.author.date)
		dateN = new Date(data[0].commit.author.date)
		days = Math.floor((dateN - date0) / 86400000) + 1

		# map authors and indexes
		uniqueAuthors = []
		authorMap = {}
		data.forEach((datum) ->
			name = datum.commit.author.name
			if (uniqueAuthors.indexOf(name) is -1)
				authorMap[name] = uniqueAuthors.length
				uniqueAuthors.push(name)
			)

		# build data for d3
		formattedData = []
		formattedData.length = uniqueAuthors.length
		for i in [0...formattedData.length] by 1
			formattedData[i] = []
			formattedData[i].length = days
			for j in [0...formattedData[i].length] by 1
				formattedData[i][j] =
					x: j
					y: 0

		data.forEach((datum) ->
			date = new Date(datum.commit.author.date)
			currentDate = Math.floor((date - date0) / 86400000)
			formattedData[authorMap[datum.commit.author.name]][currentDate].y += 1
			formattedData[0][currentDate].date = readableDate(date)
			)

		# add author names to data for the chart's key
		for i in [0...uniqueAuthors.length] by 1
			formattedData[i][0].user = uniqueAuthors[i]

		return formattedData

	$scope.getCommitData = ->
		$http(
			method: 'GET'
			url:    'https://api.github.com/repos' + "#{$scope.user}/#{$scope.repo}/commits"
			).success((data) ->
				# attach this data to the scope
				$scope.data = formatGithubResponse(data)
				$scope.error = ''
			).error((data, status) ->
				$scope.error = if (status is 404) then 'repos does not exist' else "Error: #{status}"
			)
	$scope.getCommitData()