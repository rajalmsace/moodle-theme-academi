@theme @theme_academi @_file_upload @javascript

Feature:Check footer in theme_academi in the "Footer" tab on the "Academi" theme settings page
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

  Scenario Outline:General footer block
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
#--Show Footer block in site homepage--#
    And I click on "Footer" "link"
    And I upload "<footbgimage>" file to "Footer background Image" filemanager
    And I set the field "Footer Overlay Opacity" to "<overlay>"
    And I set the field "Copyright" to "<copyright>"
    And I press "Save changes"
    And I am on site homepage

#//div[@id='page-footer']
And "//div[@class='footer-main']" "xpath_element" should exist

#And "//div[@class='footer-main'and contains(@style,'/pluginfile.php/1/theme_academi/footerbgimg/1720016186/animals.jpg')]" "xpath_element" should <istatus>
#And "("("//div[@class='footer-main']/@style, background-image: url('/pluginfile.php/1/theme_academi/footerbgimg/1720016186/animals.jpg), "')")"

#And the field with xpath "//div[@class='footer-main']/input[@name='background-image: url' and @value='pluginfile.php/1/theme_academi/footerbgimg/1720016186/animals.jpg']" matches value "1"

#And "//div[@class='footer-main'][contains(@style, background-image: url('pluginfile.php/1/theme_academi/footerbgimg/1720016186/animals.jpg'))]" "xpath_element" should <istatus>
#And "//div[@class='footer-main'][contains(@style, 'pluginfile.php/1/theme_academi/footerbgimg/1720016186/animals.jpg')]" "xpath_element" should <istatus>

#And "//div[@class='footer-main'and contains(@style, background-image: 'pluginfile.php/1/theme_academi/footerbgimg/1720016186/animals.jpg')]" "xpath_element" should <istatus>
#And "//div[contains(@class, 'footer-main') and contains(@style, 'background-image: url(\'pluginfile.php/1/theme_academi/footerbgimg/1720016186/animals.jpg\')')]" "xpath_element" should <istatus>

#And "//div[@class='footer-main'and contains(background-image: 'pluginfile.php/1/theme_academi/footerbgimg/1720016186/animals.jpg')]" "xpath_element" should <istatus>


    #And "//div[@class='footer-main' and contains(background-image: url('pluginfile.php/1/theme_academi/footerbgimg/1720016186/animals.jpg'))]" "xpath_element" should <istatus>
    
#And I check theme_academi css "rgb(169, 56, 251)" "li#section-1 .categorise-section-block span" "background-color"
#And I check dash css "linear-gradient(90deg, rgba(255, 210, 0, 0.2) 0%, rgba(70, 210, 251, 0.2) 100%)" "section.block_dash:nth-of-type(2)" "background-image"



    And I should <istatus> "<footbgimage>" in the "#page-footer .footer-main .footer-logo" "css_element"

    #And "background-image: url(<footbgimage>)" should <istatus> in the ".footer-main" "css_element"
#And "//div[@class='footer-main' and contains(@style, background-color)]" xpath_element should <ostatus>

   # And "//div[@class='footer-main' and contains(@style, background-color: rgba(136, 183, 123, <overlay>)]" xpath_element should <ostatus>
    #And I should <ostatus> "<overlay>" in the "#page-footer" "css_element"
    And I should <cstatus> "<copyright>" in the "#page-footer" "css_element"

    Examples:
    | footbgimage                              | istatus   | overlay | ostatus | copyright             | cstatus |
    | theme/academi/tests/fixtures/animals.jpg | exist     | 0.5     | exist     | Copyright &copy; 2024 | see     |
    #|                                          | not exist |         | not exist |                       | not see |
    #| theme/academi/tests/fixtures/animals.jpg | exist     | 0.5     | exist     | Copyright &copy; 2024 | see     |
    #|                                          | not exist |         | not exist | Copyright &copy; 2024 | see     |
    #| theme/academi/tests/fixtures/animals.jpg | exist     |         | not exist |                       | not see |
    #|                                          | not exist | 0.5     | exist     |                       | not see |
    #| theme/academi/tests/fixtures/animals.jpg | exist     | 0.5     | exist     | Copyright &copy; 2024 | see     |



