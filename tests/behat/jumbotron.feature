@theme @theme_academi @_file_upload @javascript

Feature:Check jumbotron in theme_academi in the "Jumbotron" tab on the "Academi" theme settings page
  In order to use the features
  As a admin
  I need to manage theme settings in the system

  Background:
    Given the following "categories" exist:
        | name      | category | idnumber |
        | category2 |   0      | CAT1     |
        | category3 |   0      | CAT2     |
        | category4 |   0      | CAT3     |
        | category5 |   0      | CAT4     |
        | category6 |   0      | CAT5     |
    And the following "courses" exist:
        | fullname | shortname | category | courseid |
        | Course 1 | C1        | 0        |     1    |
        | Course 2 | C2        | CAT1     |     2    |
        | Course 3 | C3        | CAT2     |     3    |
        | Course 4 | C4        | CAT3     |     4    |
        | Course 5 | C5        | CAT3     |     5    |
    And the following "users" exist:
        | username | firstname | lastname | email                |
        | student1 | Student   | First    | student1@example.com |
        | student2 | Student   | Two      | student2@example.com |
        | student3 | Student   | Three    | student3@example.com |
        | teacher1 | teacher   | First    | teacher1@example.com |
        | teacher2 | teacher   | Two      | teacher2@example.com |
        | teacher3 | teacher   | Three    | teacher3@example.com |
    And the following "course enrolments" exist:
        | user     | course | role    |
        | student1 | C1     | student |
        | student1 | C2     | student |
        | student1 | C3     | student |
        | student1 | C4     | student |
        | admin    | C1     | manager |
        | admin    | C2     | manager |
        | admin    | C3     | manager |
        | admin    | C4     | manager |
        | teacher1 | C1     | teacher |
        | teacher2 | C2     | teacher |
        | teacher3 | C3     | teacher |

  Scenario:jumbotron activate block
    Given I log in as "admin"
    And I am on site homepage
    And I should not see "View all courses"
    And I navigate to theme settings page
    #--Show promoted courses block in site homepage--#
    And I click on "Jumbotron" "link"
    And I click on "s_theme_academi_jumbotronstatus" "checkbox"
    And I press "Save changes"
    And I am on site homepage
    And I should see "View all courses"

  Scenario Outline:jumbotron title & description
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
    #--Show promoted courses block in site homepage--#
    And I click on "Jumbotron" "link"
    And I set the following fields to these values:
    | s_theme_academi_jumbotronstatus    | <status> |
    | s_theme_academi_jumbotrontitle     | <title>  |
    | s_theme_academi_jumbotrondesc      | <description> |
    | s_theme_academi_jumbotronbtntext   | <btntxt>     |
    | s_theme_academi_jumbotronbtnlink   | <btnlink>    |
    | s_theme_academi_jumbotronbtntarget | <btntarget>  |

    And I press "Save changes"
    And I am on site homepage
    And I should <titstatus> "Online Learning System"
    And I should <descstatus> "LMS E-learning management system"
    And I should <btnstatus> "Show all courses"##------Error: show the button without title and description-----##


  Examples:
      | status | title                  | titstatus | description                      | descstatus | btntxt           | btnstatus | btnlink                 | btntarget |
      |   1    | Online Learning System | see       | LMS E-learning management system | see        | Show all courses | see       | http://www.example.com/ |     1     |
      |   0    | Online Learning System | not see   | LMS E-learning management system | not see    | Show all courses | not see   | http://www.example.com/ |     1     |
      |   1    | Online Learning System | see       | LMS E-learning management system | see        | Show all courses | see       | http://www.example.com/ |     1     |
      |   1    | Online Learning System | see       | LMS E-learning management system | see        | Show all courses | see       |                         |     1     |
      |   1    | Online Learning System | see       | LMS E-learning management system | see        |                  | not see   | http://www.example.com/ |     1     |
      |   1    | Online Learning System | see       |                                  | not see    | Show all courses | see       | http://www.example.com/ |     1     |
      |   1    |                        | not see   | LMS E-learning management system | see        | Show all courses | see       | http://www.example.com/ |     1     |
      |   1    | Online Learning System | see       | LMS E-learning management system | see        |                  | not see   |                         |     1     |
      |   1    | Online Learning System | see       |                                  | not see    |                  | not see   | http://www.example.com/ |     1     |
      |   1    |                        | not see   |                                  | not see    | Show all courses | see       | http://www.example.com/ |     1     |
      |   1    |                        | not see   | LMS E-learning management system | see        | Show all courses | see       | http://www.example.com/ |     1     |
      |   1    | Online Learning System | see       | LMS E-learning management system | see        | Show all courses | see       | http://www.example.com/ |     0     |
      |   1    | Online Learning System | see       | LMS E-learning management system | see        |                  | not see   | http://www.example.com/ |     0     |
      |   1    | Online Learning System | see       |                                  | not see    | Show all courses | see       | http://www.example.com/ |     0     |

    