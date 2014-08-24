module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'

        browserify:
            options:
                transform: ['reactify']
                debug: true
            all:
                files: [
                    src: [
#                        'node_modules/lodash/dist/lodash.js'
#                        'node_modules/react/dist/react.js'
                        'jsx/*.jsx'
                        'lib/*.js'
                    ]
                    dest: 'dist/app.js'
                    ext: '.js'
                ]

    grunt.loadNpmTasks 'grunt-browserify'

    grunt.registerTask 'default', ['browserify']
