@retry(2)
Feature: WebAppDE
To verify the 'customer support' link in the 'MindManager Account help' screen in German

@MindManager @Accounts @HelpButton @WebApp @App_QA @App_Staging @App_Prod @Qase[WEB-3003] @Locale_German @JIRA[MMCV-10105,MMCV-10262,MMCV-10377] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Welcome_Screen_DE
	Given User is on the Mindmanager website
	When User accepts Optanon cookies
	When User clicks 'Hilfe' button
	Then User sees 'kontaktieren Sie den Support' hyperlink on Right Side panel
	Then Following text is displayed under each header:
		| Header                                                     | ExpectedText                                                                                                                                                                                                                                                                                                                                                                                                      |
		| Hilfe zum MindManager-Konto                                | Ihr MindManager-Konto schaltet das volle Potenzial von MindManager frei. Die Einrichtung des Kontos ist kostenfrei und im Handumdrehen erledigt.                                                                                                                                                                                                                                                                  |
		| Warum brauche ich ein MindManager-Konto?                   | Das MindManager-Konto ist Ihre eindeutige Identifizierung für MindManager.                                                                                                                                                                                                                                                                                                                                        |
		| Wofür kann ich mein MindManager-Konto einsetzen?           | Ihr MindManager-Konto gibt Ihnen Zugriff auf Ihre unbefristete MindManager-Lizenz, Ihr Abonnement und Ihre Support-Services. Es ist zudem Ihre eindeutige Identität beim Einsatz von besonderen Funktionen, wie z. B. MindManager Snap, Publishing, Co-Editing oder für die MindManager-App für Microsoft Teams.                                                                                                  |
		| Kann ich meine bestehenden Mindjet-Anmeldedaten verwenden? | In den meisten Fällen nicht. Anmeldedaten bestehender Mindjet Connect-, Mindjet Files-, Mindjet ID- oder Maps for That-Konten funktionieren nicht - Sie müssen dann ein neues MindManager-Konto anlegen.Falls Sie bereits ein MindManager-Konto für MindManager Snap, Publishing oder Co-Editing erstellt haben, dann können Sie dieses Konto für die Anmeldung nutzen.                                           |
		| Ich habe meine Verifizierungsmail nicht erhalten!          | In einigen Fällen blockieren Spamfilter unsere E-Mails. Setzen Sie noreply@mindmanager.com auf die weiße Liste. Sie können auch auf die Schaltfläche "E-Mail erneut versenden" klicken. Warten Sie dann einige Minuten, denn manchmal dauert es länger, bis E-Mails ankommen. Wenn Sie Ihre Verifizierungsmail nach Versuchen der oben genannten Methoden weiterhin nicht erhalten, kontaktieren Sie den Support. |
	When User click 'kontaktieren Sie den Support' hyperlink on Right Side panel
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/de/support/'
	Then User sees 'Willkommen beim MindManager Support' page header

@MindManager @Accounts @HelpButton @WebApp @App_QA @App_Staging @App_Prod @Qase[WEB-2999] @Locale_German @JIRA[MMCV-10105,MMCV-1026,MMCV-10377] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Sign_In_Screen_DE
	Given User is on the Mindmanager website
	When User accepts Optanon cookies
	When User clicks 'Anmelden' button
	When User clicks 'Hilfe' button
	Then User sees 'kontaktieren Sie den Support' hyperlink on Right Side panel
	Then Following text is displayed under each header:
		| Header                                                     | ExpectedText                                                                                                                                                                                                                                                                                                                                                                                                      |
		| Hilfe zum MindManager-Konto                                | Ihr MindManager-Konto schaltet das volle Potenzial von MindManager frei. Die Einrichtung des Kontos ist kostenfrei und im Handumdrehen erledigt.                                                                                                                                                                                                                                                                  |
		| Warum brauche ich ein MindManager-Konto?                   | Das MindManager-Konto ist Ihre eindeutige Identifizierung für MindManager.                                                                                                                                                                                                                                                                                                                                        |
		| Wofür kann ich mein MindManager-Konto einsetzen?           | Ihr MindManager-Konto gibt Ihnen Zugriff auf Ihre unbefristete MindManager-Lizenz, Ihr Abonnement und Ihre Support-Services. Es ist zudem Ihre eindeutige Identität beim Einsatz von besonderen Funktionen, wie z. B. MindManager Snap, Publishing, Co-Editing oder für die MindManager-App für Microsoft Teams.                                                                                                  |
		| Kann ich meine bestehenden Mindjet-Anmeldedaten verwenden? | In den meisten Fällen nicht. Anmeldedaten bestehender Mindjet Connect-, Mindjet Files-, Mindjet ID- oder Maps for That-Konten funktionieren nicht - Sie müssen dann ein neues MindManager-Konto anlegen.Falls Sie bereits ein MindManager-Konto für MindManager Snap, Publishing oder Co-Editing erstellt haben, dann können Sie dieses Konto für die Anmeldung nutzen.                                           |
		| Ich habe meine Verifizierungsmail nicht erhalten!          | In einigen Fällen blockieren Spamfilter unsere E-Mails. Setzen Sie noreply@mindmanager.com auf die weiße Liste. Sie können auch auf die Schaltfläche "E-Mail erneut versenden" klicken. Warten Sie dann einige Minuten, denn manchmal dauert es länger, bis E-Mails ankommen. Wenn Sie Ihre Verifizierungsmail nach Versuchen der oben genannten Methoden weiterhin nicht erhalten, kontaktieren Sie den Support. |
	When User click 'kontaktieren Sie den Support' hyperlink on Right Side panel
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/de/support/'
	Then User sees 'Willkommen beim MindManager Support' page header

