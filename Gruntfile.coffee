# grut config
module.exports = (grunt)->
	grunt.initConfig
		pkg: "<json:package.json>"
		coffee:
			scrobble:
				files:
					"pkg/scrobble.js": ["config.coffee", "scrobble.coffee"]
				options:
					bare: true
		watch:
			files: ["*.coffee"]
			tasks: "coffee"

		grunt.loadNpmTasks "grunt-coffee"
		grunt.loadNpmTasks "grunt-contrib"

		grunt.registerTask "default", "watch"