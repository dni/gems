module.exports = (grunt)->

  grunt.registerTask 'install', 'Install the App', [
    'mkdir:all'
    'copy:libs'
  ]

  grunt.registerTask 'build', 'Compiles all of the assets and copies the files to the build directory.', [
    'clean:build'
    'requirejs'
  ]


  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-mkdir'

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    mkdir: all: options: create: ["vendor"]

    clean: build: src: [ 'build' ]

    watch:
      less:
        files: "components/**/*.less"
        tasks: ["less"]

    copy:
      libs:
        files: [
          {src: 'bower_components/requirejs/require.js', dest:'vendor/require.js'},
          {src: 'bower_components/require-less/less.js', dest:'vendor/less.js'},
          {src: 'bower_components/require-less/normalize.js', dest:'vendor/normalize.js'},
          {src: 'bower_components/require-less/less-builder.js', dest:'vendor/less-builder.js'},
          {src: 'bower_components/require-less/lessc.js', dest:'vendor/lessc.js'},
          {src: 'bower_components/require-cs/cs.js', dest:'vendor/cs.js'},
          {src: 'bower_components/coffeescript/extras/coffee-script.js', dest:'vendor/coffee-script.js'},
          # deps end ;)
          {src: 'bower_components/d3/d3.js', dest:'vendor/d3.js'}
        ]

    requirejs:
      cms:
        options:
          appDir: 'src'
          baseUrl: 'vendor'
          fileExclusionRegExp: /^(server|spec)/
          dir: "build"
          optimizeAllPluginResources: true,
          findNestedDependencies: true,
          stubModules: ['less', 'css', 'cs', 'coffee-script'],
          modules: [{
            name: 'config'
            include: "src/main"
            exclude: ['coffee-script', 'css', 'less']
          }]
          optimize : 'uglify2',
          paths:
            config: '../config'

  return grunt
