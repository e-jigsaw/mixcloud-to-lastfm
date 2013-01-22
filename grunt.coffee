# grut config
module.exports = (grunt)->
	grunt.initConfig
		pkg: "<json:package.json>"
		coffee:
			self:
				files:
					"grunt.js": ["grunt.coffee"]
				options:
					bare: true
			scrobble:
				files:
					"scrobble.js": ["config.coffee", "scrobble.coffee"]
				options:
					bare: true
		watch:
			files: ["*.coffee"]
			tasks: "coffee"

		grunt.loadNpmTasks "grunt-coffee"
		grunt.loadNpmTasks "grunt-contrib"

		grunt.registerTask "default", "watch"