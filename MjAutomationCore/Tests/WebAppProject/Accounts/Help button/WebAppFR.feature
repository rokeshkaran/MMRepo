@retry(2)
Feature: WebAppFR
To verify the 'customer support' link in the 'MindManager Account help' screen in French

@MindManager @Accounts @HelpButton @WebApp @App_QA @App_Staging @App_Prod @Qase[WEB-3008] @Locale_French @JIRA[MMCV-10105,MMCV-10262,MMCV-10377] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Welcome_Screen_FR
	Given User is on the Mindmanager website
	When User accepts Optanon cookies
	When User clicks 'Aide' button
	Then User sees 'contacter l’assistance' hyperlink on Right Side panel
	Then Following text is displayed under each header:
		| Header                                          | ExpectedText                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
		| Aide relative aux comptes MindManager           | Votre compte MindManager donne accès au plein potentiel de MindManager. Cela ne prend qu’une minute pour créer un compte, et c’est gratuit !                                                                                                                                                                                                                                                                                                                                                    |
		| À quoi sert un compte MindManager ?             | Le compte MindManager est votre identification unique pour MindManager.                                                                                                                                                                                                                                                                                                                                                                                                                         |
		| À quoi un compte MindManager donne-t-il accès ? | Votre compte MindManager donne accès à la licence perpétuelle, à l'abonnement et/ou aux services d'assistance. C'est également votre identité unique lors de l'utilisation de fonctions spéciales comme MindManager Snap, Publishing, Coédition et l'application MindManager pour Microsoft Teams.                                                                                                                                                                                              |
		| Puis-je utiliser mes identifiants Mindjet ?     | Dans la plupart des cas, non. Si vous disposez d’un compte Mindjet Connect ou Mindjet Files, d’un Mindjet ID ou de maps pour ce compte, vos anciens identifiants de connexion ne fonctionneront pas et vous devrez créer un nouveau compte MindManager.Si vous avez déjà créé un compte MindManager pour utiliser MindManager Snap, la publication ou la coédition, vous pouvez effectivement utiliser ce compte pour vous connecter.                                                           |
		| Je n’ai pas reçu mon e-mail de vérification !   | Dans certains cas, les filtres antispam peuvent bloquer nos e-mails. Essayez d'ajouter l’adresse noreply@mindmanager.com à votre liste d’expéditeurs approuvés. Vous pouvez également essayer d'appuyer sur le bouton « Renvoyer l'e-mail ». Dans ce cas, patientez quelques minutes, car la réception d'e-mails peut parfois prendre un certain temps. Si vous n'avez toujours pas reçu l'e-mail de vérification après avoir essayé les méthodes précédentes, veuillez contacter l’assistance. |
	When User click 'contacter l’assistance' hyperlink on Right Side panel
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/fr/support/'
	Then User sees 'Bienvenue sur le site d’assistance de MindManager' page header

@MindManager @Accounts @HelpButton @WebApp @App_QA @App_Staging @App_Prod @Qase[WEB-3004] @Locale_French @JIRA[MMCV-10105,MMCV-10262,MMCV-10377] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Sign_In_Screen_FR
	Given User is on the Mindmanager website
	When User accepts Optanon cookies
	When User clicks 'Se connecter' button
	When User clicks 'Aide' button
	Then User sees 'contacter l’assistance' hyperlink on Right Side panel
	Then Following text is displayed under each header:
		| Header                                          | ExpectedText                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
		| Aide relative aux comptes MindManager           | Votre compte MindManager donne accès au plein potentiel de MindManager. Cela ne prend qu’une minute pour créer un compte, et c’est gratuit !                                                                                                                                                                                                                                                                                                                                                    |
		| À quoi sert un compte MindManager ?             | Le compte MindManager est votre identification unique pour MindManager.                                                                                                                                                                                                                                                                                                                                                                                                                         |
		| À quoi un compte MindManager donne-t-il accès ? | Votre compte MindManager donne accès à la licence perpétuelle, à l'abonnement et/ou aux services d'assistance. C'est également votre identité unique lors de l'utilisation de fonctions spéciales comme MindManager Snap, Publishing, Coédition et l'application MindManager pour Microsoft Teams.                                                                                                                                                                                              |
		| Puis-je utiliser mes identifiants Mindjet ?     | Dans la plupart des cas, non. Si vous disposez d’un compte Mindjet Connect ou Mindjet Files, d’un Mindjet ID ou de maps pour ce compte, vos anciens identifiants de connexion ne fonctionneront pas et vous devrez créer un nouveau compte MindManager.Si vous avez déjà créé un compte MindManager pour utiliser MindManager Snap, la publication ou la coédition, vous pouvez effectivement utiliser ce compte pour vous connecter.                                                           |
		| Je n’ai pas reçu mon e-mail de vérification !   | Dans certains cas, les filtres antispam peuvent bloquer nos e-mails. Essayez d'ajouter l’adresse noreply@mindmanager.com à votre liste d’expéditeurs approuvés. Vous pouvez également essayer d'appuyer sur le bouton « Renvoyer l'e-mail ». Dans ce cas, patientez quelques minutes, car la réception d'e-mails peut parfois prendre un certain temps. Si vous n'avez toujours pas reçu l'e-mail de vérification après avoir essayé les méthodes précédentes, veuillez contacter l’assistance. |
	When User click 'contacter l’assistance' hyperlink on Right Side panel
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/fr/support/'
	Then User sees 'Bienvenue sur le site d’assistance de MindManager' page header

