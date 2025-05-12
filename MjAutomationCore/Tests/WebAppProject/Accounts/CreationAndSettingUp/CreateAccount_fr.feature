@retry(2)
Feature: Create_Account_fr
	Check Creating Account functionality error messages in French
	Check Error messages on Create Account page in French

Background: Pre-condition
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	Then 'Créer un compte' button is displayed
	When User clicks 'Créer un compte' button

@MindManager @Account @Create_Account @App_QA @App_Staging @App_Prod @Cleanup @CleanupOutlookEmail @Locale_French @Qase[WEB-2970] @Upd_Qase
Scenario Outline: Check_Account_Creation_app_fr
	Then User sees 'Créer votre compte gratuit' header on Right Side panel
	Then User sees 'Inscrivez-vous aujourd’hui et commencez à créer votre première map en quelques minutes.' text messege on Right Side panel
	When User fills account creation fields for new UI
		| Email          | FullName       | Password  |
		| <emailAddress> | Automation_RND | TYf78!RND |
	When User clicks 'Créer un compte' button
	When User waits for data loading
	Then User sees 'Veuillez confirmer votre compte pour continuer' header on Right Side panel
	When User accepts Optanon cookies
	Then User sees 'Un e-mail vient d’être envoyé à l’adresse <emailAddress>(changer d’adresse e-mail) depuis l’adresse noreply@mindmanager.com. Veuillez suivre les instructions de l’e-mail, puis revenez ici et cliquez sur « Continuer » pour terminer la configuration de votre compte.' text messege on Right Side panel
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Vérifiez votre compte MindManager' email title header and 'Autre chose' use case button
	When User switches to '0' tab
	When User clicks 'Autre chose' button for use case options on Right Side panel
	When User waits for data loading
	Then User sees 'Vous n’avez pas la licence appropriée pour utiliser ce produit.' header on Right Side panel
	Then User sees 'Bonne nouvelle ! Vous avez droit à un essai gratuit.' subheader on Right Side panel
	When User close Admin System Message for User '<emailAddress>' and Password '<password>' via API
	When User clicks 'Démarrer l'essai gratuit' button
	When User refresh page
	Then 'Nouvelle' tab is active on file manager header page
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Détails du compte' item in 'user-panel' dropdown menu
	Then header 'Détails du compte' is displayed on page
	Then User Name 'Automation_RND' is displayed in 'NOM DU COMPTE' subsection in 'Général' section on Account Details page

Examples:
	| emailAddress                               | password  |
	| auto.test+SRND@mindmanager.onmicrosoft.com | TYf78!RND |

@MindManager @Account @Create_Account @App_QA @App_Staging @App_Prod @Cleanup @Locale_French @Qase[WEB-2970] @Upd_Qase
Scenario: Check_placeholders_of_sign_up_data_entry_fields_fr
	When User clicks 'Créer un compte' button
	Then 'Courriel' placeholder is displayed in 'email' enter field
	Then 'Votre nom' placeholder is displayed in 'full_name' enter field
	Then 'Mot de passe' placeholder is displayed in 'password' enter field

@MindManager @Account @Create_Account @App_QA @App_Staging @App_Prod @Cleanup @CleanupOutlookEmail @Locale_French @Qase[WEB-2976] @Upd_Qase
Scenario Outline: Check_Account_Creation_with_full_name_fr
	Then User sees 'Créer votre compte gratuit' header on Right Side panel
	Then User sees 'Inscrivez-vous aujourd’hui et commencez à créer votre première map en quelques minutes.' text messege on Right Side panel
	When User fills account creation fields for new UI
		| Email          | FullName            | Password  |
		| <emailAddress> | Automation_RND Test | TYf78!RND |
	When User clicks 'Créer un compte' button
	When User waits for data loading
	Then User sees 'Veuillez confirmer votre compte pour continuer' header on Right Side panel
	When User accepts Optanon cookies
	Then User sees 'Un e-mail vient d’être envoyé à l’adresse <emailAddress>(changer d’adresse e-mail) depuis l’adresse noreply@mindmanager.com. Veuillez suivre les instructions de l’e-mail, puis revenez ici et cliquez sur « Continuer » pour terminer la configuration de votre compte.' text messege on Right Side panel
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Vérifiez votre compte MindManager' email title header and 'Autre chose' use case button
	When User switches to '0' tab
	When User clicks 'Autre chose' button for use case options on Right Side panel
	When User waits for data loading
	Then User sees 'Vous n’avez pas la licence appropriée pour utiliser ce produit.' header on Right Side panel
	Then User sees 'Bonne nouvelle ! Vous avez droit à un essai gratuit.' subheader on Right Side panel
	When User close Admin System Message for User '<emailAddress>' and Password '<password>' via API
	When User clicks 'Démarrer l'essai gratuit' button
	When User refresh page
	Then 'Nouvelle' tab is active on file manager header page
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Détails du compte' item in 'user-panel' dropdown menu
	Then header 'Détails du compte' is displayed on page
	Then User Name 'Automation_RND Test' is displayed in 'NOM DU COMPTE' subsection in 'Général' section on Account Details page

