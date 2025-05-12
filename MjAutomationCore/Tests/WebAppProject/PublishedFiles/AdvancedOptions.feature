@retry(2)
Feature: AdvancedOptions
Check Advanced Options functionality

@MindManager @Published_Files @Advanced_Options @ViaShareButton @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-115] @Upd_Qase @Build_24.1.109
Scenario: Check_that_it_is_possible_to_allow_downloads_of_the_maps
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then checkbox by label 'Allow Downloads' is unchecked
	When User checks checkbox by label 'Allow Downloads'
	Then checkbox by label 'Allow Downloads' is checked
	When User clicks 'Back' button
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
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

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-115] @Upd_Qase
Scenario: Check_that_it_is_possible_to_allow_downloads_of_the_maps_cloud
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
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

@MindManager @Published_Files @Advanced_Options @ViaShareButton @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Qase[WEB-117] @Upd_Qase @JIRA[MMCV-10559]
Scenario: Check_that_it_is_possible_to_show_the_map_in_presentation_view_mode_once_opened
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'CommonATMap.mmap' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'Share' button icon in row with 'CommonATMap' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User clicks the view options menu on Advanced Options page
	When User selects 'Presentation' value in view options dropdown on Advanced Options page
	Then 'Presentation' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User clicks 'Save' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'CommonATMap.mmap' publish file is open to User
	Then Menu toolbar is displayed to Presentation mode

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @Do_Not_Run_With_ViaShareButton @Qase[WEB-117] @Upd_Qase
Scenario: Check_that_it_is_possible_to_show_the_map_in_presentation_view_mode_once_opened_cloud
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'CommonATMap.mmap' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Share' button icon in row with 'CommonATMap.mmap' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then 'Published (Use view setting at time of publishing)' value is displayed in 'View Mode' filed on Advanced Options page
	When User clicks 'View Mode' filed and selects 'Presentation (Overrides view setting at time of publishing)' value in dropdown on Advanced Options page
	Then 'Presentation (Overrides view setting at time of publishing)' value is displayed in 'View Mode' filed on Advanced Options page
	When User clicks 'Save' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'CommonATMap.mmap' publish file is open to User
	Then Menu toolbar is displayed to Presentation mode

@MindManager @Published_Files @Advanced_Options @ViaShareButton @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-118] @Upd_Qase @JIRA[MMCV-10559]
Scenario: Check_that_it_is_possible_to_show_the_map_in_standard_view_mode
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User clicks 'Save' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'auto_test_SRND' publish file is open to User
	Then map is displayed in 'Map' view mode

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-118] @Upd_Qase
Scenario: Check_that_it_is_possible_to_show_the_map_in_standard_view_mode_cloud
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then 'Published (Use view setting at time of publishing)' value is displayed in 'View Mode' filed on Advanced Options page
	When User clicks 'Save' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'auto_test_SRND' publish file is open to User
	Then map is displayed in 'Map' view mode

@MindManager @Published_Files @Advanced_Options @ViaShareButton @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-119] @Upd_Qase @JIRA[MMCV-10559]
Scenario: Check_that_it_is_possible_to_show_the_map_in_tag_view_mode
	Given User uploads following publish files via Api
		| Name           | PublishFile    |
		| auto_test_SRND | Tags mode.mmap |
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User clicks 'Save' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'auto_test_SRND' publish file is open to User
	Then map is displayed in 'Tag' view mode

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-119] @Upd_Qase
Scenario: Check_that_it_is_possible_to_show_the_map_in_tag_view_mode_cloud
	Given User uploads following publish files via Api
		| Name           | PublishFile    |
		| auto_test_SRND | Tags mode.mmap |
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then 'Published (Use view setting at time of publishing)' value is displayed in 'View Mode' filed on Advanced Options page
	When User clicks 'Save' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'auto_test_SRND' publish file is open to User
	Then map is displayed in 'Tag' view mode