#--Hide Footer blocks & social media--#
    #And I navigate to theme settings page
    #And I click on "Footer" "link"
    #And I click on "s_theme_academi_footerb1_status" "checkbox"
    #And I click on "s_theme_academi_footerb2_status" "checkbox"
    #And I click on "s_theme_academi_footerb3_status" "checkbox"
    #And I click on "s_theme_academi_footerb4_status" "checkbox"
    #And I click on "s_theme_academi_socialmedia1_status" "checkbox"
    #And I click on "s_theme_academi_socialmedia2_status" "checkbox"
    #And I click on "s_theme_academi_socialmedia3_status" "checkbox"
    #And I click on "s_theme_academi_socialmedia4_status" "checkbox"
    #And I press "Save changes"
    #And I am on site homepage

    
  Scenario Outline:Footer block 1
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
#--Show Footer block 1 in site homepage--#
    And I click on "Footer" "link"
    And I upload "theme/academi/tests/fixtures/login.jpg" file to "Footer background Image" filemanager
    And I set the field "Copyright" to "Copyright &copy; 2024"
    And I wait "5" seconds
    #And I set the field "s_theme_academi_footerb1_status" to "1"
    #And I set the field "s_theme_academi_footerbtitle1" to "1Block 1"
    And I set the following fields to these values:
      | s_theme_academi_footerb1_status | <bstatus> |
      | s_theme_academi_footerbtitle1 | <btitle> |
      | Enable Footer logo | <logo> |
      | Footnote | <footnote> |
    And I delete "footerlogo.png" from "Footer logo" filemanager
    And I upload "theme/academi/tests/fixtures/bird-logo.jpg" file to "Footer logo" filemanager
    And I wait "5" seconds
    And I press "Save changes"
    And I am on site homepage
    And I wait "5" seconds
    And I navigate to theme settings page

    And I should <btstatus> "Block 1" in the ".footer-main" "css_element"
    And I should <notestatus> "<footnote>" in the ".footer-main" "css_element"

    Examples:
      | bstatus | btitle  | btstatus | logo | logostatus | footnote                                                                                                        | notestatus |
      | 1       | Block 1 | see      | 1    | see        | You can configure a custom Info Links here to be shown by themes. Each line consists of some menu text, a link  | see        |
      #| 0       | Block 1 | not see  | 1    | not see    | You can configure a custom Info Links here to be shown by themes. Each line consists of some menu text, a link  | not see    |
      #| 1       |         | not see  | 1    | see        | You can configure a custom Info Links here to be shown by themes. Each line consists of some menu text, a link  | see        |
      #| 1       | Block 1 | see      |      | not see    | You can configure a custom Info Links here to be shown by themes. Each line consists of some menu text, a link  | see        |
      #| 1       | Block 1 | see      | 1    | see        |                                                                                                                 | not see    |
      #| 1       |         | not see  |      | not see    | You can configure a custom Info Links here to be shown by themes. Each line consists of some menu text, a link  | see        |
      #| 1       | Block 1 | see      |      | not see    |                                                                                                                 | not see    |
      #| 1       |         | not see  | 1    | see        |                                                                                                                 | not see    |

  Scenario:Footer block 2
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
#--Show Footer block 2 in site homepage--#
    And I click on "Footer" "link"
    And I upload "theme/academi/tests/fixtures/login.jpg" file to "Footer background Image" filemanager
    And I set the field "Copyright" to "Copyright &copy; 2024"
    And I wait "5" seconds
    And I set the following fields to these values:
      | s_theme_academi_footerb2_status | 1 |
      | s_theme_academi_footerbtitle2 | Block 2 |
      #| s_theme_academi_infolink | Moodle community|https://moodle.org, Moodle free support|https://moodle.org/support, Moodle development|https://moodle.org/development|
    #And I set the field "s_theme_academi_infolink" to "Default:Moodle community|https://moodle.org<br/>Moodle free support|https://moodle.org/support<br/>Moodle development|https://moodle.org/development"  
    #And I set the field "s_theme_academi_infolink" to "Default:Moodle community|https://moodle.org\nMoodle free support|https://moodle.org/support/nMoodle development|https://moodle.org/development"

    And I wait "5" seconds
    And I press "Save changes"
    And I am on site homepage
    And I wait "5" seconds
    And I navigate to theme settings page
