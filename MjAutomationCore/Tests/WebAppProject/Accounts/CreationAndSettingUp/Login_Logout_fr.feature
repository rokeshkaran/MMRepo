@retry(2)
Feature: Login_Logout_fr
Check Login-Logout functionality in French

Background: Pre-condition
	Given User is on the Mindmanager website
	Then Right Side panel is displayed

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_French @Qase[WEB-2987] @Upd_Qase
Scenario: Check_that_valid_user_is_able_to_sign_in_into_their_account_on_the_web_fr
	Then User sees 'Bienvenue' header on Right Side panel
	Then 'Démarrer l'essai gratuit' button is displayed
	Then 'Se connecter' button is displayed
	Then 'Créer un compte' button is displayed
	Then 'Aide' button is displayed
	When User clicks 'Se connecter' button
	Then User sees 'Se connecter' header on Right Side panel
	Then User sees 'Veuillez entrer vos détails ci-dessous.' text messege on Right Side panel
	When User provides the Login and Password and clicks on the Sign In button
	Then 'Nouvelle' tab is displayed on file manager header page
	Then 'Mes fichiers' tab is displayed on file manager header page
	Then 'Fichiers publiés' tab is displayed on file manager header page

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_French @Qase[WEB-2987] @Upd_Qase
Scenario: Check_placeholders_of_sign_in_data_entry_fields_fr
	When User clicks 'Se connecter' button
	Then 'Courriel' placeholder is displayed in 'email' enter field
	When User clicks 'Se connecter' button
	Then 'Mot de passe' placeholder is displayed in 'password' enter field

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_French @Qase[WEB-2992] @Upd_Qase
Scenario: Check_it_is_possible_to_sign_out_from_the_Mindjet_account_fr
	When User clicks 'Se connecter' button
	When User provides the Login and Password and clicks on the Sign In button
	Then 'Nouvelle' tab is displayed on file manager header page
	Then 'Mes fichiers' tab is displayed on file manager header page
	Then 'Fichiers publiés' tab is displayed on file manager header page
	When User clicks arrow down on 'fileManagerHeader' user panel
	Then following items is displayed in 'user-panel' dropdown menu
		| items             |
		| Se déconnecter    |
		| Détails du compte |
	When User clicks 'Se déconnecter' item in 'user-panel' dropdown menu
	Then Right Side panel is displayed
	Then User sees 'Bienvenue' header on Right Side panel
	Then 'Créer un compte' button is displayed
	Then 'Aide' button is displayed

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_French @Qase[WEB-2990] @Upd_Qase
Scenario: Sign_In_with_invalid_password_fr
	When User clicks 'Se connecter' button
	When User enters 'automation.mj.fp@gmail.com' in the 'email' field
	When User enters '12345' in the 'password' field
	When User clicks 'Se connecter' button
	Then Error message with text 'Nom d’utilisateur ou mot de passe non valide.' is displayed to the User

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_French @Qase[WEB-2991] @Upd_Qase
Scenario: Sign_In_with_invalid_email_fr
	When User clicks 'Se connecter' button
	When User enters 'automation.mj.fp@test.com' in the 'email' field
	When User enters 'TestPs1!' in the 'password' field
	When User clicks 'Se connecter' button
	Then Error message with text 'Nom d’utilisateur ou mot de passe non valide.' is displayed to the User

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_French @Qase[WEB-2988] @Upd_Qase
Scenario: Check_Sign_In_without_entering_email_fr
	When User clicks 'Se connecter' button
	When User enters '' in the 'email' field
	When User clicks 'Se connecter' button
	When User enters 'hUsdcsd1l92' in the 'password' field
	When User clicks 'Se connecter' button
	Then Error message with text 'Veuillez indiquer une adresse e-mail.' is displayed to the User

@MindManager @Account @Login_Logout @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_French @Qase[WEB-2989] @Upd_Qase
Scenario: Check_Sign_In_without_entering_password_fr
	When User clicks 'Se connecter' button
	When User enters 'test_email@gmail.com' in the 'email' field
	When User enters '' in the 'password' field
	When User clicks 'Se connecter' button
	Then Error message with text 'Veuillez entrer votre mot de passe.' is displayed to the User