@MindManager @Published_Files @Advanced_Options @ViaShareButton @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-120] @Upd_Qase @Build_24.1.109 @JIRA[MMCV-10559]
Scenario: Check_that_it_is_possible_to_show_the_map_in_icon_view_mode
	Given User uploads following publish files via Api
		| Name           | PublishFile     |
		| auto_test_SRND | Icons mode.mmap |
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User clicks 'Back' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'auto_test_SRND' publish file is open to User
	Then map is displayed in 'Icon' view mode

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @Cleanup @Do_Not_Run_With_ViaShareButton @Qase[WEB-120] @Upd_Qase
Scenario: Check_that_it_is_possible_to_show_the_map_in_icon_view_mode_cloud
	Given User uploads following publish files via Api
		| Name           | PublishFile     |
		| auto_test_SRND | Icons mode.mmap |
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then 'Published (Use view setting at time of publishing)' value is displayed in 'View Mode' filed on Advanced Options page
	When User clicks 'Save' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'auto_test_SRND' publish file is open to User
	Then map is displayed in 'Icon' view mode

@MindManager @Published_Files @Advanced_Options @ViaShareButton @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Qase[WEB-121] @Upd_Qase @JIRA[MMCV-10559]
Scenario: Check_that_it_is_possible_to_show_the_map_in_slide_mode
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'Slide.mdeck' published file via Api
	Given User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'Share' button icon in row with 'Slide.mdeck' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User clicks 'Save' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'Slide.mdeck' publish file is open to User
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @Do_Not_Run_With_ViaShareButton @Qase[WEB-121] @Upd_Qase
Scenario: Check_that_it_is_possible_to_show_the_map_in_slide_mode_cloud
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'Slide.mdeck' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Share' button icon in row with 'Slide.mdeck' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then 'Published (Use view setting at time of publishing)' value is displayed in 'View Mode' filed on Advanced Options page
	When User clicks 'Save' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'Slide.mdeck' publish file is open to User
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode

@MindManager @Published_Files @Advanced_Options @ViaShareButton @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-122] @Upd_Qase  @Build_24.1.109
Scenario: Check_that_published_map_is_fit_to_the_screen_on_opening_using_share_button
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode      | mapFitContent |
		| published | false         |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode
	When User remembers map size
	When User close Active tab
	When User switches to '0' tab
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then checkbox by label 'Automatically Fit Content' is unchecked
	When User checks checkbox by label 'Automatically Fit Content'
	Then checkbox by label 'Automatically Fit Content' is checked
	When User clicks 'Back' button
	When User waits '2000' miliseconds
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode
	Then map is Zoomed in

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-122] @Upd_Qase
Scenario: Check_that_published_map_is_fit_to_the_screen_on_opening_cloud_using_share_button
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode      | mapFitContent |
		| published | false         |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode
	When User remembers map size
	When User close Active tab
	When User switches to '0' tab
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then checkbox by label 'Automatically Fit Content' is unchecked
	When User checks checkbox by label 'Automatically Fit Content'
	Then checkbox by label 'Automatically Fit Content' is checked
	When User clicks 'Save' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode
	Then map is Zoomed in

@MindManager @Published_Files @Advanced_Options @ViaShareButton @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-123] @Upd_Qase
Scenario: Check_open_links_from_published_files_using_share_button
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode      | TopicClickOpensLink |
		| published | false               |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	Then file manager header page is displayed to User
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User switches to iframe
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then checkbox by label 'Clicking Topic Opens Link (Applies to topics with one link only)' is unchecked
	When User checks checkbox by label 'Clicking Topic Opens Link (Applies to topics with one link only)'
	Then checkbox by label 'Clicking Topic Opens Link (Applies to topics with one link only)' is checked
	When User clicks 'Save' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	When tutorial card is set to 'false' on navigation panel
	When User clicks 'LinkTopic' topic on Canvas
	When User switches to '2' tab
	Then page url is 'https://www.google.com/'
	Then 'PanelPublished' side panel with 'Attachments & Links' header is not displayed to the User

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-123] @Upd_Qase
Scenario: Check_open_links_from_published_files_cloud_using_share_button
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode      | TopicClickOpensLink |
		| published | false               |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then checkbox by label 'Clicking Topic Opens Link (Applies to topics with one link only)' is unchecked
	When User checks checkbox by label 'Clicking Topic Opens Link (Applies to topics with one link only)'
	Then checkbox by label 'Clicking Topic Opens Link (Applies to topics with one link only)' is checked
	When User clicks 'Save' button
	When User switches to default content
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	When tutorial card is set to 'false' on navigation panel
	When User clicks 'LinkTopic' topic on Canvas
	When User switches to '2' tab
	Then page url is 'https://www.google.com/'
	Then 'PanelPublished' side panel with 'Attachments & Links' header is not displayed to the User

