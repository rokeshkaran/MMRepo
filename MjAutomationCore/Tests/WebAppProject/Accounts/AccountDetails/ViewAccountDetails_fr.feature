@retry(2)
Feature: View_Account_Details_fr
Check View Account Details functionality in French

@MindManager @Via_Accounts_Details @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_French @Qase[WEB-2952] @Upd_Qase
Scenario: Check_that_user_is_able_to_view_their_account_details_fr
	Given User is logged into MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Détails du compte' item in 'user-panel' dropdown menu
	Then header 'Détails du compte' is displayed on page
	Then 'Général' section is displayed on Account Details page
	Then 'Mes produits' section is displayed on Account Details page
	Then 'Paramètres' section is displayed on Account Details page
	Then checkbox 'Oui ! Je souhaite recevoir des offres du produit' is unchecked in 'Paramètres' section on Account Details page
	Then checkbox 'Contribuez à améliorer MindManager' is checked in 'Paramètres' section on Account Details page

@MindManager @Via_Accounts_Details @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_French @Qase[WEB-2953] @Upd_Qase
Scenario: Check_that_hovering_on_ipm_learnmore_text_shows_a_tooltip_fr
	Given User is logged into MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Détails du compte' item in 'user-panel' dropdown menu
	Then header 'Détails du compte' is displayed on page
	When User mouses over 'En savoir plus' link in row with 'Oui ! Je souhaite recevoir des offres du produit' label in 'Paramètres' section on Account Details page
	Then tooltip with content 'Tenez-vous au courant de nos offres exclusives et bien plus encore !Vous changez d’avis ? Il vous suffit de décocher la case pour mettre à jour vos préférences.' is displayed for 'En savoir plus' link of row with 'Oui ! Je souhaite recevoir des offres du produit' label in 'Paramètres' section on Account Details page

@MindManager @Via_Accounts_Details @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_French @Qase[WEB-2954] @Upd_Qase
Scenario: Check_that_hovering_on_analytics_learnmore_text_shows_a_tooltip_fr
	Given User is logged into MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Détails du compte' item in 'user-panel' dropdown menu
	Then header 'Détails du compte' is displayed on page
	When User mouses over 'En savoir plus' link in row with 'Contribuez à améliorer MindManager' label in 'Paramètres' section on Account Details page
	Then tooltip with content 'Nous avons besoin de votre autorisation pour collecter des données anonymes sur votre utilisation de MindManager.Nous utilisons ces données uniquement pour comprendre quelles sont les fonctions les plus souvent utilisées pour pouvoir concentrer nos efforts dans ces domaines. Nous ne partageons ou ne vendons jamais ces données, et elles ne permettent jamais de vous identifier.' is displayed for 'En savoir plus' link of row with 'Contribuez à améliorer MindManager' label in 'Paramètres' section on Account Details page