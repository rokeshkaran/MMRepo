@retry(2)
Feature: InteractionWithSnapTeamGerman
Interaction with snap team with German language

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @SnapTeamCleanup @Locale_German @Qase[MSNAP-127] @Upd_Qase
Scenario: To_verify_that_user_receives_correct_invitation_email_german
#Create User B
	Given User is on the Mindmanager website
	When User accepts Optanon cookies
	Then Right Side panel is displayed
	Then 'Konto erstellen' button is displayed
	When User clicks 'Konto erstellen' button
	When User fills account creation fields for new UI
		| Email          | FullName   | Password   |
		| <emailAddress> | <userName> | <password> |
	When User clicks 'Konto erstellen' button
	When User waits for data loading
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Bitte verifizieren Sie Ihr MindManager-Konto' email title header and 'Etwas anderes' use case button
	When User switches to '0' tab
	When User clicks 'Etwas anderes' button for use case options on Right Side panel
  #User A
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '15' User is logged into MindManager web app via Api
	When User accepts Optanon cookies
	When '15' User creates teams in Snap Queue via Api
		| Name                      |
		| Automation_test_team_SRND |
	When User clicks 'Meine Dateien' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud for German locale
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then 'Hier ist noch nichts' message title is displayed on Snap panel
	Then 'Fotos, Notizen und mehr erscheinen hier, wenn Sie Snap verwenden. Senden Sie von Mobilapps, Browser oder Desktop-Apps aus.' content text is displayed on Snap panel
	Then 'Meine Snap Queue' menu button is displayed in Snap Panel
	When User clicks 'Meine Snap Queue' menu button on Snap panel
	When User clicks 'Teams hinzufügen/verwalten' item in 'open-manage' menu in 'mm-capture-queue-selector-view' container on Snap Panel
	Then 'Teams hinzufügen/verwalten' header is displayed on panel
	When User clicks 'Automation_test_team_SRND' item in 'display-name' menu in 'teams-container' container on Snap Panel
	Then Participant menu is displayed on Snap panel
	When User clicks 'Mitglied hinzufügen' footer button on Snap panel
	Then Add Member entry field is displayed on Snap Panel
	When User enter 'auto.test+SRND@mindmanager.onmicrosoft.com' email in add member entry field on Snap Panel
	When User clicks 'Mitglied(er) hinzufügen' footer button on Snap panel
	Then User '<userName>' with email '<emailAddress>' is in 'Ausstehend' status is displayed in 'Team hinzufügen/verwalten' queue title on Snap panel
	When User switches to '0' browser
	When User with 'auto.test@mindmanager.onmicrosoft.com' email address accept invite from user '15' for 'Automation_test_team_SRND' snap team with email "hat Sie in das folgende MindManager Snap Team eingeladen" header and success message 'Die Bitte wurde erfolgreich angenommen.'
	When User switches to '1' browser
	When User click back button on 'Team hinzufügen/verwalten' Title on Snap Panel
	Then 'Teams hinzufügen/verwalten' header is displayed on panel
	When User clicks 'Automation_test_team_SRND' item in 'display-name' menu in 'teams-container' container on Snap Panel
	Then Participant menu is displayed on Snap panel
	Then User '<userName>' with email '<emailAddress>' is in 'Mitglied' status is displayed in 'Team hinzufügen/verwalten' queue title on Snap panel

Examples:
	| userName            | emailAddress                               | password   |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |