@retry(2)
Feature: AccountUI_de
Verification that Web App Users have additional capabilities in German

Background: Pre-condition
	Given User is logged into MindManager web app via Api

@MindManager @AccountUI @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2955] @Locale_German @Upd_Qase
Scenario: Check_the_UI_of_the_web_application_fr
	Then 'Neu' tab is displayed on file manager header page
	Then 'Meine Dateien' tab is displayed on file manager header page
	Then 'Veröffentlichte Dateien' tab is displayed on file manager header page
	Then 'Neu' tab is active on file manager header page

@MindManager @AccountUI @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2956] @Locale_German @Upd_Qase
Scenario: Check_the_My_Files_tab_UI_fr
	When User clicks 'Meine Dateien' tab on file manager header page
	When User waits '1500' miliseconds
	Then 'Meine Dateien' tab is active on file manager header page
	Then content page is displayed to User
	Then on the page exist 'Ort hinzufügen' content item with 'Zum Auswählen des Speicheranbieters tippen' description
	When User select 'Ort hinzufügen' content item with 'Zum Auswählen des Speicheranbieters tippen' description
	Then following cloud items are displayed to the User:
		| items      |
		| Box        |
		| Dropbox    |
		| Google     |
		| OneDrive   |
		| SharePoint |
	Then 'Zurück' button is displayed on content manager page

@MindManager @AccountUI @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2957] @Locale_German @Upd_Qase
Scenario: Check_the_New_tab_UI_fr
	Then 'Neu' tab is active on file manager header page
	Then cloud templates page is displayed to User

@MindManager @AccountUI @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2958] @Locale_German @Upd_Qase
Scenario: Check_the_Published_files_screen_in_users_account_fr
	Then 'Neu' tab is displayed on file manager header page
	Then 'Meine Dateien' tab is displayed on file manager header page
	Then 'Veröffentlichte Dateien' tab is displayed on file manager header page
	When User clicks 'Veröffentlichte Dateien' tab on file manager header page
	Then 'Veröffentlichte Dateien' tab is active on file manager header page