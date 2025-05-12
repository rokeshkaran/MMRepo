@retry(2)
Feature: LoginLogout
	
@MindManager @Cloud_Services @DropBox @LoginLogout @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-81] @Upd_Qase @Not_Run
#Blocked due to two factor authentication and requires investigation
Scenario: Log_out_from_DropBox
Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to Dropbox cloud
	Then 'Dropbox' cloud with 'automationtestmj@gmail.com' user is displayed on navigation panel
	When User clicks settings icon on content navigation panel
	Then 'File Options' title is displayed on navigation panel
	Then 'Sign Out of Dropbox' item with 'automationtestmj@gmail.com' description is exist on page
	When User clicks 'Sign Out of Dropbox' content item with 'automationtestmj@gmail.com' description
	Then 'Dropbox' item with 'automationtestmj@gmail.com' description is not dislayed on content manager page
	When User clicks 'New' tab on file manager header page