Examples:
	| emailAddress                               | password  |
	| auto.test+SRND@mindmanager.onmicrosoft.com | TYf78!RND |

@MindManager @Account @Create_Account @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_French @Qase[WEB-2971] @Upd_Qase
Scenario: Create_account_without_Your_name_fr
	Then User sees 'Créer votre compte gratuit' header on Right Side panel
	Then User sees 'Inscrivez-vous aujourd’hui et commencez à créer votre première map en quelques minutes.' text messege on Right Side panel
	When User enters 'MindManagerSRND@mailinator.com' in the 'email' field
	When User enters '' in the 'full_name' field
	When User enters 'TYf78Klo12!' in the 'password' field
	When User clicks 'Créer un compte' button
	Then Error message with text 'Votre nom est obligatoire' is displayed to the User

@MindManager @Account @Create_Account @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_French @Qase[WEB-2972] @Upd_Qase
Scenario: Create_account_without_entering_password_fr
	When User enters 'MindManager@mailinator.com' in the 'email' field
	When User enters 'Automationtest' in the 'full_name' field
	When User clicks 'Créer un compte' button
	Then Error message with text 'Veuillez entrer votre mot de passe.' is displayed to the User

@MindManager @Account @Create_Account @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_French @Qase[WEB-2973] @Upd_Qase
Scenario: Create_account_without_entering_email_fr
	When User enters 'Automationtest' in the 'full_name' field
	When User enters 'TYf78Klo12' in the 'password' field
	When User clicks 'Créer un compte' button
	Then Error message with text 'Veuillez indiquer une adresse e-mail.' is displayed to the User

@MindManager @Account @Create_Account @QA @App_QA @Staging @App_Staging @App_Prod @Prod @Locale_French @Qase[WEB-2974] @Upd_Qase
Scenario: Check_Create_an_existing_account_fr
	When User enters 'automationtestmj@gmail.com' in the 'email' field
	When User enters 'Automationtest' in the 'full_name' field
	When User enters 'TYf78Klo12!' in the 'password' field
	When User clicks 'Créer un compte' button
	Then User sees 'Se connecter' header on Right Side panel
	Then User sees 'Veuillez entrer vos détails ci-dessous.' text messege on Right Side panel

@MindManager @Account @Create_Account @App_Prod @Cleanup @CleanupOutlookEmail @Locale_French @Qase[WEB-2975] @Upd_Qase
Scenario Outline: Check_changing_info_while_creating_an_account_app_Prod_fr
	When User fills account creation fields for new UI
		| Email          | FullName          | Password |
		| <invalidEmail> | TESTAutomationRND | G5kw!RND |
	When User clicks 'Créer un compte' button
	When User waits for data loading
	Then User sees 'Veuillez confirmer votre compte pour continuer' header on Right Side panel
	Then User sees 'Un e-mail vient d’être envoyé à l’adresse <invalidEmail>(changer d’adresse e-mail) depuis l’adresse noreply@mindmanager.com. Veuillez suivre les instructions de l’e-mail, puis revenez ici et cliquez sur « Continuer » pour terminer la configuration de votre compte.' text messege on Right Side panel
	When User clicks Change email link
	When User waits for data loading
	Then '<invalidEmail>' value is displayed to the 'email' field
	Then 'TESTAutomationRND' value is displayed to the 'full_name' field
	Then '' value is displayed to the 'password' field
	When User fills account creation fields for new UI
		| Email        | FullName      | Password   |
		| <validEmail> | AutomationRND | <password> |
	When User clicks 'Créer un compte' button
	When User waits for data loading
	When User accepts Optanon cookies
	Then User sees 'Veuillez confirmer votre compte pour continuer' header on Right Side panel
	Then User sees 'Un e-mail vient d’être envoyé à l’adresse <validEmail>(changer d’adresse e-mail) depuis l’adresse noreply@mindmanager.com. Veuillez suivre les instructions de l’e-mail, puis revenez ici et cliquez sur « Continuer » pour terminer la configuration de votre compte.' text messege on Right Side panel
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Vérifiez votre compte MindManager' email title header and 'Autre chose' use case button
	When User switches to '0' tab
	When User clicks 'Autre chose' button for use case options on Right Side panel
	When User waits for data loading
	Then User sees 'Vous n’avez pas la licence appropriée pour utiliser ce produit.' header on Right Side panel
	Then User sees 'Bonne nouvelle ! Vous avez droit à un essai gratuit.' subheader on Right Side panel
	When User close Admin System Message for User '<validEmail>' and Password '<password>' via API
	When User clicks 'Démarrer l'essai gratuit' button
	When User refresh page
	Then 'Nouvelle' tab is active on file manager header page
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Se déconnecter' item in 'user-panel' dropdown menu
	Then Right Side panel is displayed
	When User clicks 'Se connecter' button
	When User enters '<invalidEmail>' in the 'email' field
	When User enters 'G5kwRND' in the 'password' field
	When User clicks 'Se connecter' button
	Then Error message with text 'Nom d’utilisateur ou mot de passe non valide.' is displayed to the User

