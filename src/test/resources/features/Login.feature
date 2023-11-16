@login
  Feature: Writing Cucumber Scenarios for login


@login
Scenario: Valid email and valid password combination lets user in
  Given I open url "https://env-jam.portnov.com/"
  And I wait for 1 sec
  When I click on "Log in" page
  Then I open "Log in" page
  And I wait for 1 sec
  Then I type "funkyfox@gssfire.com" into email field
  Then I type "ABC123" into password field
  And I wait for 1 sec
  And I click button "Log in"
  When I open url "https://env-jam.portnov.com/"
  Then I should see "My account" button on upper header
  And I wait for 1 sec

@login2
Scenario: Valid email and incorrect password won't let user in
  Given I open url "https://env-jam.portnov.com/"
  And I wait for 1 sec
  When I click on "Log in" page
  Then I open "Log in" page
  And I wait for 1 sec
  Then I type "funkyfox@gssfire.com" into email field
  Then I type "ABC12345" into password field
  And I click button "Log in"
  Then I get message-error "Login was unsuccessful. Please correct the errors and try again.The credentials provided are incorrect"
  And I wait for 1 sec

  @login3
Scenario: Invalid email and valid password(PWD field Case sensitive)
    Given I open url "https://env-jam.portnov.com/"
    And I wait for 1 sec
    When I click on "Log in" page
    Then I open "Log in" page
    And I wait for 1 sec
    Then I type "funkyfox@gssfire.comm" into email field
    And I type "abc12345" into password field
    And I wait for 1 sec
    And I click button "Log in"
    Then I get message-error "Login was unsuccessful. Please correct the errors and try again.The credentials provided are incorrect"
    And I wait for 1 sec

  @login4
  Scenario: Password field is masked and copy/paste is not allowed
    When I open "Log in" page
    Then I type "funkyfox@gssfire.comm" into email field
    And I type "abc12345" into password field
    And I wait for 2 sec
    Then I verify that password field is masked


  @login5
  Scenario: Leading and trailing spaces are not allowed in pwd field
    When I open "Log in" page
    And I wait for 1 sec
    Then I type "funkyfox@gssfire.comm" into email field
    And I type " abc12345 " into password field
    And I wait for 1 sec
    And I click button "Log in"
    Then I get message-error "Login was unsuccessful. Please correct the errors and try again.The credentials provided are incorrect"

@login6
Scenario: Scenario: Email field is Case insensitive
  Given I open url "https://env-jam.portnov.com/"
  And I wait for 1 sec
  When I click on "Log in" page
  Then I open "Log in" page
  And I wait for 1 sec
  Then I type "FUNKYfox@gssfire.com" into email field
  Then I type "ABC123" into password field
  And I wait for 1 sec
  And I click button "Log in"
  When I open url "https://env-jam.portnov.com/"
  Then I should see "My account" button on upper header
  And I wait for 1 sec

 @login7
 Scenario: PWD field is required: user is not able to login with valid email & blank password field
   Given I open url "https://env-jam.portnov.com/"
   And I wait for 1 sec
   When I click on "Log in" page
   Then I open "Log in" page
   And I wait for 1 sec
   Then I type "funkyfox@gssfire.com" into email field
   And I click button "Log in"
   Then text "The password field is required." is displayed on the message error
   And I wait for 2 sec




































