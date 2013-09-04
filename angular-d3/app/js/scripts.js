(function() {
  var AppCtrl, angularD3Demo;

  angularD3Demo = angular.module('angularD3Demo', []);

  angularD3Demo.controller('AppCtrl', AppCtrl = function($scope, $http) {
    var formatGithubResponse, readableDate;
    $scope.user = 'angular';
    $scope.repo = 'angular.js';
    readableDate = function(d) {
      return "" + (d.getUTCMonth()) + " / " + (d.getUTCDate());
    };
    formatGithubResponse = function(data) {
      var authorMap, date0, dateN, days, formattedData, i, j, uniqueAuthors, _i, _j, _k, _ref, _ref1, _ref2;
      data.sort(function(a, b) {
        if (new Date(a.commit.author.date) > new Date(b.commit.author.date)) {
          return -1;
        } else {
          return 1;
        }
      });
      date0 = new Date(data[data.length - 1].commit.author.date);
      dateN = new Date(data[0].commit.author.date);
      days = Math.floor((dateN - date0) / 86400000) + 1;
      uniqueAuthors = [];
      authorMap = {};
      data.forEach(function(datum) {
        var name;
        name = datum.commit.author.name;
        if (uniqueAuthors.indexOf(name) === -1) {
          authorMap[name] = uniqueAuthors.length;
          return uniqueAuthors.push(name);
        }
      });
      formattedData = [];
      formattedData.length = uniqueAuthors.length;
      for (i = _i = 0, _ref = formattedData.length; _i < _ref; i = _i += 1) {
        formattedData[i] = [];
        formattedData[i].length = days;
        for (j = _j = 0, _ref1 = formattedData[i].length; _j < _ref1; j = _j += 1) {
          formattedData[i][j] = {
            x: j,
            y: 0
          };
        }
      }
      data.forEach(function(datum) {
        var currentDate, date;
        date = new Date(datum.commit.author.date);
        currentDate = Math.floor((date - date0) / 86400000);
        formattedData[authorMap[datum.commit.author.name]][currentDate].y += 1;
        return formattedData[0][currentDate].date = readableDate(date);
      });
      for (i = _k = 0, _ref2 = uniqueAuthors.length; _k < _ref2; i = _k += 1) {
        formattedData[i][0].user = uniqueAuthors[i];
      }
      return formattedData;
    };
    $scope.getCommitData = function() {
      return $http({
        method: 'GET',
        url: 'https://api.github.com/repos' + ("" + $scope.user + "/" + $scope.repo + "/commits")
      }).success(function(data) {
        $scope.data = formatGithubResponse(data);
        return $scope.error = '';
      }).error(function(data, status) {
        return $scope.error = status === 404 ? 'repos does not exist' : "Error: " + status;
      });
    };
    return $scope.getCommitData();
  });

}).call(this);
