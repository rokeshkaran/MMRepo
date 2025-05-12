@retry(2)
Feature: ViewParticipants
Team can view and remove participants

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation/RuntimeDataFiles' folder of SharePoint cloud via Api
		| fileName             | FilePath       |
		| auto_test_SRND.mmap  | SimpleMap.mmap |
		| auto_test2_SRND.mmap | SimpleMap.mmap |
#User B
	Given '15' User is logged into MindManager web app via Api
	When User accepts Optanon cookies
	Then file manager header page is displayed to User
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test2_SRND.mmap' file
	Then Web Editor page is displayed to the User
#User A
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User accepts Optanon cookies
	When '1' User creates teams in Snap Queue via Api
		| Name                       |
		| Automation_test_team_SRND  |
		| Automation_test_team2_SRND |
	When '1' User add members to team 'Automation_test_team_SRND' in Snap Queue via Api
		| Members                    |
		| automationtestmm15@meta.ua |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When '15' User accepts request to join 'Automation_test_team_SRND' team via Api

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @SnapTeamCleanup @Qase[MSNAP-17] @Upd_Qase
Scenario: To_verify_that_the_Team_owner_can_view_the_list_of_team_participants_and_remove_them_from_the_list
#User A
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then 'There's nothing here yet' message title is displayed on Snap panel
	Then 'My Snap Queue' menu button is displayed in Snap Panel
	When User clicks 'My Snap Queue' menu button on Snap panel
	When User clicks 'Add/Manage Teams' item in 'open-manage' menu in 'mm-capture-queue-selector-view' container on Snap Panel
	Then 'Add / Manage Teams' header is displayed on panel
	Then 'Automation_test_team_SRND' item in 'display-name' menu in 'teams-container' container is displayed on Snap panel
	Then 'Automation_test_team2_SRND' item in 'display-name' menu in 'teams-container' container is displayed on Snap panel
	When User clicks 'Automation_test_team_SRND' item in 'display-name' menu in 'teams-container' container on Snap Panel
	Then Participant menu is displayed on Snap panel
	Then 'Add Member' footer button is displayed on Snap panel
	Then User 'You' with email 'automationtestmm1@meta.ua' is in 'Owner' status is displayed in 'Add / Manage Team' queue title on Snap panel
	Then User 'MM_Tests_15 MM_Tests_15' with email 'automationtestmm15@meta.ua' is in 'Member' status is displayed in 'Add / Manage Team' queue title on Snap panel
#User B
	When User switches to '0' browser
	When User switches to '0' tab
	Then Web Editor page is displayed to the User
	When User clicks by coordinates '100' and '100' on Canvas
	When User clicks 'Snap' button of side Toolbox
	Then 'My Snap Queue' menu button is displayed in Snap Panel
	When User clicks 'My Snap Queue' menu button on Snap panel
	Then 'Automation_test_team_SRND' item in 'mm-capture-queue-popup-item' menu in 'mm-capture-queue-selector-view' container is displayed on Snap panel
#User A
	When User switches to '1' browser
	When User clicks on close button on user 'MM_Tests_15 MM_Tests_15' displayed in 'Add / Manage Team' queue title on Snap panel
	Then User 'MM_Tests_15 MM_Tests_15' is not displayed in 'Add / Manage Team' queue title on Snap panel
#User B
	When User switches to '0' browser
	When User switches to '0' tab
	Then Web Editor page is displayed to the User
	When User clicks by coordinates '100' and '100' on Canvas
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then 'My Snap Queue' menu button is displayed in Snap Panel
	When User clicks 'My Snap Queue' menu button on Snap panel
	Then 'Automation_test_team_SRND' item in 'mm-capture-queue-popup-item' menu in 'mm-capture-queue-selector-view' container is not displayed on Snap panel

@Snap @App_QA @App_Prod @Cleanup @Snap_Cleanup @SnapTeamCleanup @Qase[MSNAP-18] @Upd_Qase
Scenario: To_verify_that_non_owner_can_see_team_participants
#User B
	When User switches to '0' browser
	When User switches to '0' tab
	Then Web Editor page is displayed to the User
	When User clicks by coordinates '100' and '100' on Canvas
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then 'My Snap Queue' menu button is displayed in Snap Panel
	When User clicks 'My Snap Queue' menu button on Snap panel
	When User clicks 'Add/Manage Teams' item in 'open-manage' menu in 'mm-capture-queue-selector-view' container on Snap Panel
	Then 'Add / Manage Teams' header is displayed on panel
	When User clicks 'Automation_test_team_SRND' item in 'display-name' menu in 'teams-container' container on Snap Panel
	Then Participant menu is displayed on Snap panel
	Then User 'MM_Tests_1 MM_Tests_1' with email 'automationtestmm1@meta.ua' is in 'Owner' status is displayed in 'Add / Manage Team' queue title on Snap panel
	Then User 'You' with email 'automationtestmm15@meta.ua' is in 'Member' status is displayed in 'Add / Manage Team' queue title on Snap panel
	Then 'Add Member' footer button is not displayed on Snap panel
	When User clicks on close button on user 'You' displayed in 'Add / Manage Team' queue title on Snap panel
	Then 'Add / Manage Teams' header is displayed on panel

@Snap @App_Staging @Cleanup @Snap_Cleanup @SnapTeamCleanup @Qase[MSNAP-18] @Upd_Qase
Scenario: To_verify_that_non_owner_can_see_team_participants_Staging
#User B
	When User switches to '0' browser
	When User switches to '0' tab
	Then Web Editor page is displayed to the User
	When User clicks by coordinates '100' and '100' on Canvas
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then 'My Snap Queue' menu button is displayed in Snap Panel
	When User clicks 'My Snap Queue' menu button on Snap panel
	When User clicks 'Add/Manage Teams' item in 'open-manage' menu in 'mm-capture-queue-selector-view' container on Snap Panel
	Then 'Add / Manage Teams' header is displayed on panel
	When User clicks 'Automation_test_team_SRND' item in 'display-name' menu in 'teams-container' container on Snap Panel
	Then Participant menu is displayed on Snap panel
	Then User 'MM_Tests_1' with email 'automationtestmm1@meta.ua' is in 'Owner' status is displayed in 'Add / Manage Team' queue title on Snap panel
	Then User 'You' with email 'automationtestmm15@meta.ua' is in 'Member' status is displayed in 'Add / Manage Team' queue title on Snap panel
	Then 'Add Member' footer button is not displayed on Snap panel
	When User clicks on close button on user 'You' displayed in 'Add / Manage Team' queue title on Snap panel
	Then 'Add / Manage Teams' header is displayed on panel