/*global module:false*/
/**
 * For grunt ~0.4.0 only.
 * https://github.com/gruntjs/grunt/wiki/Upgrading-from-0.3-to-0.4
 */
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('./package.json'),
    watch: {
      gruntfile: {
        files: ['Gruntfile.js'],
        tasks: ['jshint']
      },
      scripts: {
        files: ['common/**/*.js'],
        tasks: ['jshint']
      },
      requiretests: {
        files: ['jasmine-require/spec/**/*.spec.js'],
        tasks: ['jshint', 'jasmine:require']
      }
    },
    jshint: {
      files: ['Gruntfile.js', 'common/**/*.js', 'jasmine-require/spec/**/*.spec.js'],
      options: {
        strict: false,
        curly: true,
        eqeqeq: true,
        immed: true,
        latedef: false,
        newcap: true,
        noarg: true,
        sub: true,
        undef: true,
        boss: true,
        eqnull: true,
        es5: true,
        loopfunc: true,
        // trailing: true,
        browser: true,
        node: false,
        globals: {
          console: true,
          jQuery: true,
          require: true,
          requirejs: true,
          define: true,
          Handlebars: true,
          Sammy: true,
          jasmine: true,
          describe: true,
          it: true,
          beforeEach: true,
          afterEach: true,
          expect: true,
          AsyncSpec: true,
          spyOn: true,
          sinon: true
        }
      }
    },
    jasmine: {
      // add other repository examples here...
      require: {
        src: 'common/**/*.js',
        options: {
          junit: {
            path: './jasmine-require/output/testresults'
          },
          specs: './jasmine-require/spec/**/*.spec.js',
          template: require('grunt-template-jasmine-istanbul'),
          templateOptions: {
            coverage: './jasmine-require/output/coverage/coverage.json',
            report: [
                {type: 'html', options: {dir: './jasmine-require/output/coverage'}},
                {type: 'cobertura', options: {dir: './jasmine-require/output/coverage/cobertura'}},
                {type: 'text-summary'}
            ],
            template: require('./jasmine-require/grunt/template-jasmine'),
            templateOptions: {
              requireConfig: {
                // set base url as .grunt/grunt-contrib-jasmine.
                baseUrl: '.grunt/grunt-contrib-jasmine',
                paths: {
                  // define specs relative to baseUrl.
                  "spec": "../../jasmine-require/spec",
                  // define source relative to current working directory.
                  "script": "./common/script/amd"
                },
                config: {
                  'script/user-service': {
                    endpoint: 'http://localhost:3001'
                  }
                }
              }
            }
          }
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-jasmine');

  // simple lint and test
  grunt.registerTask('default', ['jshint', 'jasmine:require']);
  grunt.registerTask('jasmine-require', ['jshint', 'jasmine:require']);
};