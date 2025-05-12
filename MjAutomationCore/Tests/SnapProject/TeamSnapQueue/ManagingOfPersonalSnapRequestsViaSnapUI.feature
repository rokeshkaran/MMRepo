@retry(2)
Feature: ManagingOfPersonalSnapRequestsViaSnapUI
	Check invitation functionality to Snap User via Snap UI

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
#User A
	Given '15' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When '15' User sends request for capture queue items to 'automationtestmm1@meta.ua' users via Api
#User B
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
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
	When User clicks notification item with 'New Request' title on Snap panel

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @SnapUserCleanup @Qase[MSNAP-141] @Upd_Qase
Scenario: To_verify_that_user_can_accept_request_via_Snap_UI
	Then notification content panel is displayed to User
	Then 'New Request' header is displayed on panel
	When User clicks 'Accept' footer button on notification content panel
	Then notification content panel is not displayed to User
	Then 'Snap' side panel with 'Snap' header is displayed to the User

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @SnapUserCleanup @Qase[MSNAP-142] @Upd_Qase
Scenario: Declining_a_request_via_Snap_UI
	Then notification content panel is displayed to User
	Then 'New Request' header is displayed on panel
	When User clicks 'Decline' footer button on notification content panel
	Then notification content panel is not displayed to User
	Then 'Snap' side panel with 'Snap' header is displayed to the User

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @SnapUserCleanup @Qase[MSNAP-143] @Upd_Qase
Scenario: Leaving_the_request_details_screen_via_X_button
	Then 'New Request' header is displayed on panel
	When User clicks Close button of 'Snap' side panel with 'Snap' header
	Then notification content panel is not displayed to User
	Then 'Snap' side panel with 'Snap' header is not displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then notification item with 'New Request' title is displayed on Snap panel

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @SnapUserCleanup @Qase[MSNAP-143] @Upd_Qase
Scenario: Leaving_the_request_details_screen_via_Back_button
	Then 'New Request' header is displayed on panel
	When User click back button on 'New Request' Title on Snap Panel
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then notification item with 'New Request' title is displayed on Snap panel