#--Hide Footer block 2 in site homepage--#
    And I click on "Footer" "link"
    And I set the field "s_theme_academi_footerb2_status" to "0"
    And I press "Save changes"
    And I am on site homepage
    And I should not see "Block 2" in the ".footer-main" "css_element"

  Scenario Outline:Hide footer block 3
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
#--Show Footer block 3 in site homepage--#
    And I click on "Footer" "link"
    And I upload "theme/academi/tests/fixtures/login.jpg" file to "Footer background Image" filemanager
    And I set the field "Copyright" to "Copyright &copy; 2024"
    And I wait "5" seconds

    And I set the following fields to these values:
      | s_theme_academi_footerb3_status | <status>   |
      | s_theme_academi_footerbtitle3   | <btitle>   |
      | s_theme_academi_address         | <baddress> |
      | s_theme_academi_emailid         | <bemail>   |
      | s_theme_academi_phoneno         | <bphone>   |

    And I press "Save changes"
    And I am on site homepage

    And I should <tstatus> "Block 3" in the "#page-footer" "css_element"
    And I should <astatus> "308 Negra Narrow Lane, Albeeze, New york, 87104" in the "#page-footer" "css_element"
    And I should <estatus> "info@example.com" in the "#page-footer" "css_element"
    And I should <pstatus> "(000) 123-456" in the "#page-footer" "css_element"

    Examples:
      | status | btitle  | tstatus | baddress                                        | astatus | bemail           | estatus | bphone        | pstatus |
      |    1   | Block 3 | see     | 308 Negra Narrow Lane, Albeeze, New york, 87104 | see     | info@example.com | see     | (000) 123-456 | see     |
      |    0   | Block 3 | not see | 308 Negra Narrow Lane, Albeeze, New york, 87104 | not see | info@example.com | not see | (000) 123-456 | not see |
      |    1   |         | not see |                                                 | not see |                  | not see |               | not see |
      |    1   |         | not see | 308 Negra Narrow Lane, Albeeze, New york, 87104 | see     | info@example.com | see     | (000) 123-456 | see     |
      |    1   | Block 3 | see     |                                                 | not see | info@example.com | see     | (000) 123-456 | see     |
      |    1   | Block 3 | see     | 308 Negra Narrow Lane, Albeeze, New york, 87104 | see     |                  | not see | (000) 123-456 | see     |
      |    1   | Block 3 | see     | 308 Negra Narrow Lane, Albeeze, New york, 87104 | see     | info@example.com | see     |               | not see |
      |    1   |         | not see |                                                 | not see | info@example.com | see     | (000) 123-456 | see     |
      |    1   |         | not see | 308 Negra Narrow Lane, Albeeze, New york, 87104 | see     |                  | not see | (000) 123-456 | see     |
      |    1   |         | not see | 308 Negra Narrow Lane, Albeeze, New york, 87104 | see     | info@example.com | see     |               | not see |
      |    1   | Block 3 | see     |                                                 | not see |                  | not see | (000) 123-456 | see     |
      |    1   | Block 3 | see     |                                                 | not see | info@example.com | see     |               | not see |
      |    1   | Block 3 | see     | 308 Negra Narrow Lane, Albeeze, New york, 87104 | see     |                  | not see |               | not see |
      |    1   |         | not see |                                                 | not see |                  | not see | (000) 123-456 | see     |
      |    1   |         | not see |                                                 | not see | info@example.com | see     |               | not see |
      |    1   |         | not see | 308 Negra Narrow Lane, Albeeze, New york, 87104 | see     |                  | not see |               | not see |
      |    1   | Block 3 | see     |                                                 | not see |                  | not see |               | not see |
  
  Scenario Outline:hide Footer block 4
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
#--Show Footer block 4 in site homepage--#
    And I click on "Footer" "link"
    And I upload "theme/academi/tests/fixtures/login.jpg" file to "Footer background Image" filemanager
    And I set the field "Copyright" to "Copyright &copy; 2024"
    And I wait "5" seconds
    And I set the following fields to these values:
      | s_theme_academi_footerb4_status  | <bstatus>  |
      | s_theme_academi_footerbtitle4    | <btitle>   |
      | s_theme_academi_numofsocialmedia | <nosmedia> |
      | s_theme_academi_socialmedia1_status   | <mstatus1> |
      | s_theme_academi_socialmedia1_icon     | <micon1>   |
      | s_theme_academi_socialmedia1_url      | <murl1>    |
      | s_theme_academi_socialmedia1_iconcolor| <color1>   |
      | s_theme_academi_socialmedia2_status   | <mstatus2> |
      | s_theme_academi_socialmedia2_icon     | <micon2>   |
      | s_theme_academi_socialmedia2_url      | <murl2>    |
      | s_theme_academi_socialmedia2_iconcolor| <color2>   |
      | s_theme_academi_socialmedia3_status   | <mstatus3> |
      | s_theme_academi_socialmedia3_icon     | <micon3>   |
      | s_theme_academi_socialmedia3_url      | <murl3>    |
      | s_theme_academi_socialmedia3_iconcolor| <color3>   |
      | s_theme_academi_socialmedia4_status   | <mstatus4> |
      | s_theme_academi_socialmedia4_icon     | <micon4>   |
      | s_theme_academi_socialmedia4_url      | <murl4>    |
      | s_theme_academi_socialmedia4_iconcolor| <color4>   |

    And I press "Save changes"
    And I wait until the page is ready
    And I should <btstatus> "Block 4" in the ".footer-main" "css_element"
    And "//div[@class='footer-main']//div[@class='social-media']//li[@class='<iconclass1>']//i[@class='<iconclass11>']" "xpath_element" should <status1>
    And "//div[@class='footer-main']//div[@class='social-media']//li[@class='<iconclass2>']//i[@class='<iconclass12>']" "xpath_element" should <status2>
    And "//div[@class='footer-main']//div[@class='social-media']//li[@class='<iconclass3>']//i[@class='<iconclass13>']" "xpath_element" should <status3>
    And "//div[@class='footer-main']//div[@class='social-media']//li[@class='<iconclass4>']//i[@class='<iconclass14>']" "xpath_element" should <status4>
    
    Examples:
      | bstatus | btitle  | btstatus | nosmedia | mstatus1 | mstatus2 | mstatus3 | mstatus4 | micon1    | status1   | iconclass1 | iconclass11     | micon2      | status2   | iconclass2 | iconclass12       | micon3      | status3   | iconclass3 | iconclass13       | micon4     | status4   | iconclass4 | iconclass14      | murl1                               | murl2                                    | murl3                                       | murl4                                   | color1  | color2  | color3  | color4  |
      |    1    | Block 4 | see      |    4     |    1     |    1     |    1     |    1     | x-twitter | exist     | smedia-1   | fa fa-x-twitter | google-plus | exist     | smedia-2   | fa fa-google-plus | pinterest-p | exist     | smedia-3   | fa fa-pinterest-p | facebook-f | exist     | smedia-4   | fa fa-facebook-f | https://twitter.com/yourtwittername | https://www.google.com/+yourgoogleplusid | https://in.pinterest.com/yourpinterestname/ | https://www.facebook.com/yourfacebookid | #47caf6 | #e84c3d | #cd2129 | #3598dc |
      |    0    | Block 4 | not see  |    4     |    1     |    1     |    1     |    1     | x-twitter | not exist | smedia-1   |                 | google-plus | not exist | smedia-2   |                   | pinterest-p | not exist | smedia-3   |                   | facebook-f | not exist | smedia-4   |                  | https://twitter.com/yourtwittername | https://www.google.com/+yourgoogleplusid | https://in.pinterest.com/yourpinterestname/ | https://www.facebook.com/yourfacebookid | #47caf6 | #e84c3d | #cd2129 | #3598dc |
      |    1    | Block 4 | see      |    4     |    0     |    1     |    1     |    1     | x-twitter | not exist | smedia-1   |                 | google-plus | exist     | smedia-2   | fa fa-google-plus | pinterest-p | exist     | smedia-3   | fa fa-pinterest-p | facebook-f | exist     | smedia-4   | fa fa-facebook-f | https://twitter.com/yourtwittername | https://www.google.com/+yourgoogleplusid | https://in.pinterest.com/yourpinterestname/ | https://www.facebook.com/yourfacebookid | #47caf6 | #e84c3d | #cd2129 | #3598dc |
      |    1    | Block 4 | see      |    4     |    0     |    0     |    1     |    1     | x-twitter | not exist | smedia-1   |                 | google-plus | not exist | smedia-2   |                   | pinterest-p | exist     | smedia-3   | fa fa-pinterest-p | facebook-f | exist     | smedia-4   | fa fa-facebook-f | https://twitter.com/yourtwittername | https://www.google.com/+yourgoogleplusid | https://in.pinterest.com/yourpinterestname/ | https://www.facebook.com/yourfacebookid | #47caf6 | #e84c3d | #cd2129 | #3598dc |
      |    1    | Block 4 | see      |    4     |    0     |    0     |    0     |    1     | x-twitter | not exist | smedia-1   |                 | google-plus | not exist | smedia-2   |                   | pinterest-p | not exist | smedia-3   |                   | facebook-f | exist     | smedia-4   | fa fa-facebook-f | https://twitter.com/yourtwittername | https://www.google.com/+yourgoogleplusid | https://in.pinterest.com/yourpinterestname/ | https://www.facebook.com/yourfacebookid | #47caf6 | #e84c3d | #cd2129 | #3598dc |
      |    1    | Block 4 | see      |    4     |    0     |    0     |    0     |    0     | x-twitter | not exist | smedia-1   |                 | google-plus | not exist | smedia-2   |                   | pinterest-p | not exist | smedia-3   |                   | facebook-f | not exist | smedia-4   |                  | https://twitter.com/yourtwittername | https://www.google.com/+yourgoogleplusid | https://in.pinterest.com/yourpinterestname/ | https://www.facebook.com/yourfacebookid | #47caf6 | #e84c3d | #cd2129 | #3598dc |
      |    1    | Block 4 | see      |    4     |    0     |    0     |    0     |    0     | x-twitter | not exist | smedia-1   |                 | google-plus | not exist | smedia-2   |                   | pinterest-p | not exist | smedia-3   |                   | facebook-f | not exist | .smedia-4  |                  | https://twitter.com/yourtwittername | https://www.google.com/+yourgoogleplusid | https://in.pinterest.com/yourpinterestname/ | https://www.facebook.com/yourfacebookid | #47caf6 | #e84c3d | #cd2129 | #3598dc |
      |    1    | Block 4 | see      |    4     |    1     |    0     |    0     |    0     | x-twitter | exist     | smedia-1   | fa fa-x-twitter | google-plus | not exist | smedia-2   |                   | pinterest-p | not exist | smedia-3   |                   | facebook-f | not exist | .smedia-4  |                  | https://twitter.com/yourtwittername | https://www.google.com/+yourgoogleplusid | https://in.pinterest.com/yourpinterestname/ | https://www.facebook.com/yourfacebookid | #47caf6 | #e84c3d | #cd2129 | #3598dc |
      |    1    | Block 4 | see      |    4     |    1     |    1     |    0     |    0     | x-twitter | exist     | smedia-1   | fa fa-x-twitter | google-plus | exist     | smedia-2   | fa fa-google-plus | pinterest-p | not exist | smedia-3   |                   | facebook-f | not exist | .smedia-4  |                  | https://twitter.com/yourtwittername | https://www.google.com/+yourgoogleplusid | https://in.pinterest.com/yourpinterestname/ | https://www.facebook.com/yourfacebookid | #47caf6 | #e84c3d | #cd2129 | #3598dc |
      |    1    | Block 4 | see      |    4     |    1     |    1     |    1     |    0     | x-twitter | exist     | smedia-1   | fa fa-x-twitter | google-plus | exist     | smedia-2   | fa fa-google-plus | pinterest-p | exist     | smedia-3   | fa fa-pinterest-p | facebook-f | not exist | .smedia-4  |                  | https://twitter.com/yourtwittername | https://www.google.com/+yourgoogleplusid | https://in.pinterest.com/yourpinterestname/ | https://www.facebook.com/yourfacebookid | #47caf6 | #e84c3d | #cd2129 | #3598dc |

  Scenario Outline:Hide all footer blocks
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
#--Show Footer block 1 in site homepage--#
    And I click on "Footer" "link"
    And I upload "theme/academi/tests/fixtures/login.jpg" file to "Footer background Image" filemanager
    And I set the field "Copyright" to "Copyright &copy; 2024"
    
    And I set the following fields to these values:
      | s_theme_academi_footerbtitle1 | Block 1 |
      | s_theme_academi_footerbtitle2 | Block 2 |
      | s_theme_academi_footerbtitle3 | Block 3 |
      | s_theme_academi_footerbtitle4 | Block 4 |

    And I set the field "s_theme_academi_footerb1_status" to "<footerb1_status>"
    And I set the field "s_theme_academi_footerb2_status" to "<footerb2_status>"
    And I set the field "s_theme_academi_footerb3_status" to "<footerb3_status>"
    And I set the field "s_theme_academi_footerb4_status" to "<footerb4_status>"

    And I press "Save changes"
    And I am on site homepage

    And I should <status1> "Block 1" in the "#page-footer" "css_element"
    And I should <status2> "Block 2" in the "#page-footer" "css_element"
    And I should <status3> "Block 3" in the "#page-footer" "css_element"
    And I should <status4> "Block 4" in the "#page-footer" "css_element"

  Examples:
    | footerb1_status | status1  | footerb2_status | status2  | footerb3_status | status3  | footerb4_status | status4  |
    |        0        | not see  |        0        | not see  |        0        | not see  |        0        | not see  |
    |        1        | see      |        1        | see      |        1        | see      |        1        | see      |
    |        1        | see      |        0        | not see  |        0        | not see  |        0        | not see  |
    |        0        | not see  |        1        | see      |        0        | not see  |        0        | not see  |
    |        0        | not see  |        0        | not see  |        1        | see      |        0        | not see  |
    |        0        | not see  |        0        | not see  |        0        | not see  |        1        | see      |
    |        1        | see      |        1        | see      |        0        | not see  |        0        | not see  |
    |        0        | not see  |        1        | see      |        1        | see      |        0        | not see  |
    |        0        | not see  |        0        | not see  |        1        | see      |        1        | see      |
    |        1        | see      |        0        | not see  |        0        | not see  |        1        | see      |
    |        1        | see      |        1        | see      |        1        | see      |        0        | not see  |
    |        0        | not see  |        1        | see      |        1        | see      |        1        | see      |
    |        1        | see      |        0        | not see  |        1        | see      |        1        | see      |
    |        1        | see      |        1        | see      |        0        | not see  |        1        | see      |

