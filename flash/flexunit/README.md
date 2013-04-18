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

Criteria
===

User Story: Access
---
<pre>
<b>As an</b> administrator
<b>I want to</b> access all user accounts
<b>So that I</b> view each user information
</pre>

###Criteria

* Can access all user accounts
* Can access properties of each user account

###Feature: User accounts are accessible to Admin
<pre>
<b>Given</b> I am an administrator
<b>When</b> I request all user accounts
<b>Then</b> The Session model is updated with receieved User models
</pre>

###Feature: User account is accessible to Admin
<pre>
<b>Given</b> I am an administrator
<b>And</b> User accounts are available on the Session model
<b>When</b> I access a User from the list
<b>Then</b> I can view that User's account details
</pre>

User story: Add User
---
<pre>
<b>As an</b> administrator
<b>I want to</b> add a new user
<b>So that I</b> can manage the addition of accounts
</pre>

###Criteria

* Can add a new user account if id is unique
* Cannot add a new user if id is already in system


###Feature: User account with unique id added
<pre>
<b>Given</b> I am an administrator
<b>When</b> I request to add a user
<b>And</b> The user id is not available in the system
<b>Then</b> The Session model is updated with the User account added
</pre>

###Feature: User with non-unique id not added
<pre>
<b>Given</b> I am an administrator
<b>When</b> I request to add a user
<b>And</b> The user id is already existant in the system
<b>Then</b> The Session model is unaffected
</pre>

Todo
===
**Resolve dependency on FB 4.x:**

* setup scripts to download required libraries.
* ANT scripts to build projects (also demonstrate integration with CI).




