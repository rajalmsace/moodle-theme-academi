@theme @theme_academi @_file_upload @javascript

Feature:Check general in theme_academi in the "General" tab on the "Academi" theme settings page
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
    And the following "categories" exist:
      | name      | category | idnumber |
      | category2 |   0      | CAT1     |
      | category3 |   0      | CAT2     |
    And the following "courses" exist:
      | fullname | shortname | category | courseid |
      | Course 1 | C1        | 0        |     1    |
      | Course 2 | C2        | CAT1     |     2    |
      | Course 3 | C3        | CAT1     |     3    |
      | Course 4 | C4        | CAT2     |     4    |
      | Course 5 | C5        | CAT2     |     5    |

  Scenario Outline: General tab in theme settings: navstyle and logo
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
    And I click on "General" "link" in the ".settingsform" "css_element"
    And I set the field "s_theme_academi_navstyle" to "<navstyle>"
    And I delete "logo.png" from "Logo" filemanager
    And I upload "theme/academi/tests/fixtures/bird-logo.jpg" file to "Logo" filemanager
    And I press "Save changes"
    And I wait "5" seconds
    And ".<logoclass>" "css_element" should <status1> in the ".navbar-brand.has-logo" "css_element"
    And ".<siteclass>" "css_element" should <status2> in the ".navbar-brand.has-logo" "css_element"
    Examples:
    | navstyle | logoclass  | siteclass      | status1   | status2   |
    | 0        | logo       | nav-site-name  | exist     | not exist |
    | 1        | logo       | nav-site-name  | not exist | exist     |
    | 2        | logo       | nav-site-name  | exist     | exist     |

  Scenario Outline: General tab in theme settings: primary & secondary colors
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
    And I click on "General" "link" in the ".settingsform" "css_element"
    And I set the following fields to these values:
    | s_theme_academi_primarycolor    | <prcolor> |
    | s_theme_academi_secondarycolor  | <secolor> |
    And I press "Save changes"

    # And I should see "background: <prcolor>" in the "nav #header" "css_element"

    And "//nav[@id, 'header' contains(background-image: <prcolor>)]" "xpath_element" should <prcstatus>
    # And "//div[@class, 'footer-content-popover']//div[@class, 'footer-section']//i[@class, 'icon fa fa-life-ring fa-fw fa fa-life-ring' contains(color: <secolor>)]" "xpath_element" should <secstatus>

    Examples:
    | prcolor   | prcstatus | secolor   | secstatus |
    | none | exist     | #014e55 | exist     |
    # | #B20042 | exist     | #91A500 | exist     |

  Scenario Outline: General tab in theme settings: header style
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
    And I click on "General" "link" in the ".settingsform" "css_element"
    And I set the field "s_theme_academi_themestyleheader" to "<headerstyle1>"
    And I press "Save changes"
    And "//body[contains(@class,'<headerstyleclass1>')]" "xpath_element" should <headerstatus>
    And I wait "5" seconds
    And I set the field "s_theme_academi_themestyleheader" to "<headerstyle2>"
    And I press "Save changes"
    And I wait "5" seconds
    And "//body[contains(@class,'<headerstyleclass2>')]" "xpath_element" should <headerstatus>

    Examples:
    | headerstyle1 | headerstyle2 | headerstyleclass1   | headerstyleclass2   | headerstatus |
    | 0            | 1            | moodle-based-header | theme-based-header | exist        |
    | 1            | 0            | theme-based-header    | moodle-based-header  | exist        |

  Scenario Outline: General tab in theme settings: page content size
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
    And I click on "General" "link" in the ".settingsform" "css_element"
    And I set the field "s_theme_academi_pagesize" to "<pagesize>"
    And I press "Save changes"
    And "//body[contains(@class,'<pagesizeclass>')]" "xpath_element" should <pagestatus>
    Examples:
    | pagesize  | pagesizeclass     | pagestatus |
    | container | theme-container   | exist      |
    | default   | default-container | exist      |

    And I navigate to theme settings page
    And I click on "General" "link" in the ".settingsform" "css_element"
    And I set the field "s_theme_academi_pagesize" to "custom"
    And I set the field "s_theme_academi_pagesizecustomval" to "800"
    And I press "Save changes"
    And "//body[contains(@class,'custom-container')]" "xpath_element" should exist

  Scenario Outline: General tab in theme settings: fontsize
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
    And I click on "General" "link" in the ".settingsform" "css_element"
    And I set the field "s_theme_academi_fontsize" to "<fontsize>"
    And I press "Save changes"
