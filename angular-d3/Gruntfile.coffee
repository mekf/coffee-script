module.exports = (grunt) ->
	grunt.initConfig
		pkg: grunt.file.readJSON('package.json')

		clean:
			files: ['tmp/']

		haml:
			app:
				files: [
					expand: true,
					cwd:    './_app',
					src:    ['*.haml'],
					dest:   'app',
					ext:    '.html'
				]

		sass:
			dist:
				files: [
					expand: true,
					cwd:    './_app/css',
					src:    ['*.scss'],
					dest:   'app/css',
					ext:    '.css'
				]

		coffee:
			scripts:
				files: [
					expand: true,
					cwd:    './_app/js',
					src:    ['*.coffee'],
					dest:   'app/js',
					ext:    '.js'
				]

		watch:
			js:
				files: ['_app/js/*']
				tasks: ['coffee']

			css:
				files: ['_app/css/*']
				tasks: ['sass']

			haml:
				files: ['_app/*']
				tasks: ['haml']

	grunt.loadNpmTasks('grunt-haml')
	grunt.loadNpmTasks('grunt-contrib-coffee')
	grunt.loadNpmTasks('grunt-contrib-sass')
	grunt.loadNpmTasks('grunt-haml')
	grunt.loadNpmTasks('grunt-contrib-clean')
	grunt.loadNpmTasks('grunt-contrib-watch')

	grunt.registerTask 'default', ['clean', 'haml', 'coffee', 'sass']