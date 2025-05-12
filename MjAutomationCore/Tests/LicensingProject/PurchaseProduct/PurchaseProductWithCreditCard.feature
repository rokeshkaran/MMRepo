@retry(2)
Feature: PurchaseProductWithCreditCard
	Check Purchase Mind Manager

@MindManager @Purchase @Not_Run
Scenario: Check_Purchase_Mind_Manager_with_credit_card
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	Then 'Create Account' button is displayed
	When User provides the Login and Password and clicks on the Sign In button
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	Then 'SharePoint' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	Then 'Documents' folder with 'drive' description is exist on page
	When User clicks 'Documents' folder
	Then 'For QA automation' folder with 'Folder' description is exist on page
	When User clicks 'For QA automation' folder
	Then 'Life_Planner.mmap' file is exist on page
	When User clicks 'Life_Planner.mmap' file
	Then Web Editor page is displayed to the User
	When User click switch button Autosave
	Then Autosave switcher is displayed 'Off' to the User
	When User clicks 'Share' button on Tools panel
	Then following items is displayed in 'toolpanel-share-sub-menu' dropdown menu
	| items                     |
	| Invite Others to Edit     |
	| Publish                   |
	| Download MindManager File |
	When User clicks 'Invite Others to Edit' item in 'toolpanel-share-sub-menu' dropdown menu
	Then header 'Invite Others to Co-Edit This File' is displayed on SOME page
	When User clicks on the 'Copy Link' button and share with other users on SOME page
	When User clicks 'Done' button on SOME page
	Then Web Editor page is displayed to the User
	#User 1
	When User openes 'chrome' browser
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	Then Right Side panel is displayed
	Then 'Create Account' button is displayed
	When '10' User provides the Login and Password
	Then Web Editor page is displayed to the User
	Then User sees 'Co-editing in progress (from SharePoint)' title in overlay
	When User clicks to Subscribe link on Web Editor page
