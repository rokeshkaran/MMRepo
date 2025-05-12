@retry(2)
Feature: PublishMap
Check Share functionality in Toolbar Menu for MindManager Files for Published maps

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User waits for data loading
	When User clicks 'For QA Automation' folder
	When User clicks 'RuntimeData File' folder
	When User clicks 'auto_test_SRND' file
	Then Web Editor page is displayed to the User

@MindManager @Gantt_View @Published_Files @App_QA @App_Staging @App_Prod @Qase[WEB-2493] @Cleanup @Upd_Qase
Scenario: Check_that_the_user_can_publish_map_in_Gantt_view_from_Map_view_via_topmenu
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	Then 'share' Menu is displayed to User
	When User clicks button with 'publish' name in 'share' menu
	Then header 'Publish Complete!' is displayed on page
	Then published file with 'auto_test_SRND.mmap' name exists via Api
	When User switches to iframe
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User clicks the view options menu on Advanced Options page
	When User selects 'Gantt view' value in view options dropdown on Advanced Options page
	Then 'Gantt view' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User waits for data loading
	When User clicks 'View' button
	When User switches to '1' tab
	Then 'auto_test_SRND.mmap' publish file is open to User
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode

@MindManager @Gantt_View @Published_Files @App_QA @App_Staging @App_Prod @Qase[WEB-2494] @Cleanup @Upd_Qase
Scenario: Check_that_the_user_can_publish_map_in_Gantt_view_from_Gantt_view_via_topmenu
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'gantt-view' name in 'view' menu
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	Then 'share' Menu is displayed to User
	When User clicks button with 'publish' name in 'share' menu
	Then header 'Publish Complete!' is displayed on page
	Then published file with 'auto_test_SRND.mmap' name exists via Api
	When User switches to iframe
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User clicks the view options menu on Advanced Options page
	When User selects 'Gantt view' value in view options dropdown on Advanced Options page
	Then 'Gantt view' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User waits for data loading
	When User clicks 'View' button
	When User switches to '1' tab
	Then 'auto_test_SRND.mmap' publish file is open to User
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode

@MindManager @Gantt_View @Published_Files @App_QA @App_Staging @App_Prod @Qase[WEB-2494] @Cleanup @Upd_Qase
Scenario: Check_that_the_user_can_publish_map_in_Gantt_view_from_Gantt_view_in_default_type_via_topmenu
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'gantt-view' name in 'view' menu
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode
	When User waits '2000' miliseconds
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	Then 'share' Menu is displayed to User
	When User clicks button with 'publish' name in 'share' menu
	Then header 'Publish Complete!' is displayed on page
	Then published file with 'auto_test_SRND.mmap' name exists via Api
	When User waits for data loading
	When User switches to iframe
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User clicks 'View' button
	When User switches to '1' tab
	Then 'auto_test_SRND.mmap' publish file is open to User
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode

@MindManager @Gantt_View @Published_Files @App_QA @App_Staging @App_Prod @Qase[WEB-2495] @Cleanup @Upd_Qase
Scenario: Check_that_the_user_can_publish_map_in_Map_view_from_Gantt_view_via_topmenu
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'gantt-view' name in 'view' menu
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	Then 'share' Menu is displayed to User
	When User clicks button with 'publish' name in 'share' menu
	Then header 'Publish Complete!' is displayed on page
	Then published file with 'auto_test_SRND.mmap' name exists via Api
	When User switches to iframe
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User clicks the view options menu on Advanced Options page
	When User selects 'Map view' value in view options dropdown on Advanced Options page
	Then 'Map view' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User waits for data loading
	When User clicks 'View' button
	When User switches to '1' tab
	Then 'auto_test_SRND.mmap' publish file is open to User
	Then map is displayed in 'Map' view mode

@MindManager @Gantt_View @Published_Files @App_QA @App_Staging @App_Prod @Qase[WEB-2496] @Cleanup @Upd_Qase
Scenario: Check_that_the_user_can_publish_map_in_Map_view_from_Map_view_in_default_type_via_topmenu
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	Then 'share' Menu is displayed to User
	When User clicks button with 'publish' name in 'share' menu
	Then header 'Publish Complete!' is displayed on page
	Then published file with 'auto_test_SRND.mmap' name exists via Api
	When User switches to iframe
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User waits for data loading
	When User clicks 'View' button
	When User switches to '1' tab
	Then 'auto_test_SRND.mmap' publish file is open to User
	Then map is displayed in 'Map' view mode

@MindManager @Gantt_View @Published_Files @App_QA @App_Staging @App_Prod @Qase[WEB-2496] @Cleanup @Upd_Qase
Scenario: Check_that_the_user_can_publish_map_in_Map_view_from_Map_view_via_topmenu
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	Then 'share' Menu is displayed to User
	When User clicks button with 'publish' name in 'share' menu
	Then header 'Publish Complete!' is displayed on page
	Then published file with 'auto_test_SRND.mmap' name exists via Api
	When User switches to iframe
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User clicks the view options menu on Advanced Options page
	When User selects 'Map view' value in view options dropdown on Advanced Options page
	Then 'Map view' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User waits for data loading
	When User clicks 'View' button
	When User switches to '1' tab
	Then 'auto_test_SRND.mmap' publish file is open to User
	Then map is displayed in 'Map' view mode

