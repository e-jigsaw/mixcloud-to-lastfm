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
	watch:
			files: ["grunt.coffee", "*.jade"]
			tasks: "coffee jade"

		grunt.loadNpmTasks "grunt-coffee"
		grunt.loadNpmTasks "grunt-contrib"

		grunt.registerTask "default", "watch"