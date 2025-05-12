@retry(2)
Feature: Forgot_Password_fr
Check Forgot Password functionality in French

Background: Pre-condition
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	When User clicks 'Se connecter' button

@MindManager @Account @Forgot_Password @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_French @Qase[WEB-2980] @Upd_Qase
Scenario: Cancel_password_reset_fr
	When User enters 'automation.mj.fp@gmail.com' in the 'email' field
	Then 'Mot de passe oublié ?' button is displayed
	When User clicks 'Mot de passe oublié ?' button
	Then User sees 'Mot de passe oublié' header on Right Side panel
	Then User sees 'Veuillez entrer votre adresse e-mail.' text messege on Right Side panel
	When User accepts Optanon cookies
	Then 'Envoyer un lien de réinitialisation' button is displayed
	Then 'Annuler' button is displayed
	When User clicks 'Envoyer un lien de réinitialisation' button
	Then Error message with text 'Veuillez indiquer une adresse e-mail.' is displayed to the User
	When User clicks 'Annuler' button
	Then User sees 'Bienvenue' header on Right Side panel

@MindManager @Account @Forgot_Password @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_French @Qase[WEB-2980] @Upd_Qase
Scenario: Check_placeholders_of_sign_up_data_entry_fields_fr
	When User clicks 'Se connecter' button
	Then 'Mot de passe oublié ?' button is displayed
	When User clicks 'Mot de passe oublié ?' button
	Then 'Courriel' placeholder is displayed in 'email' enter field

@MindManager @Account @Forgot_Password @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Cleanup @ForgotPasswordEmailCleanup @Do_Not_Run_With_Forgot_Password @Locale_French @Qase[WEB-2979] @Upd_Qase @JIRA[MMCV-10102]
Scenario: Check_Forgot_Password_Functionality_fr
	When User enters '<emailAddress>' in the 'email' field
	Then 'Mot de passe oublié ?' button is displayed
	When User clicks 'Mot de passe oublié ?' button
	Then User sees 'Mot de passe oublié' header on Right Side panel
	Then User sees 'Veuillez entrer votre adresse e-mail.' text messege on Right Side panel
	When User accepts Optanon cookies
	Then 'Envoyer un lien de réinitialisation' button is displayed
	Then 'Annuler' button is displayed
	When User enters '<emailAddress>' in the 'email' field
	When User clicks 'Envoyer un lien de réinitialisation' button
	Then User sees 'Réussite' page header
	Then User sees 'Si l’adresse e-mail <emailAddress> existe dans notre système, vous recevrez rapidement un e-mail contenant un lien permettant de réinitialiser votre mot de passe.' text messege on Right Side panel
	Then 'Terminé' button is displayed
	When User clicks 'Terminé' button
	Then Right Side panel is displayed
	Then User sees 'Bienvenue' header on Right Side panel
	When User navigates the password reset link in the newly received email with 'Réinitialiser le mot de passe' email title header
	Then User sees 'Réinitialiser le mot de passe' header on Right Side panel
	Then User sees 'Veuillez entrer un nouveau mot de passe.' text messege on Right Side panel
	When User enters 'anrpw!SRND' in the 'password' field
	When User enters 'anrpw!SRND' in the 'confirm_password' field
	When User clicks 'Définir un nouveau mot de passe' button
	Then Right Side panel is displayed
	Then User sees 'Se connecter' header on Right Side panel
	Then User sees 'Veuillez entrer vos détails ci-dessous.' text messege on Right Side panel
	When User enters '<emailAddress>' in the 'email' field
	When User enters 'anrpw!SRND' in the 'password' field
	When User clicks 'Se connecter' button
	Then 'Nouvelle' tab is displayed on file manager header page
	Then 'Mes fichiers' tab is displayed on file manager header page
	Then 'Fichiers publiés' tab is displayed on file manager header page

Examples:
	| emailAddress               |
	| automation.mj.fp@gmail.com |