Examples:
	| invalidEmail                 | validEmail                                 | password   |
	| automation_SRND@hehe.ppp.com | auto.test+SRND@mindmanager.onmicrosoft.com | M2p8rwRND! |

@MindManager @Account @Create_Account @App_QA @App_Staging @Cleanup @CleanupOutlookEmail @Locale_French @Qase[WEB-2975] @JIRA[MMCV-10518] @Upd_Qase
Scenario Outline: Check_changing_info_while_creating_an_account_fr
	When User fills account creation fields for new UI
		| Email          | FullName          | Password |
		| <invalidEmail> | TESTAutomationRND | G5kwRND! |
	When User clicks 'Créer un compte' button
	Then User sees 'Veuillez confirmer votre compte pour continuer' header on Right Side panel
	Then User sees 'Un e-mail vient d’être envoyé à l’adresse <invalidEmail>(changer d’adresse e-mail) depuis l’adresse noreply@mindmanager.com. Veuillez suivre les instructions de l’e-mail, puis revenez ici et cliquez sur « Continuer » pour terminer la configuration de votre compte.' text messege on Right Side panel
	When User clicks Change email link
	Then '<invalidEmail>' value is displayed to the 'email' field
	Then 'TESTAutomationRND' value is displayed to the 'full_name' field
	Then '' value is displayed to the 'password' field
	When User fills account creation fields for new UI
		| Email        | FullName      | Password   |
		| <validEmail> | AutomationRND | <password> |
	When User clicks 'Créer un compte' button
	Then User sees 'Veuillez confirmer votre compte pour continuer' header on Right Side panel
	When User accepts Optanon cookies
	Then User sees 'Un e-mail vient d’être envoyé à l’adresse <validEmail>(changer d’adresse e-mail) depuis l’adresse noreply@mindmanager.com. Veuillez suivre les instructions de l’e-mail, puis revenez ici et cliquez sur « Continuer » pour terminer la configuration de votre compte.' text messege on Right Side panel
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Vérifiez votre compte MindManager' email title header and 'Autre chose' use case button
	When User switches to '0' tab
	When User clicks 'Autre chose' button for use case options on Right Side panel
	When User waits '3000' miliseconds
	Then User sees 'Vous n’avez pas la licence appropriée pour utiliser ce produit.' header on Right Side panel
	Then User sees 'Bonne nouvelle ! Vous avez droit à un essai gratuit.' subheader on Right Side panel
	When User close Admin System Message for User '<validEmail>' and Password '<password>' via API
	When User clicks 'Démarrer l'essai gratuit' button
	When User refresh page
	Then 'Nouvelle' tab is active on file manager header page
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Se déconnecter' item in 'user-panel' dropdown menu
	Then Right Side panel is displayed
	When User clicks 'Se connecter' button
	When User enters '<invalidEmail>' in the 'email' field
	When User enters 'G5kwRND!' in the 'password' field
	When User clicks 'Se connecter' button
	Then Error message with text 'Nom d’utilisateur ou mot de passe non valide.' is displayed to the User
	#Support Portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Se connecter' button
	When User provides the Password from company account and clicks on Sign In button
	When User selects 'Recherche d'utilisateurs' search option on Action panel
	When User enters '<invalidEmail>' value in the 'search-input' field on Action panel
	Then 'license-support-tenant-search-result' table is not displayed to User
	When User enters '<validEmail>' value in the 'search-input' field on Action panel
	Then '<validEmail>' value is displayed in the 'Utilisateur' column of 'license-support-user-search-result' table

Examples:
	| invalidEmail                 | validEmail                                 | password   |
	| automation_SRND@hehe.ppp.com | auto.test+SRND@mindmanager.onmicrosoft.com | M2p8rwRND! |