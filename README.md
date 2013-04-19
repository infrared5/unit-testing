Introduction
===
> The purpose of this repository is to document examples of unit testing across multiple languages and libraries.


Criteria
===
The examples - across different languages and libraries - will be structured similarly so as to be easily discernable by developer's who may not be familiar but are interested in common practice for testing within a particular programming language.

As such, it is the intent of each example to demonstrate writing unit tests for the following Acceptance Criteria. The following provides User Stories, with defined criteria and features to be addressed in each programming language (+library) example:

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

Syntax & Structure
===
It is preferrable to structure tests using a Behaviour-Driven-Development (BDD) methodology - at least syntax-wise. Though unit tests focused on particular output of a single method based on varying input may be required, it is recommend to setup the tests to prove a scenarios of a feature. Typically this means:

* <b>Given</b>s are defined at the top of a test case
* <b>When</b>s are descibed in set-up
* <b>Then</b>s are expectations within each test

That is a loose rule from which there may be variants based on the test, but generally how tests should be structured. Following such a format allows for developers to easily read and ascertain the feature and scenarios under the test.