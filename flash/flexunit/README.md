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

**As an** administrator

**I want to** access all user accounts

**So that I** view each user information

###Criteria

* Can access all user accounts
* Can access properties of each user account

###Feature: User accounts are accessible to Admin

**Given** I am an administrator

**When** I request all user accounts

**Then** The Session model is updated with receieved User models

###Feature: User account is accessible to Admin

**Given** I am an administrator

**And** User accounts are available on the Session model

**When** I access a User from the list

**Then** I can view that User's account details

---

User story: Add User
---

**As an** administrator

**I want to** add a new user

**So that I** can manage the addition of accounts

###Criteria

* Can add a new user account if id is unique
* Cannot add a new user if id is already in system


###Feature: User account with unique id added

**Given** I am an administrator

**When** I request to add a user

**And** The user id is not available in the system

**Then** The Session model is updated with the User account added

###Feature: User with non-unique id not added

**Given** I am an administrator

**When** I request to add a user

**And** The user id is already existant in the system

**Then** The Session model is unaffected


Todo
===
**Resolve dependency on FB 4.x:**

* setup scripts to download required libraries.
* ANT scripts to build projects (also demonstrate integration with CI).




