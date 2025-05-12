@retry(2)
Feature: Login_Logout_de
Check Login-Logout functionality in German

Background: Pre-condition
	Given User is on the Mindmanager website
	Then Right Side panel is displayed

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_German @Qase[WEB-2981] @Upd_Qase
Scenario: Check_that_valid_user_is_able_to_sign_in_into_their_account_on_the_web_de
	Then User sees 'Willkommen' header on Right Side panel
	Then 'Kostenlose Testversion starten' button is displayed
	Then 'Anmelden' button is displayed
	Then 'Konto erstellen' button is displayed
	Then 'Hilfe' button is displayed
	When User clicks 'Anmelden' button
	Then User sees 'Anmelden' header on Right Side panel
	Then User sees 'Bitte geben Sie unten Ihre Kontaktinformationen ein.' text messege on Right Side panel
	When User provides the Login and Password and clicks on the Sign In button
	Then 'Neu' tab is displayed on file manager header page
	Then 'Meine Dateien' tab is displayed on file manager header page
	Then 'Veröffentlichte Dateien' tab is displayed on file manager header page

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_German @Qase[WEB-2981] @Upd_Qase
Scenario: Check_placeholders_of_sign_in_data_entry_fields_de
	When User clicks 'Anmelden' button
	Then 'E-Mail' placeholder is displayed in 'email' enter field
	When User clicks 'Anmelden' button
	Then 'Kennwort' placeholder is displayed in 'password' enter field

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_German @Qase[WEB-2986] @Upd_Qase
Scenario: Check_it_is_possible_to_sign_out_from_the_Mindjet_account_de
	When User clicks 'Anmelden' button
	When User provides the Login and Password and clicks on the Sign In button
	Then 'Neu' tab is displayed on file manager header page
	Then 'Meine Dateien' tab is displayed on file manager header page
	Then 'Veröffentlichte Dateien' tab is displayed on file manager header page
	When User clicks arrow down on 'fileManagerHeader' user panel
	Then following items is displayed in 'user-panel' dropdown menu
		| items           |
		| Abmelden        |
		| Kontodetails |
	When User clicks 'Abmelden' item in 'user-panel' dropdown menu
	Then Right Side panel is displayed
	Then User sees 'Willkommen' header on Right Side panel
	Then 'Konto erstellen' button is displayed
	Then 'Hilfe' button is displayed

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_German @Qase[WEB-2984] @Upd_Qase
Scenario: Sign_In_with_invalid_password_de
	When User clicks 'Anmelden' button
	When User enters 'automation.mj.fp@gmail.com' in the 'email' field
	When User enters '12345' in the 'password' field
	When User clicks 'Anmelden' button
	Then Error message with text 'Benutzername oder Kennwort falsch' is displayed to the User

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_German @Qase[WEB-2985] @Upd_Qase
Scenario: Sign_In_with_invalid_email_de
	When User clicks 'Anmelden' button
	When User enters 'automation.mj.fp@test.com' in the 'email' field
	When User enters 'TestPs1!' in the 'password' field
	When User clicks 'Anmelden' button
	Then Error message with text 'Benutzername oder Kennwort falsch' is displayed to the User

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_German @Qase[WEB-2982] @Upd_Qase
Scenario: Check_Sign_In_without_entering_email_de
	When User clicks 'Anmelden' button
	When User enters '' in the 'email' field
	When User clicks 'Anmelden' button
	When User enters 'hUsdcsd1l92' in the 'password' field
	When User clicks 'Anmelden' button
	Then Error message with text 'E-Mail-Adresse erforderlich' is displayed to the User

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_German @Qase[WEB-2984] @Upd_Qase
Scenario: Check_Sign_In_without_entering_password_de
	When User clicks 'Anmelden' button
	When User enters 'test_email@gmail.com' in the 'email' field
	When User enters '' in the 'password' field
	When User clicks 'Anmelden' button
	Then Error message with text 'Kennwort ist erforderlich.' is displayed to the User