###---Error---###
    #And "//body[@id, 'page-admin-setting-themesettingacademi' contains(font-size: <fontsize>px)]" "xpath_element" should exist
    #And "//body[@id='page-admin-setting-themesettingacademi' and contains(@style, 'font-size: <fontsize>px')]"  "xpath_element" should exist
#And "//div[@class='footer-main' and contains(@style, background-color)]" xpath_element should <ostatus>
And I wait "5" seconds
#And "//body[@id='page-admin-setting-themesettingacademi' and contains('font-size: <fontsize>px')]" "xpath_element" should exist
And "//body[contains(@style, 'font-size: <size>px')]" "xpath_element" should exist
###---Error---###
    Examples:
    | fontsize   | size |
    | Default    | 16   |
    | Small      | 15   |
    | Medium     | 17   |
    | Large      | 18   |

  Scenario Outline: General tab in theme settings: available courses style
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
    And I click on "General" "link" in the ".settingsform" "css_element"
    And I set the field "s_theme_academi_availablecoursetype" to "<availablecoursestyle>"
    And I press "Save changes"

    And I am on site homepage

    And I should see "<availablecourseid>" in the "#region-main" "css_element"

    Examples:
    | availablecoursestyle | availablecourseid                 |
    | 1                    | #courses frontpage-course-list-all |
    #| 0                    | frontpage-available-course-list   |

  Scenario Outline: Navbar in theme settings
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
    And I click on "General" "link" in the ".settingsform" "css_element"
    And I select "Logo" from the "s_theme_academi_navstyle" singleselect
    And I delete "logo.png" from "Logo" filemanager
    And I upload "theme/academi/tests/fixtures/bird-logo.jpg" file to "Logo" filemanager
    #And I upload "theme/academi/tests/fixtures/" file to "Favicon" filemanager
    And I set the following fields to these values:
    | s_theme_academi_primarycolor        | <prcolor>     |
    | s_theme_academi_secondarycolor      | <secolor>     |
    | s_theme_academi_themestyleheader    | <headerstyle> |
    | id_s_theme_academi_pagesize         | <pagesize>    |
    | s_theme_academi_pagesizecustomval   | <pagesizecustomval>  |
    | s_theme_academi_fontsize            | <fontsize>           |
    | s_theme_academi_availablecoursetype | <availablecourstype> |
    | s_theme_academi_comboListboxType    | <comboboxtype>       |
    | s_theme_academi_backToTop_status    | <backtotop>          |
    | s_theme_academi_preset              | <preset>             |
    #And I upload "theme/academi/tests/fixtures/" file to "Background image" filemanager
    #And I upload "theme/academi/tests/fixtures/" file to "Login background image" filemanager
    And I press "Save changes"

    And "//nav[@id, 'header' contains(background: <prcolor>)]" "xpath_element" should <prcstatus>
    And "//div[@class, 'footer-content-popover']//div[@class, 'footer-section']//i[@class, 'icon fa fa-life-ring fa-fw fa fa-life-ring' contains(color: <secolor>)]" "xpath_element" should <secstatus>


    And "//nav[contains(@class,'<headerstyleclass>')]" "xpath_element" should <headerstatus>
    And "//body[contains(@class,'<pagesizeclass>')]" "xpath_element" should <pagestatus>


    Examples:
    | prcolor    | prcstatus | secolor   | secstatus | headerstyle  | headerstyleclass    | headerstatus | pagesize  | pagesizeclass   | pagestatus | pagesizecustomval | customvalstatus | fontsize | status | availablecourstype | status | comboboxtype | status | backtotop | status | preset  |
    | #FFB66B  | exist     | #FFA44C | exist     | Moodle based | moodle-based-header | exist        | container | theme-container | exist      |         0         |        0        | Small  | exist  | Moodle based         | exist  | Expanded     | exist  | No        | exist  | Academi |

    #| | | | | | | | | | |
    #| | | | | | | | | | |

#And "//div[@id='courseheaderimage' and contains(@style, 'min-height: <height>')]" "xpath_element" should exist

    And I am on site homepage
    And "//body[contains(@class, 'format-site') and contains(@style, 'font-size: 15px')]" "xpath_element" should exist
    #And "//body[@class='format-site' and contains(@style, 'font-size: 15px')]" "xpath_element" should exist
    #And "//body[contains(@class, 'format-site')][contains(@style, 'font-size: 15px')]" "xpath_element" should exist
    #And "//body[@class='format-site']" "xpath_element" should exist
    #And "//body[@class='format-site' and contains(@style, 'font-size: 15px')]" "xpath_element" should exist

    And I should see "Available courses"
