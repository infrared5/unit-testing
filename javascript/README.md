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
npm is a node package manager.

$> __curl http://npmjs.org/install.sh | sh__

###Install grunt CLI globally
grunt is a build tool that makes running specific tasks easy.

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