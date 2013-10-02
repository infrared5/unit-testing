Feature: Add User
  As an administrator
  I want to add a new user
  So that I can manage the addition of accounts in the system

  Scenario: User Account with Unique ID Added
    Given I am an administrator
    When I request to add a user
    And The user id is not available in the system
    Then The Session model is updated with the User account added

  Scenario: User Account with Non-Unique Not Added
    Given I am an administrator
    When I request to add a user
    And The user id is already existant in the system
    Then The Session model is unaffected