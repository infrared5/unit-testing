Introduction
===
> Example of an ActionScript project that incorporates [FlexUnit](https://github.com/flexunit/flexunit) testing with [mockolate](https://github.com/drewbourne/mockolate) for mocks/stubs/spies. Though it is an ActionScript project, example can translate to Flex project as they both utilize the [Flex SDK](http://sourceforge.net/adobe/flexsdk/wiki/Download%20Flex%204.6/).

Requirements
===
The examples are written as a web-based ActionScript project and were built against Flex SDK 4.6 with FlexUnit 4.1, but should be comparible to any 4.x versions of both the Flex SDK and FlexUnit.

* [Flex SDK 4.x](http://sourceforge.net/adobe/flexsdk/wiki/Download%20Flex%204.6/) (only tested with releases under Adobe, not Apache)
* [FlexUnit 4.x](https://github.com/flexunit/flexunit)
* [mockolate](https://github.com/drewbourne/mockolate)

Included in the example directories are Eclipse project files to easily get setup and working in [Flash Builder 4.x](http://www.adobe.com/products/flash-builder.html).

Running the Tests
===

##Flash Builder 4.x Standalone/Plugin
**Flash Builder** has support for generating and running **FlexUnit** tests integrated into the IDE. This allows for such niceties such as right-clicking on a class file and selecting _New… > Test Case_ that is focused on that reference. It also auto-magically sets up and maintains a testrunner if used in such a manner. During development, such practice is the preferred method of generating and curating tests.

To run the tests within **Flash Builder**:

1. Right-click on _flexunit_ project in workspace
2. Select Run As… > FlexUnit Tests

The testrunner should launch in an external browser (the one set as default in Flash Builder settings). As well, a GUI testrunner panel (**FlexUnit Results**) within Flash Builder should open/focus. This panel will provide better information for any failing tests.

##Continuous Integration (CI) Server
Included in this project is a _ci_build.xml_ file that can serve as an example of how to setup headless testing using **FlexUnit** on an CI server. It is based off of a project that integrates with **Jenkins** and may need to be modified for other CI servers. If modifications are made, please document and provide a targeting build file.


Todo
===
**Resolve dependency on FB 4.x:**

* setup scripts to download required libraries.
* ANT scripts to build projects (also demonstrate integration with CI).




