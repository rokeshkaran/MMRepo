@retry(2)
Feature: OpenMapStoredOnOneDrive

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath              |
		| auto_test_SRND.mmap | 3rdPartyMapLinks.mmap |
	When User clicks 'My Files' tab on file manager header page

@MindManager @Attachments_Links @Link_to_map_that_is_in_3rd_party_storage_location @OpenMapStoredOnOneDrive @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-821] @Upd_Qase
Scenario: To_verify_that_user_can_open_OneDrive_map_by_attached_link_with_edit_permission
	When User login to OneDrive cloud
	Then 'OneDrive' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks Hyperlinks icon in 'Link to OneDrive Edit' topic infobox
	Then '2' count tab is open in browser
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	When User clicks 'Central Topic' topic on Canvas
	Then '2' plus is displayed on border in topic
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'coedit' name in 'OverlayPanelPageElement' container
	Then 'coedit' Menu is displayed to User
	Then button with 'Co-editing enabled' name is displayed in 'coedit' menu

@MindManager @Attachments_Links @Link_to_map_that_is_in_3rd_party_storage_location @OpenMapStoredOnOneDrive @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-822] @Upd_Qase
Scenario: To_verify_that_user_can_open_OneDrive_map_by_attached_link_with_view_only_permission
	When User login to OneDrive cloud
	Then 'OneDrive' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks Hyperlinks icon in 'Link to OneDrive read-only map' topic infobox
	Then '2' count tab is open in browser
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	When User clicks 'Central Topic' topic on Canvas
	Then '0' plus is displayed on border in topic
	Then 'Add topic' button is displayed as disabled on the Tools panel
	Then 'Add subtopic' button is displayed as disabled on the Tools panel
	Then 'Add floating topic' button is displayed as disabled on the Tools panel
	Then 'Add sticky note' button is displayed as disabled on the Tools panel
	Then 'Add callout' button is displayed as disabled on the Tools panel
	Then 'Add relationship' button is displayed as disabled on the Tools panel
	Then 'Add boundary' button is displayed as disabled on the Tools panel
	Then 'Delete' button is displayed as disabled on the Tools panel
	Then 'Share' button is displayed as disabled on the Tools panel
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel
	When User clicks on 'file' button on the Overlay panel
	Then button with 'read-only' name is displayed in 'file' menu
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'coedit' name in 'OverlayPanelPageElement' container
	Then 'coedit' Menu is displayed to User
	Then button with 'Co-editing enabled' name is displayed in 'coedit' menu
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel

@MindManager @Attachments_Links @Link_to_map_that_is_in_3rd_party_storage_location @OpenMapStoredOnOneDrive @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-823] @Upd_Qase
Scenario: To_verify_that_user_can_open_OneDrive_map_by_attached_link_without_permission
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks Hyperlinks icon in 'Link to OneDrive map (no permissions)' topic infobox
	Then '2' count tab is open in browser
	When User switches to '1' tab
	When User login to SharePoint
	When User waits '5000' miliseconds
	Then page with 'Insufficient Permissions' header is displayed to User
	Then message 'Insufficient Permissions. You do not have permission to view this file.' is displayed to User on page

@MindManager @Attachments_Links @Link_to_map_that_is_in_3rd_party_storage_location @OpenMapStoredOnOneDrive @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-824] @Upd_Qase
Scenario: To_verify_that_user_can_open_OneDrive_map_by_attached_link_with_login_to_cloud
	When User shares 'auto_test_SRND.mmap' MindManager cloud file with 'rw' permission to '3' user email via API
	When User openes 'chrome' browser
	Given '3' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to OneDrive cloud
	Then 'OneDrive' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	When User clicks settings icon on content navigation panel
	Then 'File Options' title is displayed on navigation panel
	Then 'Sign Out of OneDrive' item with 'auto.test@mindmanagercloudqa.com' description is exist on page
	When User clicks 'Sign Out of OneDrive' content item with 'auto.test@mindmanagercloudqa.com' description
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks Hyperlinks icon in 'Link to OneDrive Edit' topic infobox
	Then '2' count tab is open in browser
	When User switches to '1' tab
	When User login to SharePoint
	Then Web Editor page is displayed to the User
	When User clicks 'Central Topic' topic on Canvas
	Then '2' plus is displayed on border in topic
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'coedit' name in 'OverlayPanelPageElement' container
	Then 'coedit' Menu is displayed to User
	Then button with 'Co-editing enabled' name is displayed in 'coedit' menu

@MindManager @Attachments_Links @Link_to_map_that_is_in_3rd_party_storage_location @OpenMapStoredOnOneDrive @Co_Editing @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-825] @Upd_Qase
Scenario: To_verify_that_user_can_open_OneDrive_map_by_attached_link_in_coedit_session
	When User shares 'auto_test_SRND.mmap' MindManager cloud file with 'rw' permission to '2' user email via API
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks Hyperlinks icon in 'Link to OneDrive Edit' topic infobox
	Then '2' count tab is open in browser
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	When User clicks 'Central Topic' topic on Canvas
#Another user opens same link to the map
	When User openes 'chrome' browser
	Given '2' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to OneDrive cloud
	Then 'OneDrive' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks Hyperlinks icon in 'Link to OneDrive Edit' topic infobox
	Then '2' count tab is open in browser
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	When User clicks 'MT1' topic on Canvas
	Then '4' plus is displayed on border in topic
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'coedit' name in 'OverlayPanelPageElement' container
	Then 'coedit' Menu is displayed to User
	Then button with 'Co-editing enabled' name is displayed in 'coedit' menu
	Then button with 'show-participants' name contains 'View Participants (2)' text in 'coedit' menu
	Then User 'Automation_MJ' is displayed on 'Central Topic' topic CoEditing frame on Canvas 