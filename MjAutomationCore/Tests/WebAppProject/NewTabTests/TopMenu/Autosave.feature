@retry(2)
Feature: Autosave
	Check Autosave functionality
	
Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @Top_Menu @File @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1224] @Upd_Qase @Do_Not_Run_With_File
Scenario: Check_Autosave_function
	When User remembers modified time for 'Shared Documents/For QA automation/auto_test_SRND.mmap' file on Sharepoint cloud storage
	When User remembers file size for 'Shared Documents/For QA automation/auto_test_SRND.mmap' file on Sharepoint cloud storage
	When User clicks 'CT' topic on Canvas
	When User clicks 'Attachments & Links' button of side Toolbox
	Then 'PanelByName' side panel with 'Attachments & Links' header is displayed to the User
	When User uploads 'FruitImages.jpg' file through 'add-attachment-input' input
	Then 'FruitImages.jpg' item is displayed in 'Attachments' section of 'PanelByName' side panel with 'Attachments & Links' header
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User waits '1000' miliseconds
	When User clicks button with 'close' name in 'file' menu
	When User waits '5000' miliseconds
	Then file size for 'Shared Documents/For QA automation/auto_test_SRND.mmap' file is changed on Sharepoint cloud storage
	Then modified time for 'Shared Documents/For QA automation/auto_test_SRND.mmap' file is changed on Sharepoint cloud storage