@MindManager @Accounts @HelpButton @WebApp @App_QA @App_Staging @App_Prod @Qase[WEB-3005] @Locale_French @JIRA[MMCV-10105,MMCV-10262,MMCV-10377] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Create_Account_Screen_FR
	Given User is on the Mindmanager website
	When User accepts Optanon cookies
	When User clicks 'Créer un compte' button
	When User clicks 'Aide' button
	Then User sees 'contacter l’assistance' hyperlink on Right Side panel
	Then Following text is displayed under each header:
		| Header                                          | ExpectedText                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
		| Aide relative aux comptes MindManager           | Votre compte MindManager donne accès au plein potentiel de MindManager. Cela ne prend qu’une minute pour créer un compte, et c’est gratuit !                                                                                                                                                                                                                                                                                                                                                    |
		| À quoi sert un compte MindManager ?             | Le compte MindManager est votre identification unique pour MindManager.                                                                                                                                                                                                                                                                                                                                                                                                                         |
		| À quoi un compte MindManager donne-t-il accès ? | Votre compte MindManager donne accès à la licence perpétuelle, à l'abonnement et/ou aux services d'assistance. C'est également votre identité unique lors de l'utilisation de fonctions spéciales comme MindManager Snap, Publishing, Coédition et l'application MindManager pour Microsoft Teams.                                                                                                                                                                                              |
		| Puis-je utiliser mes identifiants Mindjet ?     | Dans la plupart des cas, non. Si vous disposez d’un compte Mindjet Connect ou Mindjet Files, d’un Mindjet ID ou de maps pour ce compte, vos anciens identifiants de connexion ne fonctionneront pas et vous devrez créer un nouveau compte MindManager.Si vous avez déjà créé un compte MindManager pour utiliser MindManager Snap, la publication ou la coédition, vous pouvez effectivement utiliser ce compte pour vous connecter.                                                           |
		| Je n’ai pas reçu mon e-mail de vérification !   | Dans certains cas, les filtres antispam peuvent bloquer nos e-mails. Essayez d'ajouter l’adresse noreply@mindmanager.com à votre liste d’expéditeurs approuvés. Vous pouvez également essayer d'appuyer sur le bouton « Renvoyer l'e-mail ». Dans ce cas, patientez quelques minutes, car la réception d'e-mails peut parfois prendre un certain temps. Si vous n'avez toujours pas reçu l'e-mail de vérification après avoir essayé les méthodes précédentes, veuillez contacter l’assistance. |
	When User click 'contacter l’assistance' hyperlink on Right Side panel
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/fr/support/'
	Then User sees 'Bienvenue sur le site d’assistance de MindManager' page header