@MindManager @Accounts @HelpButton @WebApp @App_QA @App_Staging @App_Prod @Qase[WEB-3000] @Locale_German @JIRA[MMCV-10105,MMCV-10262,MMCV-10377] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Create_Account_Screen_DE
	Given User is on the Mindmanager website
	When User accepts Optanon cookies
	When User clicks 'Konto erstellen' button
	When User clicks 'Hilfe' button
	Then User sees 'kontaktieren Sie den Support' hyperlink on Right Side panel
	Then Following text is displayed under each header:
		| Header                                                     | ExpectedText                                                                                                                                                                                                                                                                                                                                                                                                      |
		| Hilfe zum MindManager-Konto                                | Ihr MindManager-Konto schaltet das volle Potenzial von MindManager frei. Die Einrichtung des Kontos ist kostenfrei und im Handumdrehen erledigt.                                                                                                                                                                                                                                                                  |
		| Warum brauche ich ein MindManager-Konto?                   | Das MindManager-Konto ist Ihre eindeutige Identifizierung für MindManager.                                                                                                                                                                                                                                                                                                                                        |
		| Wofür kann ich mein MindManager-Konto einsetzen?           | Ihr MindManager-Konto gibt Ihnen Zugriff auf Ihre unbefristete MindManager-Lizenz, Ihr Abonnement und Ihre Support-Services. Es ist zudem Ihre eindeutige Identität beim Einsatz von besonderen Funktionen, wie z. B. MindManager Snap, Publishing, Co-Editing oder für die MindManager-App für Microsoft Teams.                                                                                                  |
		| Kann ich meine bestehenden Mindjet-Anmeldedaten verwenden? | In den meisten Fällen nicht. Anmeldedaten bestehender Mindjet Connect-, Mindjet Files-, Mindjet ID- oder Maps for That-Konten funktionieren nicht - Sie müssen dann ein neues MindManager-Konto anlegen.Falls Sie bereits ein MindManager-Konto für MindManager Snap, Publishing oder Co-Editing erstellt haben, dann können Sie dieses Konto für die Anmeldung nutzen.                                           |
		| Ich habe meine Verifizierungsmail nicht erhalten!          | In einigen Fällen blockieren Spamfilter unsere E-Mails. Setzen Sie noreply@mindmanager.com auf die weiße Liste. Sie können auch auf die Schaltfläche "E-Mail erneut versenden" klicken. Warten Sie dann einige Minuten, denn manchmal dauert es länger, bis E-Mails ankommen. Wenn Sie Ihre Verifizierungsmail nach Versuchen der oben genannten Methoden weiterhin nicht erhalten, kontaktieren Sie den Support. |
	When User click 'kontaktieren Sie den Support' hyperlink on Right Side panel
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/de/support/'
	Then User sees 'Willkommen beim MindManager Support' page header

@MindManager @Accounts @HelpButton @WebApp @App_QA @App_Staging @App_Prod @Qase[WEB-3001] @Locale_German @JIRA[MMCV-10105,MMCV-10262,MMCV-10377] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Start_Free_Trial_Screen_DE
	Given User is on the Mindmanager website
	When User accepts Optanon cookies
	When User clicks 'Kostenlose Testversion starten' button
	When User clicks 'Hilfe' button
	Then User sees 'kontaktieren Sie den Support' hyperlink on Right Side panel
	Then Following text is displayed under each header:
		| Header                                                     | ExpectedText                                                                                                                                                                                                                                                                                                                                                                                                      |
		| Hilfe zum MindManager-Konto                                | Ihr MindManager-Konto schaltet das volle Potenzial von MindManager frei. Die Einrichtung des Kontos ist kostenfrei und im Handumdrehen erledigt.                                                                                                                                                                                                                                                                  |
		| Warum brauche ich ein MindManager-Konto?                   | Das MindManager-Konto ist Ihre eindeutige Identifizierung für MindManager.                                                                                                                                                                                                                                                                                                                                        |
		| Wofür kann ich mein MindManager-Konto einsetzen?           | Ihr MindManager-Konto gibt Ihnen Zugriff auf Ihre unbefristete MindManager-Lizenz, Ihr Abonnement und Ihre Support-Services. Es ist zudem Ihre eindeutige Identität beim Einsatz von besonderen Funktionen, wie z. B. MindManager Snap, Publishing, Co-Editing oder für die MindManager-App für Microsoft Teams.                                                                                                  |
		| Kann ich meine bestehenden Mindjet-Anmeldedaten verwenden? | In den meisten Fällen nicht. Anmeldedaten bestehender Mindjet Connect-, Mindjet Files-, Mindjet ID- oder Maps for That-Konten funktionieren nicht - Sie müssen dann ein neues MindManager-Konto anlegen.Falls Sie bereits ein MindManager-Konto für MindManager Snap, Publishing oder Co-Editing erstellt haben, dann können Sie dieses Konto für die Anmeldung nutzen.                                           |
		| Ich habe meine Verifizierungsmail nicht erhalten!          | In einigen Fällen blockieren Spamfilter unsere E-Mails. Setzen Sie noreply@mindmanager.com auf die weiße Liste. Sie können auch auf die Schaltfläche "E-Mail erneut versenden" klicken. Warten Sie dann einige Minuten, denn manchmal dauert es länger, bis E-Mails ankommen. Wenn Sie Ihre Verifizierungsmail nach Versuchen der oben genannten Methoden weiterhin nicht erhalten, kontaktieren Sie den Support. |
	When User click 'kontaktieren Sie den Support' hyperlink on Right Side panel
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/de/support/'
	Then User sees 'Willkommen beim MindManager Support' page header