@MindManager @Published_Files @Advanced_Options @ViaShareButton @App_QA @App_Staging @App_Prod @Do_Not_Run_With_Advanced_Options @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-124] @Upd_Qase
Scenario: Check_that_it_is_possible_to_require_the_password_to_view_the_map
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then checkbox by label 'Require Password to View' is unchecked
	When User checks checkbox by label 'Require Password to View'
	Then checkbox by label 'Require Password to View' is checked
	Then 'password' enter field is displayed to User
	Then 'Enter Password...' placeholder is displayed in 'password' enter field
	When User enters '12345678' in the 'password' field
	Then '12345678' value is displayed to the 'password' field
	When User waits for data loading
	When User clicks 'Save' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'auto_test_SRND' publish file is open to User
	Then 'password' enter field is displayed to User
	When User enters '12345678' in the 'password' field
	When User clicks 'Go' button
	Then 'auto_test_SRND' publish file is open to User

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-124] @Upd_Qase
Scenario: Check_that_it_is_possible_to_require_the_password_to_view_the_map_cloud
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	Then checkbox by label 'Require Password to View' is unchecked
	When User checks checkbox by label 'Require Password to View'
	Then checkbox by label 'Require Password to View' is checked
	Then 'password' enter field is displayed to User
	Then 'Enter Password...' placeholder is displayed in 'password' enter field
	When User enters '12345678' in the 'password' field
	Then '12345678' value is displayed to the 'password' field
	When User clicks 'Save' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'auto_test_SRND' publish file is open to User
	Then 'password' enter field is displayed to User
	When User enters '12345678' in the 'password' field
	When User clicks 'Go' button
	Then 'auto_test_SRND' publish file is open to User

@MindManager @Published_Files @Advanced_Options @ViaShareButton @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-124] @Upd_Qase
Scenario: Check_the_show_and_hide_password_characters
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User checks checkbox by label 'Require Password to View'
	Then checkbox by label 'Require Password to View' is checked
	When User waits for data loading
	When User enters '12345' in the 'password' field
	When User clicks 'Show' button in the Password field on the Advanced Options page
	Then password characters are Show to the User
	When User clicks 'Hide' button in the Password field on the Advanced Options page
	Then password characters are Hidden to the User

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-124] @Upd_Qase
Scenario: Check_the_show_and_hide_password_characters_cloud
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Advanced Options' item in 'file-manager' dropdown menu
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User checks checkbox by label 'Require Password to View'
	Then checkbox by label 'Require Password to View' is checked
	When User waits for data loading
	When User enters '12345' in the 'password' field
	When User clicks 'Show' button in the Password field on the Advanced Options page
	Then password characters are Show to the User
	When User clicks 'Hide' button in the Password field on the Advanced Options page
	Then password characters are Hidden to the User

@MindManager @Published_Files @Advanced_Options @ViaShareButton @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-125] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_storage_location_of_published_map
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
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
	When User click Storage Location field
	Then following Storage Location drop-down list is displayed:
		| StorageLocation      |
		| EU (Frankfurt)       |
		| North America (West) |
	When User selects 'EU (Frankfurt)' in Storage Location dropdown
	Then value 'EU (Frankfurt)' is displayed in Storage Location field

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-125] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_storage_location_of_published_map_cloud
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
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
	When User click Storage Location field
	Then following Storage Location drop-down list is displayed:
		| StorageLocation      |
		| EU (Frankfurt)       |
		| North America (West) |
	When User selects 'EU (Frankfurt)' in Storage Location dropdown
	Then value 'EU (Frankfurt)' is displayed in Storage Location field

