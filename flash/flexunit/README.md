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

User Story
---
	**As an** administrator
	**I want to** manage user accounts
	**So that I** can add and remove users from the system directly

Criteria
---
* Can access all user accounts
* Can add new user
* Can remove existing user

Feature Specifications
---

**Feature**: Access User Accounts

	_Scenario_: Access user accounts.
	**Given** I am an administrator
	**When** I request all user accounts
	**Then** The Session model is updated with receieved User models

**Feature**: Add User Account

	_Scenario_: Add a non-existing account.
	*Given* I am an administrator
	*When* I request to add a user
	*And* The user is not available in the system
	*Then* The Session model is updated with the User account added

_Scenario_: Add an existing account.
*Given* I am an administrator
*When* I request to add a user
*And* The user is already available in the system determined by id property value
*Then* The Session model is unaffected

**Feature**: Remove User Account

_Scenario_: Remove an existing account.
*Given* I am an administrator
*When* I request to delete a user
*And* The user is existing in the system
*Then* The Session model is updated with the User account removed

_Scenario_: Remove a non-existing account.
*Given* I am an administrator
*When* I Request to delete a user
*And* The user is not existing in the system
*Then* The Session model is unaffected

Todo
===
**Resolve dependency on FB 4.x:**

* setup scripts to download required libraries.
* ANT scripts to build projects (also demonstrate integration with CI).




