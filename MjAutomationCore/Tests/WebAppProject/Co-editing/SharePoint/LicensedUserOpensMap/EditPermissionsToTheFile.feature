@retry(2)
Feature: EditPermissionsToTheFile

@MindManager @Co_Editing @EditPermissionsToTheFile @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-204] @Upd_Qase
Scenario: Map_is_not_in_use
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'CT' topic on Canvas
	Then '2' plus is displayed on border in topic
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'coedit' name in 'OverlayPanelPageElement' container
	Then 'coedit' Menu is displayed to User
	Then button with 'Co-editing enabled' name is displayed in 'coedit' menu	

@MindManager @Co_Editing @EditPermissionsToTheFile @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-205] @Upd_Qase
Scenario: Map_is_in_use
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	# User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User refresh page
	When User waits for data loading
	Then Web Editor page is displayed to the User
	When User clicks 'CT' topic on Canvas
	Then '2' plus is displayed on border in topic
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'coedit' name in 'OverlayPanelPageElement' container
	Then 'coedit' Menu is displayed to User
	Then button with 'show-participants' name contains 'View Participants (2)' text in 'coedit' menu