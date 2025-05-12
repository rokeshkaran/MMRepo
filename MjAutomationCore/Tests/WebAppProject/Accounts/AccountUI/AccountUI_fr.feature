@retry(2)
Feature: AccountUI_fr
Verification that Web App Users have additional capabilities in French

Background: Pre-condition
	Given User is logged into MindManager web app via Api

@MindManager @AccountUI @App_QA @App_Staging @App_Prod @Cleanup @Locale_French @Qase[WEB-2959] @Upd_Qase
Scenario: Check_the_UI_of_the_web_application_fr
	Then 'Nouvelle' tab is displayed on file manager header page
	Then 'Mes fichiers' tab is displayed on file manager header page
	Then 'Fichiers publiés' tab is displayed on file manager header page
	Then 'Nouvelle' tab is active on file manager header page

@MindManager @AccountUI @App_QA @App_Staging @App_Prod @Cleanup @Locale_French @Qase[WEB-2960] @Upd_Qase
Scenario: Check_the_My_Files_tab_UI_fr
	When User clicks 'Mes fichiers' tab on file manager header page
	When User waits '1500' miliseconds
	Then 'Mes fichiers' tab is active on file manager header page
	Then content page is displayed to User
	Then on the page exist 'Ajouter un emplacement' content item with 'Appuyez pour sélectionner un fournisseur de stockage' description
	When User select 'Ajouter un emplacement' content item with 'Appuyez pour sélectionner un fournisseur de stockage' description
	Then following cloud items are displayed to the User:
		| items      |
		| Box        |
		| Dropbox    |
		| Google     |
		| OneDrive   |
		| SharePoint |
	Then 'Retour' button is displayed on content manager page

@MindManager @AccountUI @App_QA @App_Staging @App_Prod @Cleanup @Locale_French @Qase[WEB-2961] @Upd_Qase
Scenario: Check_the_New_tab_UI_fr
	Then 'Nouvelle' tab is active on file manager header page
	Then cloud templates page is displayed to User

@MindManager @AccountUI @App_QA @App_Staging @App_Prod @Cleanup @Locale_French @Qase[WEB-2962] @Upd_Qase
Scenario: Check_the_Published_files_screen_in_users_account_fr
	Then 'Nouvelle' tab is displayed on file manager header page
	Then 'Mes fichiers' tab is displayed on file manager header page
	Then 'Fichiers publiés' tab is displayed on file manager header page
	When User clicks 'Fichiers publiés' tab on file manager header page
	Then 'Fichiers publiés' tab is active on file manager header page