@MindManager @Accounts @HelpButton @WebApp @App_QA @App_Staging @App_Prod @Qase[WEB-3006] @Locale_French @JIRA[MMCV-10105,MMCV-10262,MMCV-10377] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Start_Free_Trial_Screen_FR
	Given User is on the Mindmanager website
	When User accepts Optanon cookies
	When User clicks 'Démarrer l'essai gratuit' button
	When User clicks 'Aide' button
	Then User sees 'contacter l’assistance' hyperlink on Right Side panel
	Then Following text is displayed under each header:
		| Header                                          | ExpectedText                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
		| Aide relative aux comptes MindManager           | Votre compte MindManager donne accès au plein potentiel de MindManager. Cela ne prend qu’une minute pour créer un compte, et c’est gratuit !                                                                                                                                                                                                                                                                                                                                                    |
		| À quoi sert un compte MindManager ?             | Le compte MindManager est votre identification unique pour MindManager.                                                                                                                                                                                                                                                                                                                                                                                                                         |
		| À quoi un compte MindManager donne-t-il accès ? | Votre compte MindManager donne accès à la licence perpétuelle, à l'abonnement et/ou aux services d'assistance. C'est également votre identité unique lors de l'utilisation de fonctions spéciales comme MindManager Snap, Publishing, Coédition et l'application MindManager pour Microsoft Teams.                                                                                                                                                                                              |
		| Puis-je utiliser mes identifiants Mindjet ?     | Dans la plupart des cas, non. Si vous disposez d’un compte Mindjet Connect ou Mindjet Files, d’un Mindjet ID ou de maps pour ce compte, vos anciens identifiants de connexion ne fonctionneront pas et vous devrez créer un nouveau compte MindManager.Si vous avez déjà créé un compte MindManager pour utiliser MindManager Snap, la publication ou la coédition, vous pouvez effectivement utiliser ce compte pour vous connecter.                                                           |
		| Je n’ai pas reçu mon e-mail de vérification !   | Dans certains cas, les filtres antispam peuvent bloquer nos e-mails. Essayez d'ajouter l’adresse noreply@mindmanager.com à votre liste d’expéditeurs approuvés. Vous pouvez également essayer d'appuyer sur le bouton « Renvoyer l'e-mail ». Dans ce cas, patientez quelques minutes, car la réception d'e-mails peut parfois prendre un certain temps. Si vous n'avez toujours pas reçu l'e-mail de vérification après avoir essayé les méthodes précédentes, veuillez contacter l’assistance. |
	When User click 'contacter l’assistance' hyperlink on Right Side panel
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/fr/support/'
	Then User sees 'Bienvenue sur le site d’assistance de MindManager' page header

@MindManager @Accounts @HelpButton @WebApp @App_QA @App_Staging @Qase[WEB-3007] @Locale_French @JIRA[MMCV-10105,MMCV-10262,MMCV-10377] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_the_trial_expired_screen_FR
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
	When User find 'MindManager Trial' value in 'Produit' column of 'admin-home-purchases' table and clicks 'Administrer' button
	When User find 'MindManager Trial' value in 'Version' column of 'admin-license-purchases' table and clicks 'Ajouter/Gérer des utilisateurs' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Soumettre' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName            | Value             |
		| Version               | MindManager Trial |
		| Expire                | D(1)              |
		| Sièges Utilisés/Total | 1/3               |
	When User updates 'MMTRIAL' purchase data for '<customerName>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Votre essai de MindManager a expiré.' header on Right Side panel
	When User clicks 'Aide' button
	Then User sees 'Aide relative à la licence MindManager' header on Right Side panel
	When User clicks 'contacter l’assistance' hyperlink in '<text>' text on Right Side panel
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/fr/support/'
	Then User sees 'Bienvenue sur le site d’assistance de MindManager' page header

Examples:
	| customerName        | emailAddress                                 | password   | text                                                                                                                                                                                                                                                            |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Dans la plupart des cas, non. Toutefois, en cas de circonstances particulières, veuillez                                                                                                                                                                        |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Veuillez renouveler votre abonnement. Pour tout problème relatif à votre abonnement, veuillez                                                                                                                                                                   |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Si votre clé ne fonctionne pas, veuillez                                                                                                                                                                                                                        |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Votre clé vous sera envoyée par e-mail dès qu’elle sera prête. Si vous rencontrez des problèmes pour recevoir votre clé, veuillez                                                                                                                               |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Votre entreprise a déjà utilisé toutes ses licences disponibles. Veuillez contacter votre administrateur de logiciels MindManager pour ajouter des licences supplémentaires, puis réessayez. Si vous pensez que votre clé de licence a été compromise, veuillez |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Veuillez contacter l’assistance.                                                                                                                                                                                                                                |