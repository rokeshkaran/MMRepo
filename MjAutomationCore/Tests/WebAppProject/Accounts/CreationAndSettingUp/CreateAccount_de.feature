@retry(2)
Feature: Create_Account_de
	Check Creating Account functionality error messages in German
	Check Error messages on Create Account page in German

Background: Pre-condition
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	And 'Konto erstellen' button is displayed
	When User clicks 'Konto erstellen' button

@MindManager @Account @Create_Account @App_QA @App_Staging @App_Prod @Cleanup @CleanupOutlookEmail @Locale_German @Qase[WEB-2963] @Upd_Qase
Scenario Outline: Check_Account_Creation_app_de
	Then User sees 'Erstellen Sie Ihr kostenloses Konto' header on Right Side panel
	And User sees 'Registrieren Sie sich noch heute und beginnen Sie, Ihre erste Map in wenigen Minuten zu erstellen.' text messege on Right Side panel
	When User fills account creation fields for new UI
		| Email          | FullName       | Password   |
		| <emailAddress> | Automation_RND | <password> |
	And User clicks 'Konto erstellen' button
	And User waits for data loading
	Then User sees 'Bestätigen Sie zum Fortfahren Ihr Konto' header on Right Side panel
	When User accepts Optanon cookies
	Then User sees 'Es wurde eine E-Mail von noreply@mindmanager.com mit einem Link zur Verifizierung Ihrer E-Mail-Adresse an <emailAddress>(E-Mail-Adresse wechseln) geschickt. Bitte befolgen Sie die Anweisungen in der E-Mail, kommen Sie dann hier zurück und klicken Sie auf "Weiter", um die Einrichtung Ihres Kontos fertigzustellen.' text messege on Right Side panel
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Bitte verifizieren Sie Ihr MindManager-Konto' email title header and 'Etwas anderes' use case button
	And User switches to '0' tab
	And User clicks 'Etwas anderes' button for use case options on Right Side panel
	And User waits for data loading
	Then User sees 'Sie haben keine Lizenz, um dieses Produkt zu verwenden.' header on Right Side panel
	And User sees 'Gute Neuigkeiten! Sie sind berechtigt, von einer kostenlosen Testversion zu profitieren.' subheader on Right Side panel
	When User close Admin System Message for User '<emailAddress>' and Password '<password>' via API
	And User clicks 'Kostenlose Testversion starten' button
	And User refresh page
	Then 'Neu' tab is active on file manager header page
	When User clicks arrow down on 'fileManagerHeader' user panel
	And User clicks 'Kontodetails' item in 'user-panel' dropdown menu
	Then header 'Kontodetails' is displayed on page
	And User Name 'Automation_RND' is displayed in 'KONTONAME' subsection in 'Allgemein' section on Account Details page

Examples:
	| emailAddress                               | password  |
	| auto.test+SRND@mindmanager.onmicrosoft.com | TYf78!RND |

@MindManager @Account @Create_Account @App_QA @App_Staging @App_Prod @Cleanup @Locale_German @Qase[WEB-2963] @Upd_Qase
Scenario: Check_placeholders_of_sign_up_data_entry_fields_de
	Then 'E-Mail' placeholder is displayed in 'email' enter field
	And 'Ihr Name' placeholder is displayed in 'full_name' enter field
	And 'Kennwort' placeholder is displayed in 'password' enter field

@MindManager @Account @Create_Account @App_QA @App_Staging @App_Prod @Cleanup @CleanupOutlookEmail @Locale_German @Qase[WEB-2969] @Upd_Qase
Scenario Outline: Check_Account_Creation_with_full_name_de
	Then User sees 'Erstellen Sie Ihr kostenloses Konto' header on Right Side panel
	And User sees 'Registrieren Sie sich noch heute und beginnen Sie, Ihre erste Map in wenigen Minuten zu erstellen.' text messege on Right Side panel
	When User fills account creation fields for new UI
		| Email          | FullName            | Password   |
		| <emailAddress> | Automation_RND Test | <password> |
	And User clicks 'Konto erstellen' button
	And User waits for data loading
	Then User sees 'Bestätigen Sie zum Fortfahren Ihr Konto' header on Right Side panel
	When User accepts Optanon cookies
	Then User sees 'Es wurde eine E-Mail von noreply@mindmanager.com mit einem Link zur Verifizierung Ihrer E-Mail-Adresse an <emailAddress>(E-Mail-Adresse wechseln) geschickt. Bitte befolgen Sie die Anweisungen in der E-Mail, kommen Sie dann hier zurück und klicken Sie auf "Weiter", um die Einrichtung Ihres Kontos fertigzustellen.' text messege on Right Side panel
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Bitte verifizieren Sie Ihr MindManager-Konto' email title header and 'Etwas anderes' use case button
	And User switches to '0' tab
	And User clicks 'Etwas anderes' button for use case options on Right Side panel
	And User waits for data loading
	Then User sees 'Sie haben keine Lizenz, um dieses Produkt zu verwenden.' header on Right Side panel
	And User sees 'Gute Neuigkeiten! Sie sind berechtigt, von einer kostenlosen Testversion zu profitieren.' subheader on Right Side panel
	When User close Admin System Message for User '<emailAddress>' and Password '<password>' via API
	And User clicks 'Kostenlose Testversion starten' button
	And User refresh page
	Then 'Neu' tab is active on file manager header page
	When User clicks arrow down on 'fileManagerHeader' user panel
	And User clicks 'Kontodetails' item in 'user-panel' dropdown menu
	Then header 'Kontodetails' is displayed on page
	And User Name 'Automation_RND Test' is displayed in 'KONTONAME' subsection in 'Allgemein' section on Account Details page

