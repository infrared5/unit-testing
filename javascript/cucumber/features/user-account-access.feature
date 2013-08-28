Feature: User Account Access
  As an administrator
  I want to access all user accounts
  So that I can view information about each user

  Scenario: User Accounts Accessible
    Given I am an administrator
    When I request all user accounts
    Then the Session model is updated with received User models