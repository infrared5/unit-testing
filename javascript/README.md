Introduction
---
> Contained in this repository are various examples of unit testing in JavaScript using different libraries and plugins.

Requirements
---
Development environment is setup to use grunt. This allows for defining tasks (through its plugin system) that aide in development of JavaScript projects such as linting, unit testing and - most importantly - deploying the optimized client for production.

As such, node, npm and grunt (>=0.4.0) are required to properly deploy the application. If any of these are not available on your machine, please perform the following:

###Download and install node###
http://nodejs.org/download/

###Install npm###
$> __curl http://npmjs.org/install.sh | sh__

###Install grunt CLI###
$> __npm install -g grunt-cli__

Once the proper dependencies are installed:
---
cd into the project directory and run the following command:

$> __npm install__

The previous command will read the _package.json_ file and install needed node module dependencies for the project.