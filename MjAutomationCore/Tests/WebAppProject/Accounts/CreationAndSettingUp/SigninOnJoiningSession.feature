@retry(2)
Feature: SigninOnJoiningSession
Verification that it is possible to sign in to the account on joining the co-editing session

@MindManager @SigninOnJoiningSession @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-36] @Upd_Qase @JIRA[MMCV-9693]
Scenario: Signin_on_joining_session
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	#MM app
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'copy-link' name in 'share-contextmenu' menu
	Then Invite others to edit link is copied to clipboard
	#User create account to co-editing
	When User openes 'chrome' browser
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then Right Side panel is displayed
	When '1' User provides the Login and Password
	Then Web Editor page is displayed to the User
	Then text 'FTCO' is displayed to the topic on Canvas