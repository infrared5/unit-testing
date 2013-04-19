Introduction
---
> Contained in this repository are various examples of unit testing in JavaScript using different libraries and plugins.

Requirements
---
Development environment is setup to use [grunt](http://gruntjs.com/). This allows for defining tasks (through its plugin system) that aide in development of JavaScript projects such as linting, unit testing and - most importantly - deploying the optimized client for production.

As such, [node](http://nodejs.org), [npm](https://npmjs.org/) and [grunt](http://gruntjs.com/) (>=0.4.0) are required to properly deploy the application. If any of these are not available on your machine, please perform the following:

###Download and install node
[http://nodejs.org/download/](http://nodejs.org/download/)

###Install npm
[npm](https://npmjs.org/) is a node package manager.

$> __curl http://npmjs.org/install.sh | sh__

###Install grunt CLI globally
[grunt](http://gruntjs.com/) is a build tool that makes running specific tasks easy.

$> __npm install -g grunt-cli__

###Install bower globally
[bower](https://github.com/twitter/bower) is a client-side library manager. Libraries are stored in this top-level directory in a _/components_ directory.

$> __npm install -g bower__

Once the proper dependencies are installed:
---
### npm
Point your command terminal to the _/javascript_ project directory and run the following command:

$> __npm install__

This command will read the _package.json_ file and install needed node module dependencies for the project.

### bower
If a _component.js_ or _bower.js_ file is available in the top-level _/javascript_ directory, also run the following command:

$> __bower install__

This command will read the _component.js/bower.js_ file and download associated library files from github.

If you want to add another javascript library dependency to the project please use the following command so the _component.js/bower.js_ file will be maintained properly:

$> __bower install <lib> --save-dev__

Running the Tests
---
Tasks for each example under this top-level repository should be added to the _Gruntfile.js_ and run using the [grunt](http://gruntjs.com/) command-line tool with a defined task name. 

###jasmine-require task
The __jasmine-require__ example - which demonstrates writing test using __Jasmine__ and __RequireJS__ - has a task entry in the _Gruntfile.js_. The __jasmine-require__ task utilizes the __grunt-contrib-jasmine__ task library (listed as a dependency and installed using npm) to define dependencies and support files through configuration:

	jasmine: {
    	require: {
	      src: 'common/**/*.js',
    	  options: {
	        specs: 'jasmine-require/spec/**/*.spec.js',
    	    template: require('./jasmine-require/grunt/template-jasmine'),
	        templateOptions: {
    	      requireConfig: {
        	    baseUrl: '.',
            	paths: {
	              "spec": "./jasmine-require/spec",
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
	
The _jasmine_ directive defines the use of the __grunt-contrib-jasmine__ task. Configurations defined on the directive can take whatever name desired (in this case, that is _'require'_) and requires the proper configuration properties. Please refer to the [grunt-contrib-jasmine](https://github.com/gruntjs/grunt-contrib-jasmine) documentation for more information.

The __jasmine-require__ task is then accessed using the following notation:

&lt;grunt_task_name&gt;:&lt;target_name&gt;

Using this notation, you would run the __jasmine-require__ tests under __grunt-contrib-jasmine__ by using the following command:

$> __grunt jasmine:require__

####shorthand
A shorthand taskname has been defined to lint the files prior to running this command is defined in the _Gruntfile.js_ file:

	grunt.registerTask('jasmine-require', ['jshint', 'jasmine:require']);
	
As such, the following command could be run, as well:

$> __grunt jasmine-require__

Once run, you will see the details of the tests printed out in the terminal. 