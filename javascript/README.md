Introduction
---
> Contained in this repository are various examples of unit testing in JavaScript using different libraries and plugins.

Requirements
---
Development environment is setup to use [grunt](http://gruntjs.com/). This allows for defining tasks (through its plugin system) that aide in development of JavaScript projects such as linting, unit testing and - most importantly - deploying the optimized client for production.

As such, [node](http://nodejs.org), [npm](https://npmjs.org/) and [grunt](http://gruntjs.com/) (>=0.4.0) are required to properly deploy the application. If any of these are not available on your machine, please perform the following:

###Download and install node###
[http://nodejs.org/download/](http://nodejs.org/download/)

###Install npm###
$> __curl http://npmjs.org/install.sh | sh__

###Install grunt CLI###
$> __npm install -g grunt-cli__

###Once the proper dependencies are installed:###
Point your command terminal to the /javascript project directory and run the following command:

$> __npm install__

The previous command will read the _package.json_ file and install needed node module dependencies for the project.

###Per project###
Similar to the install of node modules for the overall /javascript repository, some examples may use [bower](https://github.com/twitter/bower) as a client-side library manager. __Bower__ needs to be installed through __npm__ globally. 
After installing node and npm, to install __bower__ run the following command:

$> npm install -g bower

Within each /javascript example, if a _component.js_ or _bower.js_ file available, point your commmand terminal to the target example and run the following command:

$> __bower install__