@MindManager @Accounts @HelpButton @WebApp @App_QA @App_Staging @Qase[WEB-3002] @Locale_German @JIRA[MMCV-10105,MMCV-10262,MMCV-10377] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_the_trial_expired_screen_DE
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 3     | MMTRIAL   | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User accepts Optanon cookies
	When User find 'MindManager Trial' value in 'Produkt' column of 'admin-home-purchases' table and clicks 'Verwalten' button
	When User find 'MindManager Trial' value in 'Version' column of 'admin-license-purchases' table and clicks 'Benutzer hinzufügen/verwalten' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Absenden' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName                | Value             |
		| Version                   | MindManager Trial |
		| Läuft Ab                  | D(1)              |
		| Sitze Verwendet/Insgesamt | 1/3               |
	When User updates 'MMTRIAL' purchase data for '<customerName>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Ihre MindManager Testversion ist abgelaufen.' header on Right Side panel
	When User clicks 'Hilfe' button
	Then User sees 'Hilfe zur MindManager Lizenzierung' header on Right Side panel
	When User clicks 'kontaktieren Sie bitte den Support' hyperlink in '<text>' text on Right Side panel
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/de/support/'
	Then User sees 'Willkommen beim MindManager Support' page header

Examples:
	| customerName        | emailAddress                                 | password   | text                                                                                                                                                                                                                                                                                                 |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | In den meisten Fällen nicht. Bei mildernden Umständen kontaktieren Sie bitte den Support.                                                                                                                                                                                                            |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Bitte erneuern Sie Ihr Abonnement. Gibt es ein Problem mit Ihrem Abonnement, kontaktieren Sie bitte den Support.                                                                                                                                                                                     |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Sie können Ihren Lizenzschlüssel auf Ihrer Kontoseite eingeben. Funktioniert Ihr Lizenzschlüssel nicht, kontaktieren Sie bitte den Support.                                                                                                                                                          |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Ihr Lizenzschlüssel wird Ihnen per E-Mail zugeschickt, sobald er fertig ist. Haben Sie Probleme dabei, Ihren Lizenzschlüssel zu erhalten, kontaktieren Sie bitte den Support.                                                                                                                        |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Ihr Unternehmen hat bereits alle verfügbaren Lizenzen verwendet. Bitte kontaktieren Sie Ihren MindManager-Softwareadministrator, um zusätzliche Lizenzen hinzuzufügen und versuchen Sie es dann erneut. Wenn Sie denken, dass Ihr Lizenzschlüssel gefährdet ist, kontaktieren Sie bitte den Support. |

@MindManager @Accounts @HelpButton @WebApp @App_QA @App_Staging @Qase[WEB-3002] @Locale_German @JIRA[MMCV-10105,MMCV-10262,MMCV-10377] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_the_trial_expired_screen_DE_last_hyperlink
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 3     | MMTRIAL   | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Trial' value in 'Produkt' column of 'admin-home-purchases' table and clicks 'Verwalten' button
	When User find 'MindManager Trial' value in 'Version' column of 'admin-license-purchases' table and clicks 'Benutzer hinzufügen/verwalten' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Absenden' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName                | Value             |
		| Version                   | MindManager Trial |
		| Läuft Ab                  | D(1)              |
		| Sitze Verwendet/Insgesamt | 1/3               |
	When User updates 'MMTRIAL' purchase data for '<customerName>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Ihre MindManager Testversion ist abgelaufen.' header on Right Side panel
	When User clicks 'Hilfe' button
	Then User sees 'Hilfe zur MindManager Lizenzierung' header on Right Side panel
	When User clicks 'kontaktieren Sie den Support' hyperlink in '<text>' text on Right Side panel
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/de/support/'
	Then User sees 'Willkommen beim MindManager Support' page header

Examples:
	| customerName        | emailAddress                                 | password   | text                                |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Bitte kontaktieren Sie den Support. |