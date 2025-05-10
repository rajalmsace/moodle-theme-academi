@theme @theme_academi @_file_upload @javascript

Feature:Check marketing spot in theme_academi in the "Marketing spot" tab on the "Academi" theme settings page
  In order to use the features
  As a admin
  I need to manage theme settings in the system

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email                |
      | student1 | Student   | First    | student1@example.com |
      | student2 | Student   | Two      | student2@example.com |
      | student3 | Student   | Three    | student3@example.com |
      | teacher1 | teacher   | First    | teacher1@example.com |
      | teacher2 | teacher   | Two      | teacher2@example.com |
      | teacher3 | teacher   | Three    | teacher3@example.com |

  Scenario Outline:Marketing spot Title & description block
    Given I log in as "admin"
    And I am on site homepage
    And I should not see "Marketing spot"
    And I navigate to theme settings page
    And I click on "Marketing Spot" "link"
    #--Hide Marketing spot block title & description in site homepage--#
    And I set the following fields to these values:
      | s_theme_academi_mspotstatus  | <mspotstatus>  |
      | s_theme_academi_mspottitle   | <mspottitle>   |
      | s_theme_academi_mspotdesc    | <mspotdesc>    |
      | s_theme_academi_mspotcontent | <mspotcontent> |
    And I delete "mspotmedia.png" from "Media" filemanager
    And I upload "<mediafile>" file to "Media" filemanager
    And I wait "5" seconds
    And I press "Save changes"
    And I am on site homepage
    And I should <mspottitlestatus> "Marketing spot"
    And I should <mspotdescstatus> "To set the Description"
    And I should <mspotcontentstatus> "Ipsum in aspernatur."
    Then "//div[contains(@class, 'marketing-spot')]//div[contains(@class,'info-media')]//img[contains(@class, 'media-image')][contains(@src, 'pluginfile.php/1/theme_academi/mspotmedia/')][contains(@src, 'logo.png')]" "xpath_element" should <mediafilestatus>

  Examples:
    | mspotstatus | mspottitle     | mspottitlestatus | mspotdesc              | mspotdescstatus | mspotcontent         | mspotcontentstatus | mediafile                              | mediafilestatus |
    #|       1     | Marketing spot | see              | To set the Description | see             | Ipsum in aspernatur. | see                | theme/academi/tests/fixtures/logo.png  | exist             |
    #|       0     | Marketing spot | not see          | To set the Description | not see         | Ipsum in aspernatur. | not see            | theme/academi/tests/fixtures/logo.png  | not exist         |
    |       1     | Marketing spot | see              | To set the Description | see             | Ipsum in aspernatur. | see                |                                        | not exist         |
    #|       1     | Marketing spot | see              | To set the Description | see             |                      | not see            | theme/academi/tests/fixtures/logo.png  | exist             |
    #|       1     | Marketing spot | see              |                        | not see         | Ipsum in aspernatur. | see                | theme/academi/tests/fixtures/logo.png  | exist             |
    #|       1     |                | not see          | To set the Description | see             | Ipsum in aspernatur. | see                | theme/academi/tests/fixtures/logo.png  | exist             |
    #|       1     |                | not see          |                        | not see         | Ipsum in aspernatur. | see                | theme/academi/tests/fixtures/logo.png  | exist             |
    #|       1     | Marketing spot | see              |                        | not see         |                      | not see            | theme/academi/tests/fixtures/logo.png  | exist             |
    #|       1     |                | not see          | To set the Description | see             |                      | not see            | theme/academi/tests/fixtures/logo.png  | exist             |
    #|       1     | Marketing spot | see              | To set the Description | see             |                      | not see            |                                        | not exist         |
    #|       1     | Marketing spot | see              |                        | not see         | Ipsum in aspernatur. | see                |                                        | not exist         |
    
    And I log out

  Scenario:Marketing spot media block
    Given I log in as "admin"
    And I am on site homepage
    And I should not see "Marketing spot"
    And I navigate to theme settings page
    And I click on "Marketing Spot" "link"
    #--Hide Marketing spot block title & description in site homepage--#
    And I set the following fields to these values:
      | s_theme_academi_mspotstatus  | 1                      |
      | s_theme_academi_mspottitle   | Marketing spot         |
      | s_theme_academi_mspotdesc    | To set the Description |
      | s_theme_academi_mspotcontent |                        |
    And I delete "mspotmedia.png" from "Media" filemanager
    And I upload "theme/academi/tests/fixtures/logo.png" file to "Media" filemanager
    And I press "Save changes"
    And I am on site homepage
    And I should see "Marketing spot"
    And I should see "To set the Description"
    And I should not see "Ipsum in aspernatur ut possimus sint. Quia omnis est occaecati possimus ea"
    And I navigate to theme settings page
    And I click on "Marketing Spot" "link"
    #--Hide Marketing spot block title & description in site homepage--#
    And I set the following fields to these values:
      | s_theme_academi_mspotstatus  | 1 |
      | s_theme_academi_mspottitle   |   |
      | s_theme_academi_mspotdesc    |   |
      | s_theme_academi_mspotcontent | Ipsum in aspernatur ut possimus sint. Quia omnis est occaecati possimus ea. Quas molestiae perspiciatis occaecati qui rerum. Deleniti quod porro sed quisquam saepe. Numquam mollitia recusandae non ad at et a.                              |
    And I delete "logo.png" from "Media" filemanager
    And I upload "theme/academi/tests/fixtures/mspotmedia.png" file to "Media" filemanager
    And I press "Save changes"
    And I am on site homepage
    And I should not see "Marketing spot"
    And I should not see "To set the Description"
    And I should see "Ipsum in aspernatur ut possimus sint. Quia omnis est occaecati possimus ea"
    And I log out
