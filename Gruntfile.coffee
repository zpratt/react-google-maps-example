module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'

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
                bundleOptions:
#                    standalone: 'app.overlay'
                    debug: true
            dist:
                files: [
                    src: [
                        'index.js'
                    ]
                    dest: 'dist/app.js'
                    ext: '.js'
                ]

    grunt.loadNpmTasks 'grunt-browserify'
    grunt.loadNpmTasks 'grunt-react'

    grunt.registerTask 'default', ['react', 'browserify']
