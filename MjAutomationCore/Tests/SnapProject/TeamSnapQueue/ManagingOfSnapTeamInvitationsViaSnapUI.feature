@retry(2)
Feature: ManagingOfSnapTeamInvitationsViaSnapUI
	Check invitation functionality to Snap Team via Snap UI

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
#User A
	Given '1' User is logged into MindManager web app via Api
	When '1' User creates teams in Snap Queue via Api
		| Name                   |
		| Automation_test team   |
		| Automation_test team_2 |
	When '1' User add members to team 'Automation_test team' in Snap Queue via Api
		| Members                    |
		| automationtestmm15@meta.ua |
#User B
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '15' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User accepts Optanon cookies
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	When User clicks notification item with 'New Team Invitation' title on Snap panel

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @SnapUserCleanup @SnapTeamCleanup @Qase[MSNAP-138] @Upd_Qase
Scenario: Viewing_and_accepting_invitation_via_Snap_UI
	Then 'New Team Invitation' header is displayed on panel
	When User clicks 'Accept' footer button on notification content panel
	Then notification content panel is not displayed to User
	Then 'Snap' side panel with 'Snap' header is displayed to the User

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @SnapUserCleanup @SnapTeamCleanup @Qase[MSNAP-139] @Upd_Qase
Scenario: Declining_an_invitation_via_Snap_UI
	Then 'New Team Invitation' header is displayed on panel
	When User clicks 'Decline' footer button on notification content panel
	Then notification content panel is not displayed to User
	Then 'Snap' side panel with 'Snap' header is displayed to the User

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @SnapUserCleanup @SnapTeamCleanup @Qase[MSNAP-140] @Upd_Qase
Scenario: Leaving_the_invitation_screen_via_X_button
	Then 'New Team Invitation' header is displayed on panel
	When User clicks Close button of 'Snap' side panel with 'Snap' header
	Then notification content panel is not displayed to User
	Then 'Snap' side panel with 'Snap' header is not displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then notification item with 'New Team Invitation' title is displayed on Snap panel

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @SnapUserCleanup @SnapTeamCleanup @Qase[MSNAP-140] @Upd_Qase
Scenario: Leaving_the_invitation_screen_via_Back_button
	Then 'New Team Invitation' header is displayed on panel
	When User click back button on 'New Team Invitation' Title on Snap Panel
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then notification item with 'New Team Invitation' title is displayed on Snap panel