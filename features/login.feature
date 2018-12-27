Feature: Login feature

  @login_1
  Scenario: As User, I should be able to login
    Given the app has launched
    Then remove ads from screen
    Then go to profile
    Then login