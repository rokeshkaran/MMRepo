@retry(2)
Feature: LoginLogout

@MindManager @Cloud_Services @Google @LoginLogout @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-82] @Upd_Qase @Not_Run
#Blocked due to two factor authentication and requires investigation
Scenario: Log_out_from_Google
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to Google cloud
	Then 'Google' cloud with 'automationtestmj@gmail.com' user is displayed on navigation panel
	Then 'My Drive' item with 'drive' description is exist on page
	Then 'Shared With Me' item with 'drive' description is exist on page
	When User clicks settings icon on content navigation panel
	Then 'File Options' title is displayed on navigation panel
	Then 'Sign Out of Google' item with 'automationtestmj@gmail.com' description is exist on page
	When User clicks 'Sign Out of Google' content item with 'automationtestmj@gmail.com' description
	Then 'Google' item with 'automationtestmj@gmail.com' description is not dislayed on content manager page