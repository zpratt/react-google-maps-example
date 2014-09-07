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

        browserify:
            options:
                external: ['google']
                transform: ['reactify', 'coffeeify']
                bundleOptions:
#                    standalone: 'app.overlay'
                    debug: true
            dist:
                files: [
                    src: [
                        'index.jsx'
                    ]
                    dest: 'dist/js/<%= pkg.name %>.js'
                    ext: '.js'
                ]

        mochaTest:
            test:
                options:
                    reporter: 'spec'
                    require: 'coffee-script/register'
                src: ['test/**/*.spec.coffee']

    require('load-grunt-tasks')(grunt)
    require('time-grunt')(grunt)

    grunt.registerTask 'test', ['jshint', 'coffeelint', 'mochaTest']
    grunt.registerTask 'default', ['test', 'sass', 'browserify']
