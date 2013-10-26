# Generated on 2013-10-05 using generator-angular 0.4.0
#
# Apply revisions of:
#   http://newtriks.com/2013/06/11/automating-angularjs-with-yeoman-grunt-and-bower/

"use strict"

LIVERELOAD_PORT = 35729

lrSnippet = require("connect-livereload")(port: LIVERELOAD_PORT)

mountFolder = (connect, dir) ->
  connect.static require("path").resolve(dir)


# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to recursively match all subfolders:
# 'test/spec/**/*.js'
module.exports = (grunt) ->
  require("load-grunt-tasks") grunt
  require("time-grunt") grunt
  
  # configurable paths
  yeomanConfig =
    app: "app"
    dist: "dist"

  try
    yeomanConfig.app = require("./bower.json").appPath or yeomanConfig.app

  grunt.initConfig
    yeoman: yeomanConfig

    watch:
      coffee:
        files: ["<%= yeoman.app %>/scripts/{,*/}*.coffee"]
        tasks: ["coffee:dist", "env"]

      jade:
        files: ["<%= yeoman.app %>/{,**/}*.jade"]
        #tasks: ["jade:dist"]
        tasks: ["jade"]

      stylus:
        files: ["<%= yeoman.app %>/{,*/}*.styl"]
        tasks: ["stylus:dist"]

      coffeeTest:
        files: ["test/spec/{,*/}*.coffee"]
        tasks: ["coffee:test"]

      styles:
        files: ["<%= yeoman.app %>/styles/{,*/}*.css"]
        tasks: ["copy:styles", "autoprefixer"]

      livereload:
        options:
          livereload: LIVERELOAD_PORT

        files: [
          "<%= yeoman.app %>/{,*/}*.html"
          #"{.tmp,<%= yeoman.app %>}/styles/{,*/}*.css"
          "{.tmp,<%= yeoman.app %>}/styles/{,*/}*.css"
          "{.tmp,<%= yeoman.app %>}/scripts/{,*/}*.js"
          "<%= yeoman.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"
        ]

    autoprefixer:
      options: ["last 1 version"]
      dist:
        files: [
          expand: true
          cwd: ".tmp/styles/"
          src: "{,*/}*.css"
          dest: ".tmp/styles/"
        ]

    connect:
      options:
        port: 9000
        
        # Change this to '0.0.0.0' to access the server from outside.
        hostname: "localhost"

      livereload:
        options:
          middleware: (connect) -> [
            lrSnippet
            mountFolder connect, ".tmp"
            mountFolder connect, yeomanConfig.app

            # for CORS
            (request, response, next) ->
              response.setHeader 'Access-Control-Allow-Origin', '*'
              response.setHeader 'Access-Control-Allow-Methods', '*'
              next()
          ]

      test:
        options:
          port: 9001
          middleware: (connect) -> [
            mountFolder connect, ".tmp"
            mountFolder connect, "test"
          ]

      dist:
        options:
          middleware: (connect) -> [
            mountFolder connect
            yeomanConfig.dist
          ]

    open:
      server:
        url: "http://localhost:<%= connect.options.port %>"
        app: "/usr/share/iron/iron"

    clean:
      dist:
        files: [
          dot: true
          src: [
            ".tmp"
            "<%= yeoman.dist %>/*"
            "!<%= yeoman.dist %>/.git*"
          ]
        ]

      server: ".tmp"

    jshint:
      options:
        jshintrc: ".jshintrc"

      all: [
        "Gruntfile.js"
        "<%= yeoman.app %>/scripts/{,*/}*.js"
      ]

    coffee:
      options:
        sourceMap: true
        sourceRoot: ""

      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/scripts"
          src: "{,*/}*.coffee"
          dest: ".tmp/scripts"
          ext: ".js"
        ]

      test:
        files: [
          expand: true
          cwd: "test/spec"
          src: "{,*/}*.coffee"
          dest: ".tmp/spec"
          ext: ".js"
        ]

    jade:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/views"
          src: "{,*/}*.jade"
          #src: "{,**/}*.jade"
          dest: ".tmp/views"
          ext: ".html"
        ]

      index:
        options:
          pretty: true  # for collapse comment for uglify

        files: [
          expand: true
          cwd: "<%= yeoman.app %>"
          src: "index.jade"
          dest: ".tmp"
          ext: ".html"
        ]

    stylus:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/styles"
          src: "{,*/}*.styl"
          dest: ".tmp/styles"
          ext: ".css"
        ]
    
    'string-replace':
      default:
        files:
          '.tmp/scripts/app.js': '.tmp/scripts/app.js'

        options:
          replacements: [
            pattern: '$API_ROOT_URL'
            replacement: "/_ah/api"
          ]

      dev:
        files:
          '.tmp/scripts/app.js': '.tmp/scripts/app.js'

        options:
          replacements: [
            pattern: '$API_ROOT_URL'
            replacement: "http://localhost:8080/_ah/api"
          ]

      pro:
        files:
          '.tmp/scripts/app.js': '.tmp/scripts/app.js'

        options:
          replacements: [
            pattern: '$API_ROOT_URL'
            replacement: "https://curious-subject-248.appspot.com/_ah/api"
          ]


    # not used since Uglify task does concat,
    # but still available if needed
    concat:
      modules:
        src: [
          "<%= yeoman.app %>/bower_components/angular-resource/angular-resource.js"
          "<%= yeoman.app %>/bower_components/angular-cookies/angular-cookies.js"
          "<%= yeoman.app %>/bower_components/angular-sanitize/angular-sanitize.js"
        ]
        dest: "<%= yeoman.dist %>/scripts/modules.js"

      scripts:
        src: [
          ".tmp/scripts/**/*.js"
        ]
        dest: "<%= yeoman.dist %>/scripts/scripts.js"

    rev:
      dist:
        files:
          src: [
            "<%= yeoman.dist %>/scripts/{,*/}*.js"
            "<%= yeoman.dist %>/styles/{,*/}*.css"
            "<%= yeoman.dist %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"
            "<%= yeoman.dist %>/styles/fonts/*"
          ]

    useminPrepare:
      html: "<%= yeoman.app %>/index.html"
      options:
        dest: "<%= yeoman.dist %>"

    usemin:
      html: ["<%= yeoman.dist %>/{,*/}*.html"]
      css: ["<%= yeoman.dist %>/styles/{,*/}*.css"]
      options:
        dirs: ["<%= yeoman.dist %>"]

    imagemin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/images"
          src: "{,*/}*.{png,jpg,jpeg}"
          dest: "<%= yeoman.dist %>/images"
        ]

    svgmin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/images"
          src: "{,*/}*.svg"
          dest: "<%= yeoman.dist %>/images"
        ]

    cssmin:
      # By default, your `index.html` <!-- Usemin Block --> will take care of
      # minification. This option is pre-configured if you do not wish to use
      # Usemin blocks.
      dist:
        files:
          '<%= yeoman.dist %>/styles/main.css': [
            '.tmp/styles/{,*/}*.css'
            '<%= yeoman.app %>/styles/{,*/}*.css'
          ]

    htmlmin:
      dist:
        options: {}
          #removeCommentsFromCDATA: true,
          # #https://github.com/yeoman/grunt-usemin/issues/44
          # #collapseWhitespace: true,
          #collapseBooleanAttributes: true,
          #removeAttributeQuotes: true,
          #removeRedundantAttributes: true,
          #useShortDoctype: true,
          #removeEmptyAttributes: true,
          #removeOptionalTags: true

        files: [
          expand: true
          cwd: "<%= yeoman.app %>"
          src: [
            "*.html"
            "views/*.html"
          ]
          dest: "<%= yeoman.dist %>"
        ]

    
    # Put files not handled in other tasks here
    copy:
      dist:
        files: [
          expand: true
          dot: true
          cwd: "<%= yeoman.app %>"
          dest: "<%= yeoman.dist %>"
          src: [
            "*.{ico,png,txt}"
            ".htaccess"
            "bower_components/**/*"
            "images/{,*/}*.{gif,webp}"
            "styles/fonts/*"
          ]
        ,
          expand: true
          cwd: ".tmp/images"
          dest: "<%= yeoman.dist %>/images"
          src: ["generated/*"]
        ,
          # for compiled files (jade, stylus)
          expand: true
          cwd: ".tmp"
          dest: "<%= yeoman.dist %>"
          src: [
            "index.html"
            "scripts/**/*"
            "views/**/*"
            "styles/**/*"
          ]
        ]

      styles:
        expand: true
        cwd: "<%= yeoman.app %>/styles"
        dest: ".tmp/styles/"
        src: "{,*/}*.css"

    concurrent:
      server: [
        "coffee:dist"
        #"jade:dist"
        "jade"
        "stylus:dist"
        "copy:styles"
      ]
      test: [
        "coffee"
        "jade"  # "jade:dist"
        "copy:styles"
      ]
      dist: [
        "coffee"
        "jade"
        "stylus"
        "copy:styles"
        "imagemin"
        "svgmin"
        "htmlmin"
      ]

    karma:
      unit:
        configFile: "karma.conf.js"
        runnerPort: 9002
        singleRun: false
      midway:
        configFile: "karma-midway.conf.js"
        runnerPort: 9003
        singleRun: false
      e2e:
        configFile: "karma-e2e.conf.js"
        runnerPort: 9004
        singleRun: false

    cdnify:
      dist:
        html: ["<%= yeoman.dist %>/*.html"]

    ngmin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.dist %>/scripts"
          src: "*.js"
          dest: "<%= yeoman.dist %>/scripts"
        ]

    uglify:
      dist:
        files:
          "<%= yeoman.dist %>/scripts/scripts.js": [
            "<%= yeoman.dist %>/scripts/scripts.js"
          ]

      #dist:
      #  options:
      #    sourceMap: (fileName) ->
      #      fileName.replace /\.js$/, '.js.map'

      #  files:
      #    "<%= yeoman.dist %>/scripts/scripts.js": [
      #      ".tmp/scripts/app.js"
      #      ".tmp/scripts/services/**/*.js"
      #      ".tmp/scripts/controllers/**/*.js"
      #    ]
      #    "<%= yeoman.dist %>/scripts/modules.js": [
      #      "<%= yeoman.app %>/bower_components/angular-resource/angular-resource.js"
      #      "<%= yeoman.app %>/bower_components/angular-cookies/angular-cookies.js"
      #      "<%= yeoman.app %>/bower_components/angular-sanitize/angular-sanitize.js"
      #    ]


  grunt.registerTask "server", (target) ->
    return grunt.task.run [
      "build"
      "open"
      "connect:dist:keepalive"
    ] if target is "dist"

    grunt.task.run [
      "clean:server"
      "concurrent:server"
      "env"
      "autoprefixer"
      "connect:livereload"
      "open"
      "watch"
    ]

  grunt.registerTask "test:common", [
    "clean:server"
    "concurrent:test"
    "env"
    "autoprefixer"
    "connect:test"
  ]

  grunt.registerTask "test:unit", [
    "test:common"
    "karma:unit"
  ]

  grunt.registerTask "test:mid", [
    "test:common"
    "karma:midway"
  ]

  grunt.registerTask "test:e2e", [
    "test:common"
    "karma:e2e"
  ]

  grunt.registerTask "build", [
    "clean:dist"
    "useminPrepare"
    "concurrent:dist"
    "env"
    "autoprefixer"
    "concat"
    "copy:dist"
    "cdnify"
    "ngmin"
    "cssmin"
    #"uglify"
    "rev"
    "usemin"
  ]

  grunt.registerTask "deploy", ->
    grunt.config.set 'yeoman.dist', 'backend/public'
    return grunt.task.run ["build"]

  grunt.registerTask "env", ->
    env = grunt.option 'env'
    env = "default" unless env
    return grunt.task.run ["string-replace:" + env]
    
  grunt.registerTask "default", [
    "jshint"
    "test"
    "build"
  ]

