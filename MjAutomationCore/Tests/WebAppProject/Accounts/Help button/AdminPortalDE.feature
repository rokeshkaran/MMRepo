@retry(2)
Feature: AdminPortalDE
To verify the 'customer support' link in the 'MindManager Account help' screen in German

Background: Pre-condition
	Given User is on Customer Admin Portal website
	When User accepts Optanon cookies

@MindManager @Accounts @HelpButton @AdminPortal @App_QA @App_Staging @Qase[WEB-2995] @Locale_German @JIRA[MMCV-10105,MMCV-10262,MMCV-10377] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Admin_Portal_Welcome_Screen_DE
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

@MindManager @Accounts @HelpButton @AdminPortal @App_QA @App_Staging @Qase[WEB-2994] @Locale_German @JIRA[MMCV-10105,MMCV-10262,MMCV-10377] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Sign_In_Screen_DE
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

@MindManager @Accounts @HelpButton @AdminPortal @App_QA @App_Staging @Qase[WEB-2993] @Locale_German @JIRA[MMCV-10105,MMCV-10262,MMCV-10377] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Admin_Create_Account_Screen_DE
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