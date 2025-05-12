@retry(2)
Feature: AdvanceOptionMoreOption
Check Advanced Options using More Options functionality

Background: Pre-condition
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @App_QA @App_Staging @App_Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-154] @Upd_Qase
Scenario: Check_that_it_is_possible_to_allow_downloads_of_the_maps_using_Down_Arrow
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	Then 'file-manager' dropdown menu is displayed to User
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then checkbox by label 'Allow Downloads' is unchecked
	When User checks checkbox by label 'Allow Downloads'
	Then checkbox by label 'Allow Downloads' is checked
	When User clicks 'Back' button
	When User opens published file with 'auto_test_SRND' name in browser via Api
	Then Menu toolbar is displayed to Presentation mode
	When User clicks 'menu' button on Menu toolbar
	When User clicks 'Download' button on Left side menu panel
	Then following items is displayed in 'menu-download' dropdown menu
		| item               |
		| Download as MMAP   |
		| Download as HTML 5 |
	When User clicks 'Download as MMAP' item in 'menu-download' dropdown menu
	Then User checks that file 'auto_test_SRND' was downloaded
	When User clicks 'Download' button on Left side menu panel
	When User clicks 'Download as HTML 5' item in 'menu-download' dropdown menu
	Then User checks that file 'auto_test_SRND.html' was downloaded

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @QA @Staging @Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-154] @Upd_Qase
Scenario: Check_that_it_is_possible_to_allow_downloads_of_the_maps_cloud_using_Down_Arrow
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	Then 'file-manager' dropdown menu is displayed to User
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then checkbox by label 'Allow Downloads' is unchecked
	When User checks checkbox by label 'Allow Downloads'
	Then checkbox by label 'Allow Downloads' is checked
	When User clicks 'Save' button
	When User opens published file with 'auto_test_SRND' name in browser via Api
	Then Menu toolbar is displayed to Presentation mode
	When User clicks 'menu' button on Menu toolbar
	When User clicks 'Download' button on Left side menu panel
	Then following items is displayed in 'menu-download' dropdown menu
		| item               |
		| Download as MMAP   |
		| Download as HTML 5 |
	When User clicks 'Download as MMAP' item in 'menu-download' dropdown menu
	Then User checks that file 'auto_test_SRND' was downloaded
	When User clicks 'Download' button on Left side menu panel
	When User clicks 'Download as HTML 5' item in 'menu-download' dropdown menu
	Then User checks that file 'auto_test_SRND.html' was downloaded

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @App_QA @App_Staging @App_Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-155] @Upd_Qase @JIRA[MMCV-7378]
Scenario: Check_that_it_is_possible_to_show_the_map_in_presentation_view_mode_once_opened_using_Down_Arrow
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	Then 'file-manager' dropdown menu is displayed to User
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then 'Published (Use view setting at time of publishing)' value is displayed in 'View Mode' filed on Advanced Options page
	When User clicks 'View Mode' filed and selects 'Presentation (Overrides view setting at time of publishing)' value in dropdown on Advanced Options page
	Then 'Presentation (Overrides view setting at time of publishing)' value is displayed in 'View Mode' filed on Advanced Options page
	When User clicks 'Save' button
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then Menu toolbar is displayed to Presentation mode

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @QA @Staging @Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-155] @Upd_Qase @JIRA[MMCV-7378]
Scenario: Check_that_it_is_possible_to_show_the_map_in_presentation_view_mode_once_opened_cloud_using_Down_Arrow
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	Then 'file-manager' dropdown menu is displayed to User
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then 'Published (Use view setting at time of publishing)' value is displayed in 'View Mode' filed on Advanced Options page
	When User clicks 'View Mode' filed and selects 'Presentation (Overrides view setting at time of publishing)' value in dropdown on Advanced Options page
	Then 'Presentation (Overrides view setting at time of publishing)' value is displayed in 'View Mode' filed on Advanced Options page
	When User clicks 'Save' button
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then Menu toolbar is displayed to Presentation mode

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @App_QA @App_Staging @App_Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-156] @Upd_Qase @JIRA[MMCV-10559]
Scenario: Check_that_it_is_possible_to_show_the_map_in_standard_view_mode_using_Down_Arrow
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	Then 'file-manager' dropdown menu is displayed to User
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User clicks 'Back' button
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @QA @Staging @Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-156] @Upd_Qase
Scenario: Check_that_it_is_possible_to_show_the_map_in_standard_view_mode_cloud_using_Down_Arrow
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	Then 'file-manager' dropdown menu is displayed to User
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then 'Published (Use view setting at time of publishing)' value is displayed in 'View Mode' filed on Advanced Options page
	When User clicks 'Save' button
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @App_QA @App_Staging @App_Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-157] @Upd_Qase @Build_24.1.111
Scenario: Check_that_it_is_possible_to_require_the_password_to_view_the_map_using_Down_Arrow
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	Then 'file-manager' dropdown menu is displayed to User
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then checkbox by label 'Require Password to View' is unchecked
	When User checks checkbox by label 'Require Password to View'
	Then checkbox by label 'Require Password to View' is checked
	Then 'password' enter field is displayed to User
	When User enters '12345678' in the 'password' field
	Then '12345678' value is displayed to the 'password' field
	When User waits for data loading
	When User clicks 'Save' button
	When User waits '2000' miliseconds
	When User switches to default content
	When User waits for data loading
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then 'auto_test_SRND' publish file is open to User
	Then 'password' enter field is displayed to User
	When User enters '12345678' in the 'password' field
	When User clicks 'Go' button
	Then 'auto_test_SRND' publish file is open to User

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @QA @Staging @Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-157] @Upd_Qase
Scenario: Check_that_it_is_possible_to_require_the_password_to_view_the_map_cloud_using_Down_Arrow
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	Then 'file-manager' dropdown menu is displayed to User
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then checkbox by label 'Require Password to View' is unchecked
	When User checks checkbox by label 'Require Password to View'
	Then checkbox by label 'Require Password to View' is checked
	Then 'password' enter field is displayed to User
	When User enters '12345678' in the 'password' field
	Then '12345678' value is displayed to the 'password' field
	When User clicks 'Save' button
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then 'auto_test_SRND' publish file is open to User
	Then 'password' enter field is displayed to User
	When User enters '12345678' in the 'password' field
	When User clicks 'Go' button
	Then 'auto_test_SRND' publish file is open to User

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @App_QA @App_Staging @App_Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-158] @Upd_Qase @Build_24.1.109
Scenario: Check_that_it_is_possible_to_change_storage_location_of_published_map_using_Down_Arrow
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User click Storage Location field
	Then following Storage Location drop-down list is displayed:
		| StorageLocation      |
		| EU (Frankfurt)       |
		| North America (West) |
	When User selects 'North America (West)' in Storage Location dropdown
	Then value 'North America (West)' is displayed in Storage Location field
	When User clicks 'Back' button
	Then file manager header page is displayed to User
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then value 'North America (West)' is displayed in Storage Location field

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @QA @Staging @Prod @Cleanup @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Qase[WEB-158] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_storage_location_of_published_map_cloud_using_Down_Arrow
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User click Storage Location field
	Then following Storage Location drop-down list is displayed:
		| StorageLocation      |
		| EU (Frankfurt)       |
		| North America (West) |
	When User selects 'North America (West)' in Storage Location dropdown
	Then value 'North America (West)' is displayed in Storage Location field
	When User clicks 'Save' button
	Then file manager header page is displayed to User
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then value 'North America (West)' is displayed in Storage Location field

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @App_QA @App_Staging @App_Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-159] @Upd_Qase @Build_24.1.109
Scenario: Check_that_it_is_possible_to_add_custom_branding_to_the_map_in_published_view_using_Down_Arrow
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then Image is not displayed on the Advanced Options page to User
	When User uploads 'FruitImages.jpg' file through 'branding-logo' input
	Then Image is displayed to the User on the Advanced Options page
	Then 'branding-logo-hyperlink' enter field is displayed to User
	Then Remove button to the choose image field is displayed on the Advanced Options page
	When User clicks 'Back' button
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode
	Then 'FruitImages.jpg' logo is displayed in 'ToolbarPageElement' container on 'left' side

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @App_QA @App_Staging @App_Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-160] @Upd_Qase @Build_24.1.109
Scenario: Check_that_it_is_possible_to_add_a_hyperlink_to_the_branding_using_Down_Arrow
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User add 'FruitImages.jpg' image on the Advanced Options page
	Then Image is displayed to the User on the Advanced Options page
	Then 'branding-logo-hyperlink' enter field is displayed to User
	When User enters 'https://www.facebook.com' in the 'branding-logo-hyperlink' field
	When User clicks 'Back' button
	When User waits '2000' miliseconds
	When User clicks 'Back' button
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode
	Then 'FruitImages.jpg' logo is displayed in 'ToolbarPageElement' container on 'left' side
	When User clicks Logo image on Menu toolbar
	When User switches to '2' tab
	Then page url is 'https://www.facebook.com'

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @QA @Staging @Prod @Cleanup @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Qase[WEB-160] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_a_hyperlink_to_the_branding_cloud_using_Down_Arrow
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User add 'FruitImages.jpg' image on the Advanced Options page
	Then Image is displayed to the User on the Advanced Options page
	Then 'branding-logo-hyperlink' enter field is displayed to User
	When User enters 'https://www.facebook.com' in the 'branding-logo-hyperlink' field
	When User clicks 'Save' button
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode
	Then 'FruitImages.jpg' logo is displayed in 'ToolbarPageElement' container on 'left' side
	When User clicks Logo image on Menu toolbar
	When User switches to '2' tab
	Then page url is 'https://www.facebook.com'

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @App_QA @App_Staging @App_Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-161] @Upd_Qase
Scenario: Check_that_it_is_possible_to_remove_custom_logo_from_published_map_using_Down_Arrow
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User add 'FruitImages.jpg' image on the Advanced Options page
	Then Image is displayed to the User on the Advanced Options page
	When User clicks Remove button to the choose image field
	Then Image is not displayed on the Advanced Options page to User
	When User clicks 'Back' button
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then 'text-logo' logo is displayed on the loading map progress bar
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode
	Then 'default' logo is displayed in 'ToolbarPageElement' container on 'left' side

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @QA @Staging @Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-161] @Upd_Qase
Scenario: Check_that_it_is_possible_to_remove_custom_logo_from_published_map_cloud_using_Down_Arrow
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User add 'FruitImages.jpg' image on the Advanced Options page
	Then Image is displayed to the User on the Advanced Options page
	When User clicks Remove button to the choose image field
	Then Image is not displayed on the Advanced Options page to User
	When User clicks 'Save' button
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then 'text-logo' logo is displayed on the loading map progress bar
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode
	Then 'default' logo is displayed in 'ToolbarPageElement' container on 'left' side

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @App_QA @App_Staging @App_Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-162] @Upd_Qase
Scenario: Check_that_it_is_possible_to_remove_a_hyperlink_from_the_branding_using_Down_Arrow
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User add 'FruitImages.jpg' image on the Advanced Options page
	When User waits for data loading
	Then Image is displayed to the User on the Advanced Options page
	Then 'branding-logo-hyperlink' enter field is displayed to User
	When User enters 'https://twitter.com/wikipedia' in the 'branding-logo-hyperlink' field
	When User waits for data loading
	Then 'https://twitter.com/wikipedia' value is displayed to the 'branding-logo-hyperlink' field
	When User clean existing value in 'branding-logo-hyperlink' field
	Then '' value is displayed to the 'branding-logo-hyperlink' field
	When User clicks 'Save' button
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode
	Then 'FruitImages.jpg' logo is displayed in 'ToolbarPageElement' container on 'left' side
	When User clicks Logo image on Menu toolbar
	Then '2' count tab is open in browser

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @QA @Staging @Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-162] @Upd_Qase
Scenario: Check_that_it_is_possible_to_remove_a_hyperlink_from_the_branding_cloud_using_Down_Arrow
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User add 'FruitImages.jpg' image on the Advanced Options page
	Then Image is displayed to the User on the Advanced Options page
	Then 'branding-logo-hyperlink' enter field is displayed to User
	When User enters 'https://twitter.com/wikipedia' in the 'branding-logo-hyperlink' field
	Then 'https://twitter.com/wikipedia' value is displayed to the 'branding-logo-hyperlink' field
	When User clean existing value in 'branding-logo-hyperlink' field
	Then '' value is displayed to the 'branding-logo-hyperlink' field
	When User clicks 'Save' button
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode
	Then 'FruitImages.jpg' logo is displayed in 'ToolbarPageElement' container on 'left' side
	When User clicks Logo image on Menu toolbar
	Then '2' count tab is open in browser

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @App_QA @App_Staging @App_Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-163] @Upd_Qase @Build_24.1.109
Scenario: Check_that_published_map_is_fit_to_the_screen_on_opening_using_Down_Arrow
	Given Add options to publish update request
		| Mode      | mapFitContent |
		| published | false         |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode
	When User remembers map size
	When User close Active tab
	When User switches to '0' tab
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	Then 'file-manager' dropdown menu is displayed to User
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then checkbox by label 'Automatically Fit Content' is unchecked
	When User checks checkbox by label 'Automatically Fit Content'
	Then checkbox by label 'Automatically Fit Content' is checked
	When User clicks 'Back' button
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode
	Then map is Zoomed in

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @QA @Staging @Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-163] @Upd_Qase
Scenario: Check_that_published_map_is_fit_to_the_screen_on_opening_cloud_using_Down_Arrow
	Given Add options to publish update request
		| Mode      | mapFitContent |
		| published | false         |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode
	When User remembers map size
	When User close Active tab
	When User switches to '0' tab
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	Then 'file-manager' dropdown menu is displayed to User
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then checkbox by label 'Automatically Fit Content' is unchecked
	When User checks checkbox by label 'Automatically Fit Content'
	Then checkbox by label 'Automatically Fit Content' is checked
	When User clicks 'Save' button
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode
	Then map is Zoomed in

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @App_QA @App_Staging @App_Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-164] @Upd_Qase @Build_24.1.109
Scenario: Check_open_links_from_published_files_using_Down_Arrow
	Given Add options to publish update request
		| Mode      | TopicClickOpensLink |
		| published | false               |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	Then 'file-manager' dropdown menu is displayed to User
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then checkbox by label 'Clicking Topic Opens Link (Applies to topics with one link only)' is unchecked
	When User checks checkbox by label 'Clicking Topic Opens Link (Applies to topics with one link only)'
	Then checkbox by label 'Clicking Topic Opens Link (Applies to topics with one link only)' is checked
	When User clicks 'Back' button
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	When tutorial card is set to 'true' on navigation panel
	When User clicks 'LinkTopic' topic on Canvas
	When User switches to '2' tab
	Then page url is 'https://www.google.com/'
	Then 'PanelPublished' side panel with 'Attachments & Links' header is not displayed to the User

@MindManager @Published_Files @Advanced_Options @ViaMoreOptions @QA @Staging @Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaMoreOptions @Cleanup @Qase[WEB-164] @Upd_Qase
Scenario: Check_open_links_from_published_files_cloud_using_Down_Arrow
	Given Add options to publish update request
		| Mode      | TopicClickOpensLink |
		| published | false               |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	Then 'file-manager' dropdown menu is displayed to User
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then checkbox by label 'Clicking Topic Opens Link (Applies to topics with one link only)' is unchecked
	When User checks checkbox by label 'Clicking Topic Opens Link (Applies to topics with one link only)'
	Then checkbox by label 'Clicking Topic Opens Link (Applies to topics with one link only)' is checked
	When User clicks 'Save' button
	When User switches to default content
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	When User clicks 'LinkTopic' topic on Canvas
	When User switches to '2' tab
	Then page url is 'https://www.google.com/'
	Then 'PanelPublished' side panel with 'Attachments & Links' header is not displayed to the User