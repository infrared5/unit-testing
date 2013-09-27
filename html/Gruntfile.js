var connect = require('connect');

/**
 * For grunt ~0.4.0 only.
 * https://github.com/gruntjs/grunt/wiki/Upgrading-from-0.3-to-0.4
 */
module.exports = function(grunt) {

  'use strict';

  var config = {
        app: '.',
        port: '8124'
      };

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('./package.json'),
    watch: {
      gruntfile: {
        files: ['Gruntfile.js'],
        tasks: ['jshint']
      },
      casperjs: {
        files: ['casperjs/test/**/*.js'],
        tasks: ['jshint:casperjs']
      }
    },
    jshint: {
      files: ['Gruntfile.js'],
      casperjs: {
        files: {
          src: ['casperjs/test/**/*.js']
        }
      }
    },
    casperjs: {
      options: {
        async: {
          parallel: false
        }
      },
      files: ['casperjs/test/**/*.js']
    }
  });

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-casperjs');

  grunt.registerTask('casper', function() {
    var baseUrl = require('path').resolve(config.app);
    grunt.log.write('Connect server started on ' + baseUrl + ':' + config.port);
    connect().use(connect.static(baseUrl)).listen(config.port, '0.0.0.0');
    grunt.task.run(['casperjs']);
  });

  // simple lint and test
  grunt.registerTask('default', ['jshint:casperjs', 'casper']);
};
