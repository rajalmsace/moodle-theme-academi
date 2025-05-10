@theme @theme_academi @_file_upload @javascript

Feature:Check homepage slider in theme_academi in the "Homepage Slider" tab on the "Academi" theme settings page
  In order to use the features
  As a admin
  I need to manage theme settings in the system

  Background:
    Given the following "users" exist:
        | username | firstname | lastname | email                |
        | student1 | Student   | First    | student1@example.com |
        | student2 | Student   | Two      | student2@example.com |
        | teacher1 | teacher   | First    | teacher1@example.com |
        | teacher2 | teacher   | Two      | teacher2@example.com |

  Scenario Outline:Homepage slider
    Given I log in as "admin"
    And I am on site homepage
    #And I should not see "View all courses"
    And I navigate to theme settings page
    #--Show homepage slider autoplay in site homepage--#
    And I click on "Homepage Slider" "link"
    And I set the following fields to these values:
      | s_theme_academi_toggleslideshow | Yes  |
      | s_theme_academi_autoslideshow   | Yes  |
      | s_theme_academi_slideinterval   | 2000 |
      | s_theme_academi_slideOverlay    | 0.5  |
      | s_theme_academi_numberofslides  | 2    |
    And I delete "slide1image.jpg" from "Slide image" filemanager
    And I upload "theme/academi/tests/fixtures/slide2.png" file to "slide1image" filemanager
    And I press "Save changes"
    And I am on site homepage
    And I wait "5" seconds

    And I should

  Examples:
    | toggleslider | autosliding | interval | overlay | noofslides |
    | yes          | yes         | 2000     | 0.5     | 2          |
    ||||||
