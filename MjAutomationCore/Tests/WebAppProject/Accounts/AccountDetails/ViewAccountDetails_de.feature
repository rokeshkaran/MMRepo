@retry(2)
Feature: View_Account_Details_de
Check View Account Details functionality in German

@MindManager @Via_Accounts_Details @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_German @Qase[WEB-2949] @Upd_Qase
Scenario: Check_that_user_is_able_to_view_their_account_details_de
	Given User is logged into MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Kontodetails' item in 'user-panel' dropdown menu
	Then header 'Kontodetails' is displayed on page
	Then 'Allgemein' section is displayed on Account Details page
	Then 'Meine Produkte' section is displayed on Account Details page
	Then 'Einstellungen' section is displayed on Account Details page
	Then checkbox 'Ja! Ich möchte Produktangebote erhalten' is unchecked in 'Einstellungen' section on Account Details page
	Then checkbox 'Helfen Sie, MindManager besser zu machen' is checked in 'Einstellungen' section on Account Details page

@MindManager @Via_Accounts_Details @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_German @Qase[WEB-2950] @Upd_Qase
Scenario: Check_that_hovering_on_ipm_learnmore_text_shows_a_tooltip_de
	Given User is logged into MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Kontodetails' item in 'user-panel' dropdown menu
	Then header 'Kontodetails' is displayed on page
	When User mouses over 'Mehr erfahren' link in row with 'Ja! Ich möchte Produktangebote erhalten' label in 'Einstellungen' section on Account Details page
	Then tooltip with content 'Bleiben Sie auf dem Laufenden mit unseren exklusiven Angeboten und mehr!Haben Sie Ihre Meinung geändert? Klicken Sie erneut auf das Kästchen, um Ihre Einstellungen anzupassen.' is displayed for 'Mehr erfahren' link of row with 'Ja! Ich möchte Produktangebote erhalten' label in 'Einstellungen' section on Account Details page

@MindManager @Via_Accounts_Details @QA @App_QA @Staging @App_Staging @Prod @App_Prod @Locale_German @Qase[WEB-2951] @Upd_Qase
Scenario: Check_that_hovering_on_analytics_learnmore_text_shows_a_tooltip_de
	Given User is logged into MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Kontodetails' item in 'user-panel' dropdown menu
	Then header 'Kontodetails' is displayed on page
	When User mouses over 'Mehr erfahren' link in row with 'Helfen Sie, MindManager besser zu machen' label in 'Einstellungen' section on Account Details page
	Then tooltip with content 'Wir brauchen Ihre Erlaubnis, um anonym Daten darüber zu sammeln, wie Sie MindManager verwenden.Wir verwenden diese Daten, um zu verstehen, welche Funktionen am meisten verwendet werden, um unseren Fokus auf diese Bereiche zu legen. Wir teilen oder verkaufen diese Daten nie und sie können nie verwendet werden, um Sie zu identifizieren.' is displayed for 'Mehr erfahren' link of row with 'Helfen Sie, MindManager besser zu machen' label in 'Einstellungen' section on Account Details page