@MindManager @Published_Files @Advanced_Options @ViaShareButton @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-126] @Upd_Qase @Build_24.1.109
Scenario: Check_that_it_is_possible_to_add_custom_branding_to_the_map_in_published_view
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User add 'FruitImages.jpg' image on the Advanced Options page
	Then Image is displayed to the User on the Advanced Options page
	When User clicks 'Back' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'auto_test_SRND' publish file is open to User
	Then 'FruitImages.jpg' logo is displayed in 'ToolbarPageElement' container on 'left' side

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-126] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_custom_branding_to_the_map_in_published_view_cloud
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User add 'FruitImages.jpg' image on the Advanced Options page
	Then Image is displayed to the User on the Advanced Options page
	When User clicks 'Save' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'auto_test_SRND' publish file is open to User
	Then 'FruitImages.jpg' logo is displayed in 'ToolbarPageElement' container on 'left' side

@MindManager @Published_Files @Advanced_Options @ViaShareButton @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-127] @Upd_Qase @Build_24.1.109
Scenario: Check_that_it_is_possible_to_add_custom_branding_to_the_map_in_presentation_view
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User add 'FruitImages.jpg' image on the Advanced Options page
	Then Image is displayed to the User on the Advanced Options page
	When User clicks 'Back' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'auto_test_SRND' publish file is open to User
	When User waits for data loading
	Then Menu toolbar is displayed to Presentation mode
	Then Custom logo is displayed in 'PresentationModeMenuToolbarPage' container

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-127] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_custom_branding_to_the_map_in_presentation_view_cloud
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User add 'FruitImages.jpg' image on the Advanced Options page
	Then Image is displayed to the User on the Advanced Options page
	When User clicks 'Save' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'auto_test_SRND' publish file is open to User
	Then Custom logo is displayed in 'PresentationModeMenuToolbarPage' container

@MindManager @Published_Files @Advanced_Options @ViaShareButton @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-128] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_a_hyperlink_to_the_branding
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User add 'FruitImages.jpg' image on the Advanced Options page
	Then Image is displayed to the User on the Advanced Options page
	Then 'branding-logo-hyperlink' enter field is displayed to User
	Then 'Enter logo hyperlink (if blank, logo does not hyperlink)' placeholder is displayed in 'branding-logo-hyperlink' enter field
	When User enters 'https://www.facebook.com' in the 'branding-logo-hyperlink' field
	When User clicks 'Back' button
	When User clicks 'Back' button
	When User waits '1000' miliseconds
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then Menu toolbar is displayed to Presentation mode
	Then 'FruitImages.jpg' logo is displayed in 'PresentationModeMenuToolbarPage' container on 'left' side
	When User clicks Logo image on Menu toolbar
	When User switches to '2' tab
	Then page url is 'https://www.facebook.com'

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-128] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_a_hyperlink_to_the_branding_cloud
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User add 'FruitImages.jpg' image on the Advanced Options page
	Then Image is displayed to the User on the Advanced Options page
	Then 'branding-logo-hyperlink' enter field is displayed to User
	When User enters 'https://www.facebook.com' in the 'branding-logo-hyperlink' field
	When User clicks 'Save' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then Menu toolbar is displayed to Presentation mode
	Then 'FruitImages.jpg' logo is displayed in 'PresentationModeMenuToolbarPage' container on 'left' side
	When User clicks Logo image on Menu toolbar
	When User switches to '2' tab
	Then page url is 'https://www.facebook.com'

@MindManager @Published_Files @Advanced_Options @ViaShareButton @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-129] @Upd_Qase
Scenario: Check_that_it_is_possible_to_remove_custom_logo_from_published_map
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User add 'FruitImages.jpg' image on the Advanced Options page
	Then Image is displayed to the User on the Advanced Options page
	When User clicks Remove button to the choose image field
	Then Image is not displayed on the Advanced Options page to User
	When User clicks 'Back' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then Menu toolbar is displayed to Presentation mode
	Then 'default' logo is displayed in 'PresentationModeMenuToolbarPage' container on 'right' side

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-129] @Upd_Qase
Scenario: Check_that_it_is_possible_to_remove_custom_logo_from_published_map_cloud
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
	Then header 'Advanced Options' is displayed on page
	When User switches to iframe
	When User add 'FruitImages.jpg' image on the Advanced Options page
	Then Image is displayed to the User on the Advanced Options page
	When User clicks Remove button to the choose image field
	Then Image is not displayed on the Advanced Options page to User
	When User clicks 'Back' button
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then Menu toolbar is displayed to Presentation mode
	Then 'default' logo is displayed in 'PresentationModeMenuToolbarPage' container on 'right' side

