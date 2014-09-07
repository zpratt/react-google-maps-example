module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'

        jshint:
            options:
                jshintrc: '.jshintrc',
            production:
                src: [
                    'lib/*.js'
                ]

        coffeelint:
            options:
                indentation:
                    level: 'error'
                    value: 4
                max_line_length:
                    level: 'error'
                    value: 90

            tests: [
                'test/*.coffee'
            ]

            gruntFile: 'Gruntfile.coffee'

        sass:
            dist:
                files:
                    'dist/css/index.css': 'sass/index.scss'

        react:
            dist:
                options:
                    extension: 'js'
                    ignoreMTime: false
                files:
                    'lib/overlay-component.js' : ['jsx/overlay-component.jsx']
                    'index.js' : ['jsx/index.jsx']

        browserify:
            options:
#                transform: ['reactify']
                external: ['google']
                transform: ['coffeeify']
                bundleOptions:
#                    standalone: 'app.overlay'
                    debug: true
            dist:
                files: [
                    src: [
                        'index.js'
                    ]
#                    dest: 'dist/app.js'
                    dest: 'dist/js/<%= pkg.name %>.js'
                    ext: '.js'
                ]

        mochaTest:
            test:
                options:
                    reporter: 'spec'
                    require: 'coffee-script/register'
                src: ['test/**/*.spec.coffee']

    require('time-grunt')(grunt)

    grunt.loadNpmTasks 'grunt-browserify'
    grunt.loadNpmTasks 'grunt-react'
    grunt.loadNpmTasks 'grunt-contrib-jshint'
    grunt.loadNpmTasks 'grunt-mocha-test'
    grunt.loadNpmTasks 'grunt-coffeelint'
    grunt.loadNpmTasks 'grunt-sass'

    grunt.registerTask 'test', ['jshint', 'coffeelint', 'mochaTest']
    grunt.registerTask 'default', ['test', 'sass', 'react', 'browserify']
