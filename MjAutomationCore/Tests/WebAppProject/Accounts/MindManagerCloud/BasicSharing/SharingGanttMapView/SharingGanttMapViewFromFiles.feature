@retry(2)
Feature: SharingGanttMapViewFromFiles
To verify it is possible to share the map in chosen view from files

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User clicks 'For QA Automation' folder
	When User clicks 'RuntimeData File' folder
	When User waits for data loading
	When User hovers on 'auto_test_SRND' file and clicks on 'share-icon' action button
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	Then 'Map View' option is chosen in dropdown 'share-file-dialog-select' menu by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-3017] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_share_map_via_link_in_Map_view_from_files
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can edit' option from dropdown 'share-file-dialog-select'
	When User clicks selectbox by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog and selects 'Map View' option from dropdown 'share-file-dialog-select'	
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-3016] @Cleanup @Upd_Qase @JIRA[MMCV-10702]
Scenario: Verify_that_it_is_possible_to_share_map_via_link_in_Gantt_view_from_files
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can edit' option from dropdown 'share-file-dialog-select'
	When User clicks selectbox by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog and selects 'Gantt View' option from dropdown 'share-file-dialog-select'	
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-3011] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_share_map_individually_in_Gantt_view_from_files
	When User clicks 'Done' button in 'share-file-dialog' dialog
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	Then 'share' Menu is displayed to User
	When User clicks button with 'Share' name in 'share' menu
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	Then 'Map View' option is chosen in dropdown 'share-file-dialog-select' menu by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog
	When User clicks selectbox by label 'select-options-email' in 'People you specify' section of 'share-file-dialog' dialog and selects 'can edit' option from dropdown 'share-file-dialog-select'
	When User enters 'automationtestmm1@meta.ua' value by character in the 'search' field in 'share-file-dialog' dialog
	When User presses the ',' key on the keyboard
	When User clicks 'Invite' button in 'share-file-dialog' dialog
	When User clicks 'Done' button in 'share-file-dialog' dialog
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'gantt-view' name in 'view' menu
	Then Gantt toolbar is displayed to User
	When User clicks on the toolbar logo of Tools panel
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	When User waits for data loading
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-3010] @Cleanup @Upd_Qase @JIRA[MMCV-10702]
Scenario: Verify_that_it_is_possible_to_share_map_individually_and_open_it_via_email_in_Gantt_view_from_files
	When User clicks selectbox by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog and selects 'Gantt View' option from dropdown 'share-file-dialog-select'	
	When User clicks selectbox by label 'select-options-email' in 'People you specify' section of 'share-file-dialog' dialog and selects 'can edit' option from dropdown 'share-file-dialog-select'
	When User enters 'auto.test+SRND@mindmanager.onmicrosoft.com' value by character in the 'search' field in 'share-file-dialog' dialog	
	When User presses the ',' key on the keyboard
	When User clicks 'Invite' button in 'share-file-dialog' dialog
	Given User account
		| Email                                      | Password   |
		| auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	When User openes 'chrome' browser
	Given User is logged into 'auto.test+SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User waits for data loading
	Then Right Side panel is displayed
	Then 'Start Free Trial' button is displayed
	When User clicks 'Start Free Trial' button
	When 'auto.test+SRND@mindmanager.onmicrosoft.com' User opens 'auto_test_SRND' shared link from outlook email inbox
	When User switches to '1' tab
	When User waits for data loading
	Then Right Side panel is displayed
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits for data loading
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-3013] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_share_map_individually_and_open_it_via_email_in_Map_view_from_files
	When User clicks selectbox by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog and selects 'Map View' option from dropdown 'share-file-dialog-select'	
	When User clicks selectbox by label 'select-options-email' in 'People you specify' section of 'share-file-dialog' dialog and selects 'can edit' option from dropdown 'share-file-dialog-select'
	When User enters 'auto.test+SRND@mindmanager.onmicrosoft.com' value by character in the 'search' field in 'share-file-dialog' dialog
	When User presses the ',' key on the keyboard
	When User clicks 'Invite' button in 'share-file-dialog' dialog
	Given User account
		| Email                                      | Password   |
		| auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	When User openes 'chrome' browser
	Given User is logged into 'auto.test+SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User waits for data loading
	Then Right Side panel is displayed
	Then 'Start Free Trial' button is displayed
	When User clicks 'Start Free Trial' button
	When 'auto.test+SRND@mindmanager.onmicrosoft.com' User opens 'auto_test_SRND' shared link from outlook email inbox
	When User switches to '1' tab
	When User waits for data loading
	Then Right Side panel is displayed
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	Then Web Editor page is displayed to the User