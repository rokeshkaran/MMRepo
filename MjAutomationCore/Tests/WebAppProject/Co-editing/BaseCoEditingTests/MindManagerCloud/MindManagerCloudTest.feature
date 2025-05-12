@retry(2)
Feature: MindManagerCloudTest
Check co-editing mode for mind manager files

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
	When User hovers on 'auto_test_SRND' file and clicks on 'share-icon' action button
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading

	#Using 'Copy link' 
@MindManager @Co_Editing @MindManagerCloud @App_QA @App_Staging @App_Prod @Qase[WEB-1892] @Cleanup @Upd_Qase @JIRA[MMCV-9790]
Scenario: Verify_that_MindManager_file_can_be_co_edited
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can edit' option from dropdown 'share-file-dialog-select'
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then 'info accepted' dialog is displayed to User
	Then Invite others to edit link is copied to clipboard
	When User clicks 'Done' button in 'share-file-dialog' dialog
	When User clicks 'auto_test_SRND' file
	Then Web Editor page is displayed to the User
	Then 'auto_test_SRND' map name is displayed on Toolbar
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given User '1'  opens shared map link in browser and logged into MindManager web app
	Then Web Editor page is displayed to the User
	#User B Actions
	When User switches to '0' browser
	When User clicks 'MT' topic on Canvas
	When User clicks 'Icons' button of side Toolbox
	When User clicks 'Down' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Down' Icon is displayed to the 'MT' Topic
	#User A Actions
	When User switches to '1' browser
	When User waits '1000' miliseconds
	Then 'Down' Icon is displayed to the 'MT' Topic

	#Using 'Copy link' 
@MindManager @Co_Editing @MindManagerCloud @App_QA @App_Staging @App_Prod @Qase[WEB-1892] @Cleanup @Upd_Qase @JIRA[MMCV-9790]
Scenario: Verify_that_MindManager_file_can_be_co_edited_with_three_Users
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can edit' option from dropdown 'share-file-dialog-select'
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then 'info accepted' dialog is displayed to User
	Then Invite others to edit link is copied to clipboard
	When User clicks 'Done' button in 'share-file-dialog' dialog
	When User clicks 'auto_test_SRND' file
	Then Web Editor page is displayed to the User
	Then 'auto_test_SRND' map name is displayed on Toolbar
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given User '1'  opens shared map link in browser and logged into MindManager web app
	Then Web Editor page is displayed to the User
	#User C logged in
	When User openes 'chrome' browser
	When User switches to '2' browser
	Given User '2'  opens shared map link in browser and logged into MindManager web app
	Then Web Editor page is displayed to the User
	#User B Actions
	When User switches to '0' browser
	When User clicks 'MT' topic on Canvas
	When User clicks 'Icons' button of side Toolbox
	When User clicks 'Down' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Down' Icon is displayed to the 'MT' Topic
	#User A Actions
	When User switches to '1' browser
	When User waits '1000' miliseconds
	Then 'Down' Icon is displayed to the 'MT' Topic
	#User C Actions
	When User switches to '2' browser
	When User waits '1000' miliseconds
	Then 'Down' Icon is displayed to the 'MT' Topic