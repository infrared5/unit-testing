Introduction
---
> Contained in this repository are various examples of functional testing for visual presentation of web stack, such as html+css.

Requirements
---
Development environment is setup to use [grunt](http://gruntjs.com/). This allows for defining tasks (through its plugin system) that aide in development of JavaScript projects such as linting, unit testing and - most importantly - deploying the optimized client for production.

As such, [node](http://nodejs.org), [npm](https://npmjs.org/) and [grunt](http://gruntjs.com/) (>=0.4.0) are required to properly deploy the application. If any of these are not available on your machine, please perform the following:

###Download and install node
[http://nodejs.org/download/](http://nodejs.org/download/)

###Install npm
[npm](https://npmjs.org/) is a node package manager.

```
$> curl http://npmjs.org/install.sh | sh
```

###Install grunt CLI globally
[grunt](http://gruntjs.com/) is a build tool that makes running specific tasks easy.

```
$> npm install -g grunt-cli
```
###Download and install PhantomJS
[PhantomJS](http://phantomjs.org/) is a headless WebKit and allows for DOM traversal and navigation.

To download and install __PhantomJS__:
* Navigate to the [download](http://phantomjs.org/download.html)
* Expand the download somewhere on your system where you will likely keep software (for the purposes of this example, we'll say _/User/ir5/software/phantomjs_)
* Create a symlink for phantomjs to your _/usr/local/bin_ directory so that it is invokable from the command line:
```  
sudo ln -s /User/ir5/software/phantomjs/bin/phantomjs /usr/local/bin/phantomjs
```
###Download and install CasperJS
The Casper task utilizes the [CasperJS](http://casperjs.org/) utility to perform DOM navigation and functional testing.

To download and install __CasperJS__:
* Clone the CasperJS git repo on your system:
```
git clone git://github.com/n1k0/casperjs.git /User/ir5/software/casperjs
```  
* Create a symlink for casperjs to your _/usr/local/bin_ directory so that it is invokable from the command line:
```
sudo ln -s /User/ir5/software/casperjs/bin/casperjs /usr/local/bin/casperjs
```

Once the proper dependencies are installed:
---
### npm
Point your command terminal to the _/javascript_ project directory and run the following command:
```
$> npm install
```
This command will read the _package.json_ file and install needed node module dependencies for the project.

Running the Tests
---
Tasks for each example under this top-level repository should be added to the _Gruntfile.js_ and run using the [grunt](http://gruntjs.com/) command-line tool with a defined task name.

###casper task
```
$> grunt casper
```
The casper task starts a server on localhost at port 8124, then runs each casper test found in _casper/test_ directory. Each test loads the default page defined as the static directory for the connect server: __http://localhost:8124/index.html__

Have a look at the tests in [casper/test](https://github.com/infrared5/unit-testing/tree/master/html/casperjs/test) as well as the [CapserJS](http://docs.casperjs.org/en/latest/modules/index.html) documentation for [Casper object](http://docs.casperjs.org/en/latest/modules/casper.html) and [test assertions](http://docs.casperjs.org/en/latest/modules/tester.html).