Examples:
	| emailAddress                               | password  |
	| auto.test+SRND@mindmanager.onmicrosoft.com | TYf78!RND |

@MindManager @Account @Create_Account @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_German @Qase[WEB-2964] @Upd_Qase
Scenario: Create_account_without_Your_name_de
	Then User sees 'Erstellen Sie Ihr kostenloses Konto' header on Right Side panel
	And User sees 'Registrieren Sie sich noch heute und beginnen Sie, Ihre erste Map in wenigen Minuten zu erstellen.' text messege on Right Side panel
	When User enters 'MindManagerSRND@mailinator.com' in the 'email' field
	And User enters '' in the 'full_name' field
	And User enters 'TYf78Klo12!' in the 'password' field
	And User clicks 'Konto erstellen' button
	Then Error message with text 'Ihr Name ist erforderlich' is displayed to the User

@MindManager @Account @Create_Account @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_German @Qase[WEB-2965] @Upd_Qase
Scenario: Create_account_without_entering_password_de
	When User enters 'MindManager@mailinator.com' in the 'email' field
	And User enters 'Automationtest' in the 'full_name' field
	And User clicks 'Konto erstellen' button
	Then Error message with text 'Kennwort ist erforderlich.' is displayed to the User

@MindManager @Account @Create_Account @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_German @Qase[WEB-2966] @Upd_Qase
Scenario: Create_account_without_entering_email_de
	When User enters 'Automationtest' in the 'full_name' field
	And User enters 'TYf78Klo12' in the 'password' field
	And User clicks 'Konto erstellen' button
	Then Error message with text 'E-Mail-Adresse erforderlich' is displayed to the User

@MindManager @Account @Create_Account @QA @App_QA @Staging @App_Staging @App_Prod @Prod @Locale_German @Qase[WEB-2967] @Upd_Qase
Scenario: Check_Create_an_existing_account_de
	When User enters 'automationtestmj@gmail.com' in the 'email' field
	And User enters 'Automationtest' in the 'full_name' field
	And User enters 'TYf78Klo12!' in the 'password' field
	And User clicks 'Konto erstellen' button
	Then User sees 'Anmelden' header on Right Side panel
	And User sees 'Bitte geben Sie unten Ihre Kontaktinformationen ein.' text messege on Right Side panel

@MindManager @Account @Create_Account @App_Prod @Cleanup @CleanupOutlookEmail @Locale_German @Qase[WEB-2968] @Upd_Qase
Scenario Outline: Check_changing_info_while_creating_an_account_app_Prod_de
	When User fills account creation fields for new UI
		| Email          | FullName          | Password |
		| <invalidEmail> | TESTAutomationRND | G5kw!RND |
	And User clicks 'Konto erstellen' button
	And User waits for data loading
	Then User sees 'Bestätigen Sie zum Fortfahren Ihr Konto' header on Right Side panel
	And User sees 'Es wurde eine E-Mail von noreply@mindmanager.com mit einem Link zur Verifizierung Ihrer E-Mail-Adresse an <invalidEmail>(E-Mail-Adresse wechseln) geschickt. Bitte befolgen Sie die Anweisungen in der E-Mail, kommen Sie dann hier zurück und klicken Sie auf "Weiter", um die Einrichtung Ihres Kontos fertigzustellen.' text messege on Right Side panel
	When User clicks Change email link
	And User waits for data loading
	Then '<invalidEmail>' value is displayed to the 'email' field
	And 'TESTAutomationRND' value is displayed to the 'full_name' field
	And '' value is displayed to the 'password' field
	When User fills account creation fields for new UI
		| Email        | FullName      | Password   |
		| <validEmail> | AutomationRND | <password> |
	And User clicks 'Konto erstellen' button
	And User waits for data loading
	And User accepts Optanon cookies
	Then User sees 'Bestätigen Sie zum Fortfahren Ihr Konto' header on Right Side panel
	And User sees 'Es wurde eine E-Mail von noreply@mindmanager.com mit einem Link zur Verifizierung Ihrer E-Mail-Adresse an <validEmail>(E-Mail-Adresse wechseln) geschickt. Bitte befolgen Sie die Anweisungen in der E-Mail, kommen Sie dann hier zurück und klicken Sie auf "Weiter", um die Einrichtung Ihres Kontos fertigzustellen.' text messege on Right Side panel
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Bitte verifizieren Sie Ihr MindManager-Konto' email title header and 'Etwas anderes' use case button
	And User switches to '0' tab
	And User clicks 'Etwas anderes' button for use case options on Right Side panel
	And User waits for data loading
	Then User sees 'Sie haben keine Lizenz, um dieses Produkt zu verwenden.' header on Right Side panel
	And User sees 'Gute Neuigkeiten! Sie sind berechtigt, von einer kostenlosen Testversion zu profitieren.' subheader on Right Side panel
	When User close Admin System Message for User '<validEmail>' and Password '<password>' via API
	And User clicks 'Kostenlose Testversion starten' button
	And User refresh page
	Then 'Neu' tab is active on file manager header page
	When User clicks arrow down on 'fileManagerHeader' user panel
	And User clicks 'Abmelden' item in 'user-panel' dropdown menu
	Then Right Side panel is displayed
	When User clicks 'Anmelden' button
	And User enters '<invalidEmail>' in the 'email' field
	And User enters 'G5kwRND' in the 'password' field
	And User clicks 'Anmelden' button
	Then Error message with text 'Benutzername oder Kennwort falsch' is displayed to the User

