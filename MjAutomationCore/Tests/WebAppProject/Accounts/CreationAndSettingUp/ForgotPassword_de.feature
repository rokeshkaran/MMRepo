@retry(2)
Feature: Forgot_Password_de
Check Forgot Password functionality in German

Background: Pre-condition
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	When User clicks 'Anmelden' button

@MindManager @Account @Forgot_Password @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_German @Qase[WEB-2978] @Upd_Qase
Scenario: Cancel_password_reset
	When User enters 'automation.mj.fp@gmail.com' in the 'email' field
	Then 'Kennwort vergessen?' button is displayed
	When User clicks 'Kennwort vergessen?' button
	Then User sees 'Kennwort vergessen' header on Right Side panel
	Then User sees 'Bitte geben Sie Ihre E-Mail-Adresse ein' text messege on Right Side panel
	When User accepts Optanon cookies
	Then 'Link zum Zurücksetzen versenden' button is displayed
	Then 'Abbrechen' button is displayed
	When User clicks 'Link zum Zurücksetzen versenden' button
	Then Error message with text 'E-Mail-Adresse erforderlich' is displayed to the User
	When User clicks 'Abbrechen' button
	Then User sees 'Willkommen' header on Right Side panel

@MindManager @Account @Forgot_Password @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_German @Qase[WEB-2978] @Upd_Qase
Scenario: Check_placeholders_of_Forgot_Password_data_entry_fields_de
	When User clicks 'Anmelden' button
	Then 'Kennwort vergessen?' button is displayed
	When User clicks 'Kennwort vergessen?' button
	Then 'E-Mail' placeholder is displayed in 'email' enter field

@MindManager @Account @Forgot_Password @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Cleanup @ForgotPasswordEmailCleanup @Do_Not_Run_With_Forgot_Password @Locale_German @Qase[WEB-2977] @Upd_Qase @JIRA[MMCV-10102]
Scenario: Check_Forgot_Password_Functionality_de
	When User enters '<emailAddress>' in the 'email' field
	Then 'Kennwort vergessen?' button is displayed
	When User clicks 'Kennwort vergessen?' button
	Then User sees 'Kennwort vergessen' header on Right Side panel
	Then User sees 'Bitte geben Sie Ihre E-Mail-Adresse ein' text messege on Right Side panel
	When User accepts Optanon cookies
	Then 'Link zum Zurücksetzen versenden' button is displayed
	Then 'Abbrechen' button is displayed
	When User enters '<emailAddress>' in the 'email' field
	When User clicks 'Link zum Zurücksetzen versenden' button
	Then User sees 'Erfolg' page header
	Then User sees 'Falls der Benutzer <emailAddress> in unserem System existiert, erhalten Sie bald eine E-Mail mit einem Link, um Ihr Kennwort wiederherzustellen.' text messege on Right Side panel
	Then 'Erledigt' button is displayed
	When User clicks 'Erledigt' button
	Then Right Side panel is displayed
	Then User sees 'Willkommen' header on Right Side panel
	When User navigates the password reset link in the newly received email with 'MindManager: Kennwort zurücksetzen' email title header
	Then User sees 'Kennwort zurücksetzen' header on Right Side panel
	Then User sees 'Bitte geben Sie ein neues Kennwort ein' text messege on Right Side panel
	When User enters 'anrpw!SRND' in the 'password' field
	When User enters 'anrpw!SRND' in the 'confirm_password' field
	When User clicks 'Neues Kennwort festlegen' button
	Then Right Side panel is displayed
	Then User sees 'Anmelden' header on Right Side panel
	Then User sees 'Bitte geben Sie unten Ihre Kontaktinformationen ein.' text messege on Right Side panel
	When User enters '<emailAddress>' in the 'email' field
	When User enters 'anrpw!SRND' in the 'password' field
	When User clicks 'Anmelden' button
	Then 'Neu' tab is displayed on file manager header page
	Then 'Meine Dateien' tab is displayed on file manager header page
	Then 'Veröffentlichte Dateien' tab is displayed on file manager header page

Examples:
	| emailAddress               |
	| automation.mj.fp@gmail.com |