@MindManager @Gantt_View @Published_Files @App_QA @App_Staging @App_Prod @Qase[WEB-2497] @Cleanup @Upd_Qase
Scenario: Check_that_the_user_can_publish_map_in_Gantt_view_from_Map_view_via_toolbar
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'publish' name in 'share-contextmenu' menu
	Then header 'Publish Complete!' is displayed on page
	Then published file with 'auto_test_SRND.mmap' name exists via Api
	When User switches to iframe
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User clicks the view options menu on Advanced Options page
	When User selects 'Gantt view' value in view options dropdown on Advanced Options page
	Then 'Gantt view' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User waits for data loading
	When User clicks 'View' button
	When User switches to '1' tab
	Then 'auto_test_SRND.mmap' publish file is open to User
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode

@MindManager @Gantt_View @Published_Files @App_QA @App_Staging @App_Prod @Qase[WEB-2498] @Cleanup @Upd_Qase
Scenario: Check_that_the_user_can_publish_map_in_Gantt_view_from_Gantt_view_via_toolbar
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'gantt-view' name in 'view' menu
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode
	When User clicks 'share' button on Gantt toolbar
	When User clicks button with 'publish' name in 'gantt-share-contextmenu' menu
	Then header 'Publish Complete!' is displayed on page
	Then published file with 'auto_test_SRND.mmap' name exists via Api
	When User switches to iframe
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User clicks the view options menu on Advanced Options page
	When User selects 'Gantt view' value in view options dropdown on Advanced Options page
	Then 'Gantt view' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User waits for data loading
	When User clicks 'View' button
	When User switches to '1' tab
	Then 'auto_test_SRND.mmap' publish file is open to User
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode

@MindManager @Gantt_View @Published_Files @App_QA @App_Staging @App_Prod @Qase[WEB-2498] @Cleanup @Upd_Qase
Scenario: Check_that_the_user_can_publish_map_in_Gantt_view_from_Gantt_view_in_default_type_via_toolbar
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'gantt-view' name in 'view' menu
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode
	When User clicks 'share' button on Gantt toolbar
	When User clicks button with 'publish' name in 'gantt-share-contextmenu' menu
	Then header 'Publish Complete!' is displayed on page
	Then published file with 'auto_test_SRND.mmap' name exists via Api
	When User switches to iframe
	When User waits '3000' miliseconds
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User waits for data loading
	When User clicks 'View' button
	When User switches to '1' tab
	Then 'auto_test_SRND.mmap' publish file is open to User
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode

@MindManager @Gantt_View @Published_Files @App_QA @App_Staging @App_Prod @Qase[WEB-2499] @Cleanup @Upd_Qase
Scenario: Check_that_the_user_can_publish_map_in_Map_view_from_Gantt_view_via_toolbar
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'gantt-view' name in 'view' menu
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode
	When User clicks 'share' button on Gantt toolbar
	When User clicks button with 'publish' name in 'gantt-share-contextmenu' menu
	Then header 'Publish Complete!' is displayed on page
	Then published file with 'auto_test_SRND.mmap' name exists via Api
	When User switches to iframe
	When User clicks the view options menu on Advanced Options page
	When User selects 'Map view' value in view options dropdown on Advanced Options page
	Then 'Map view' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User waits for data loading
	When User clicks 'View' button
	When User switches to '1' tab
	Then 'auto_test_SRND.mmap' publish file is open to User
	Then map is displayed in 'Map' view mode

@MindManager @Gantt_View @Published_Files @App_QA @App_Staging @App_Prod @Qase[WEB-2500] @Cleanup @Upd_Qase
Scenario: Check_that_the_user_can_publish_map_in_Map_view_from_Map_view_via_toolbar
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	Then 'share' Menu is displayed to User
	When User clicks button with 'publish' name in 'share' menu
	Then header 'Publish Complete!' is displayed on page
	Then published file with 'auto_test_SRND.mmap' name exists via Api
	When User switches to iframe
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User clicks the view options menu on Advanced Options page
	When User selects 'Map view' value in view options dropdown on Advanced Options page
	Then 'Map view' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User waits for data loading
	When User clicks 'View' button
	When User switches to '1' tab
	Then 'auto_test_SRND.mmap' publish file is open to User
	Then map is displayed in 'Map' view mode

@MindManager @Gantt_View @Published_Files @App_QA @App_Staging @App_Prod @Qase[WEB-2500] @Cleanup @Upd_Qase
Scenario: Check_that_the_user_can_publish_map_in_Map_view_from_Map_view_in_default_type_via_toolbar
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	Then 'share' Menu is displayed to User
	When User clicks button with 'publish' name in 'share' menu
	Then header 'Publish Complete!' is displayed on page
	Then published file with 'auto_test_SRND.mmap' name exists via Api
	When User switches to iframe
	Then 'Use current view at time of publishing/updating' option is selected in Publish View Dropdown Menu on Advanced Options page
	When User waits for data loading
	When User clicks 'View' button
	When User switches to '1' tab
	Then 'auto_test_SRND.mmap' publish file is open to User
	Then map is displayed in 'Map' view mode