Examples:
	| invalidEmail                 | validEmail                                 | password   |
	| automation_SRND@hehe.ppp.com | auto.test+SRND@mindmanager.onmicrosoft.com | M2p8rwRND! |

@MindManager @Account @Create_Account @App_QA @App_Staging @Cleanup @CleanupOutlookEmail @Locale_German @Qase[WEB-2968] @JIRA[MMCV-10518] @Upd_Qase
Scenario Outline: Check_changing_info_while_creating_an_account_de
	When User fills account creation fields for new UI
		| Email          | FullName          | Password |
		| <invalidEmail> | TESTAutomationRND | G5kwRND! |
	And User clicks 'Konto erstellen' button
	Then User sees 'Bestätigen Sie zum Fortfahren Ihr Konto' header on Right Side panel
	And User sees 'Es wurde eine E-Mail von noreply@mindmanager.com mit einem Link zur Verifizierung Ihrer E-Mail-Adresse an <invalidEmail>(E-Mail-Adresse wechseln) geschickt. Bitte befolgen Sie die Anweisungen in der E-Mail, kommen Sie dann hier zurück und klicken Sie auf "Weiter", um die Einrichtung Ihres Kontos fertigzustellen.' text messege on Right Side panel
	When User clicks Change email link
	Then '<invalidEmail>' value is displayed to the 'email' field
	And 'TESTAutomationRND' value is displayed to the 'full_name' field
	And '' value is displayed to the 'password' field
	When User fills account creation fields for new UI
		| Email        | FullName      | Password   |
		| <validEmail> | AutomationRND | <password> |
	And User clicks 'Konto erstellen' button
	Then User sees 'Bestätigen Sie zum Fortfahren Ihr Konto' header on Right Side panel
	When User accepts Optanon cookies
	Then User sees 'Es wurde eine E-Mail von noreply@mindmanager.com mit einem Link zur Verifizierung Ihrer E-Mail-Adresse an <validEmail>(E-Mail-Adresse wechseln) geschickt. Bitte befolgen Sie die Anweisungen in der E-Mail, kommen Sie dann hier zurück und klicken Sie auf "Weiter", um die Einrichtung Ihres Kontos fertigzustellen.' text messege on Right Side panel
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Bitte verifizieren Sie Ihr MindManager-Konto' email title header and 'Etwas anderes' use case button
	And User switches to '0' tab
	And User clicks 'Etwas anderes' button for use case options on Right Side panel
	And User waits '3000' miliseconds
	Then User sees 'Sie haben keine Lizenz, um dieses Produkt zu verwenden.' header on Right Side panel
	And User sees 'Gute Neuigkeiten! Sie sind berechtigt, von einer kostenlosen Testversion zu profitieren.' subheader on Right Side panel
	When User close Admin System Message for User '<validEmail>' and Password '<password>' via API
	And User clicks 'Kostenlose Testversion starten' button
	And User refresh page
	Then 'Neu' tab is active on file manager header page
	When User clicks arrow down on 'fileManagerHeader' user panel
	And User clicks 'Abmelden' item in 'user-panel' dropdown menu
	Then Right Side panel is displayed
	When User clicks 'Anmelden' button
	And User enters '<invalidEmail>' in the 'email' field
	And User enters 'G5kwRND!' in the 'password' field
	And User clicks 'Anmelden' button
	Then Error message with text 'Benutzername oder Kennwort falsch' is displayed to the User
	#Support Portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	And User clicks 'Anmelden' button
	And User provides the Password from company account and clicks on Sign In button
	And User selects 'Benutzersuche' search option on Action panel
	And User enters '<invalidEmail>' value in the 'search-input' field on Action panel
	Then 'license-support-tenant-search-result' table is not displayed to User
	When User enters '<validEmail>' value in the 'search-input' field on Action panel
	Then '<validEmail>' value is displayed in the 'Nutzer' column of 'license-support-user-search-result' table

Examples:
	| invalidEmail                 | validEmail                                 | password   |
	| automation_SRND@hehe.ppp.com | auto.test+SRND@mindmanager.onmicrosoft.com | M2p8rwRND! |