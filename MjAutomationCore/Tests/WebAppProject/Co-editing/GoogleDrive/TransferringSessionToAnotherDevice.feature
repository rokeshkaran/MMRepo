@retry(2)
Feature: TransferringSessionToAnotherDevice
Check that functionality of transferring session to another device

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath                   |
		| auto_test_SRND.mmap | NavigationControlsMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @Co_Editing @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-199] @Upd_Qase
Scenario: Verify_that_the_map_closes_on_closing_Co-editing_session_disconnected_dialog
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	#User B logged in again in a new browser
	When User openes 'chrome' browser
	When User switches to '2' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User switches to '1' browser
	Then Fullscreen Dialog window is displayed to User
	Then User sees 'Your account was used to access the session from another browser or device.' text messege in Fullscreen Dialog window
	When User clicks close button in Fullscreen Dialog window
	Then 'New' tab is displayed on file manager header page

@MindManager @Co_Editing @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-200] @Upd_Qase
 Scenario: Verify_that_the_map_closes_on_clicking_outside_the_Co-editing_session_disconnected_dialog
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	#User B logged in again in a new browser
	When User openes 'chrome' browser
	When User switches to '2' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User switches to '1' browser
	Then Fullscreen Dialog window is displayed to User
	Then User sees 'Your account was used to access the session from another browser or device.' text messege in Fullscreen Dialog window
	When User clicks outside of Fullscreen Dialog
	Then Fullscreen Dialog window is not displayed to User
	Then 'New' tab is displayed on file manager header page