@MindManager @Published_Files @Advanced_Options @ViaShareButton @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-130] @JIRA[MMCV-10362] @Upd_Qase
Scenario: Check_that_it_is_possible_to_remove_a_hyperlink_from_the_branding
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
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
	When User opens published file with 'auto_test_SRND' name in browser via Api
	Then Menu toolbar is displayed to Presentation mode
	Then 'FruitImages.jpg' logo is displayed in 'PresentationModeMenuToolbarPage' container on 'left' side
	When User clicks Logo image on Menu toolbar
	Then '1' count tab is open in browser

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-130] @Upd_Qase
Scenario: Check_that_it_is_possible_to_remove_a_hyperlink_from_the_branding_cloud
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks 'Advanced Options' button
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
	When User opens published file with 'auto_test_SRND' name in browser via Api
	Then Menu toolbar is displayed to Presentation mode
	Then 'FruitImages.jpg' logo is displayed in 'PresentationModeMenuToolbarPage' container on 'left' side
	When User clicks Logo image on Menu toolbar
	Then '1' count tab is open in browser

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-165] @Upd_Qase
Scenario: To_verify_that_view_count_is_displayed
	Given '7' User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given '7' User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	Then file manager header page is displayed to User
	Then '0' view is displayed in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	When User close Active tab
	When User switches to '0' tab
	When User refresh page
	Then file manager header page is displayed to User
	Then '1' view is displayed in row with 'auto_test_SRND' file name of Published Files table

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-166] @Upd_Qase
Scenario: To_verify_Select_all_button
	Given '7' User uploads following publish files via Api
		| Name                      | PublishFile             |
		| auto_test_SRND            | Map_For_Automation.mmap |
		| auto_test_second_map_SRND | Map_For_Automation.mmap |
		| auto_test_third_map_SRND  | Map_For_Automation.mmap |
	Given '7' User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	Then file manager header page is displayed to User
	When User clicks Select All button
	Then All files are selected
	Then 'delete' button is enabled in the Published Files tab
	Then 'favourite' button is enabled in the Published Files tab
	When User clicks Unselect All button
	Then checkbox is unchecked in row 'auto_test_SRND' of Published Files table
	Then checkbox is unchecked in row 'auto_test_second_map_SRND' of Published Files table
	Then checkbox is unchecked in row 'auto_test_third_map_SRND' of Published Files table
	Then 'delete' button is disabled in the Published Files tab
	Then 'favourite' button is disabled in the Published Files tab
	Then 'Select All' is displayed in the Published Files tab
	When User checks checkbox in 'auto_test_SRND' row of Published Files table
	Then checkbox is checked in row 'auto_test_SRND' of Published Files table
	Then '1 Selected' is displayed in the Published Files tab
	Then 'delete' button is enabled in the Published Files tab
	Then 'favourite' button is enabled in the Published Files tab

@MindManager @Published_Files @Advanced_Options @ViaShareButton @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Do_Not_Run_With_ViaShareButton @Cleanup @Qase[WEB-167] @Upd_Qase @JIRA[MMCV-9156]
Scenario: To_verify_Unshare_button
	Given '7' User uploads following publish files via Api
		| Name                      | PublishFile             |
		| auto_test_SRND            | Map_For_Automation.mmap |
		| auto_test_second_map_SRND | Map_For_Automation.mmap |
		| auto_test_third_map_SRND  | Map_For_Automation.mmap |
	Given '7' User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	Then file manager header page is displayed to User
	Then 'Select All' is displayed in the Published Files tab
	When User checks checkbox in 'auto_test_SRND' row of Published Files table
	Then checkbox is checked in row 'auto_test_SRND' of Published Files table
	Then '1 Selected' is displayed in the Published Files tab
	Then 'delete' button is enabled in the Published Files tab
	Then 'favourite' button is enabled in the Published Files tab
	When User clicks published files delete button
	When User waits for data loading
	Then header 'Un-publish Complete!' is displayed on page
	When User switches to iframe
	Then following files are displayed in the Unpublished file list
		| File           |
		| auto_test_SRND |
	When User clicks 'Done' button
	Then File manager content is displayed to User
	Then following files are displayed in Published Files table
		| Name                      |
		| auto_test_second_map_SRND |
		| auto_test_third_map_SRND  |