@AddTester
Feature: Project admin can add tester

  Scenario:Project admin can add tester - Happy path
    Given Admin is in login page
    When Admin enters 'projectadmin' as username
    And  Admin enters 'Admin1' as password
    And  Admin clicks on 'login' button
    Then Admin should login successfully
    And project admin is in project home page
    When project admin open the tester module
    And Click on Add tester button
    Then the add tester page is displayed
    When enters the 'Testerone9' as Fullname
    And enters 'TestUser' as a new username
    And enters 'Password12' as password
    And enters 'Password12' as confirm password
    And enters 'testuser@example.com' as email
    And enters 'London' as a favourite Place
    And saves the form
    Then the success message is shown as dialog
    And Click on ok button
    And the user is in Tester List page


  Scenario Outline:Project admin cannot add tester with invalid data
    Given Admin is in login page
    When Admin enters 'projectadmin' as username
    And  Admin enters 'Admin1' as password
    And  Admin clicks on 'login' button
    Then Admin should login successfully
    And project admin is in project home page
    When project admin open the tester module
    And Click on Add tester button
    Then the add tester page is displayed
    When enters the '<Testerone5>' as Fullname
    And enters '<Tes1>' as username
    And enters '<Password12>' as password
    And enters '<Password12>' as confirm password
    And enters '<testuser@example.com>' as email
    And enters '<London>' as a favourite Place
    And saves the form
    Then the Error message is shown as Error
    Then the add tester page is displayed

  Examples:
    |full name|Username         |Password|      ErrorMessage|Email|
    |testfulname|Name|Pword|Not a valid user|test@trest.com|
    |testfulname|$%$Name|Pword$%$%|Not a valid user|test@trest.com|
    |test fulname| | |please enter valid Username and Passord|test@trest.com|
    |test fulname|  |ValidPass@123|please enter valid Username|test@trest.com|
    |testfulname|Validuser| |please enter valid Passord|test@trest.com|
    ||Name|Pword|Not a valid fullname|test@trest.com|
    |*@£*&(£|Name|Pword|Not a valid user|test@trest.com|
    |testfulname|Name|Pword|Not a email|test|
    |testfulname|Name|Pword|Not a email|test@|
    |testfulname|Name|Pword|Not a email|test@tt|
    |testfulname|Name|Pword|Not a email|testtt.c|


  Scenario Outline: Project admin cannot add tester with diff passwords
    Given Admin is in login page
    When Admin enters 'projectadmin' as username
    And  Admin enters 'Admin1' as password
    And  Admin clicks on 'login' button
    Then Admin should login successfully
    And project admin is in project home page
    When project admin open the tester module
    And Click on Add tester button
    Then the add tester page is displayed
    When enters the 'Testerone8' as Fullname
    And enters 'TestUser8' as username
    And enters 'Password1' as password
    And enters 'Password12' as confirm password
    And enters 'testuser@example.com' as email
    And enters 'London' as a favourite Place
    And saves the form
    Then the Error message is shown as Password mismatch
    Then the add tester page is displayed

  Examples:
    |full name|Username         |Password|      ErrorMessage|Email|
    |testfulname|Name|Pword|Not a valid user|test@trest.com|


   Scenario: Project admin cannot add tester with existing  user
    Given Admin is in login page
    When Admin enters 'projectadmin' as username
    And Admin enters 'Admin1' as password
    And Admin clicks on 'login' button
    Then Admin should login successfully
    And project admin is in project home page
    When project admin open the tester module
    And Click on Add tester button
    Then the add tester page is displayed
    When enters the 'Testerone56' as Fullname
    And enters 'TestUser' as a new username
    And enters 'Password12' as password
    And enters 'Password12' as confirm password
    And enters 'testuser@example.com' as email
    And enters 'London' as a favourite Place
    And saves the form
    Then the success message is shown as dialog
    And Click on ok button
    And the user is in Tester List page
    And Click on Add tester button
    Then the add tester page is displayed
    When enters the 'Testerone56' as Fullname
    And enters 'TestUser' as username
    And enters 'Password12' as password
    And enters 'Password12' as confirm password
    And enters 'testuser@example.com' as email
    And enters 'London' as a favourite Place
    And saves the form
    Then the Error message shown as Username already exists.
