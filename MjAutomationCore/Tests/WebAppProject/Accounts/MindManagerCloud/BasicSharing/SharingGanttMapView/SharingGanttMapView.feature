@retry(2)
Feature: SharingGanttMapView
To verify it is possible to share the map in chosen view

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-2457] @Cleanup @Upd_Qase @JIRA[MMCV-10702]
Scenario: Verify_that_it_is_possible_to_share_map_in_Gantt_view_from_Map_view_via_top_menu
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	When User clicks button with 'Share' name in 'share' menu
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	Then 'Map View' option is chosen in dropdown 'share-file-dialog-select' menu by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can view' option from dropdown 'share-file-dialog-select'
	When User clicks selectbox by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog and selects 'Gantt View' option from dropdown 'share-file-dialog-select'	
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits for data loading
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-2458] @Cleanup @Upd_Qase @JIRA[MMCV-10702]
Scenario: Verify_that_it_is_possible_to_share_map_in_Gantt_view_from_Gantt_view_via_top_menu
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
 	When User clicks button with 'gantt-view' name in 'view' menu
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	When User clicks button with 'Share' name in 'share' menu
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	Then 'Map View' option is chosen in dropdown 'share-file-dialog-select' menu by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can view' option from dropdown 'share-file-dialog-select'
	When User clicks selectbox by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog and selects 'Gantt View' option from dropdown 'share-file-dialog-select'	
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits for data loading
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-2459] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_share_map_in_Map_view_from_Gantt_view_via_top_menu
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
 	When User clicks button with 'gantt-view' name in 'view' menu
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	When User clicks button with 'Share' name in 'share' menu
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	Then 'Map View' option is chosen in dropdown 'share-file-dialog-select' menu by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can view' option from dropdown 'share-file-dialog-select'
	When User clicks selectbox by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog and selects 'Map View' option from dropdown 'share-file-dialog-select'	
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits for data loading
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-2460] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_share_map_in_Map_view_from_Map_view_via_top_menu
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	When User clicks button with 'Share' name in 'share' menu
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	Then 'Map View' option is chosen in dropdown 'share-file-dialog-select' menu by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can edit' option from dropdown 'share-file-dialog-select'
	When User clicks selectbox by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog and selects 'Map View' option from dropdown 'share-file-dialog-select'	
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits for data loading
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-2485] @Cleanup @Upd_Qase @JIRA[MMCV-10702]
Scenario: Verify_that_it_is_possible_to_share_map_in_Gantt_view_from_Map_view_via_toolbar
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'Share' name in 'share-contextmenu' menu
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	Then 'Map View' option is chosen in dropdown 'share-file-dialog-select' menu by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can view' option from dropdown 'share-file-dialog-select'
	When User clicks selectbox by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog and selects 'Gantt View' option from dropdown 'share-file-dialog-select'	
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits for data loading
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-2486] @Cleanup @Upd_Qase @JIRA[MMCV-10702]
Scenario: Verify_that_it_is_possible_to_share_map_in_Gantt_view_from_Gantt_view_via_toolbar
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
 	When User clicks button with 'gantt-view' name in 'view' menu
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode
	When User clicks 'share' button on Gantt toolbar
	When User clicks button with 'Share' name in 'gantt-share-contextmenu' menu
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	Then 'Map View' option is chosen in dropdown 'share-file-dialog-select' menu by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can view' option from dropdown 'share-file-dialog-select'
	When User clicks selectbox by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog and selects 'Gantt View' option from dropdown 'share-file-dialog-select'	
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits for data loading
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-2487] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_share_map_in_Map_view_from_Gantt_view_via_toolbar
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
 	When User clicks button with 'gantt-view' name in 'view' menu
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode
	When User clicks 'share' button on Gantt toolbar
	When User clicks button with 'Share' name in 'gantt-share-contextmenu' menu
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	Then 'Map View' option is chosen in dropdown 'share-file-dialog-select' menu by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can view' option from dropdown 'share-file-dialog-select'
	When User clicks selectbox by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog and selects 'Map View' option from dropdown 'share-file-dialog-select'	
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits for data loading
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-2488] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_share_map_in_Map_view_from_Map_view_via_toolbar
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'Share' name in 'share-contextmenu' menu
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	Then 'Map View' option is chosen in dropdown 'share-file-dialog-select' menu by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can edit' option from dropdown 'share-file-dialog-select'
	When User clicks selectbox by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog and selects 'Map View' option from dropdown 'share-file-dialog-select'	
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits for data loading
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-2489] @Cleanup @Upd_Qase @JIRA[MMCV-10702]
Scenario: Verify_that_it_is_possible_to_share_map_in_Gantt_view_from_Map_view_via_overlay
	When User clicks menu button with 'coedit' name in 'OverlayPanelPageElement' container
	Then 'coedit' Menu is displayed to User
	When User clicks button with 'Share' name in 'coedit' menu
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	Then 'Map View' option is chosen in dropdown 'share-file-dialog-select' menu by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can view' option from dropdown 'share-file-dialog-select'
	When User clicks selectbox by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog and selects 'Gantt View' option from dropdown 'share-file-dialog-select'	
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits for data loading
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-2490] @Cleanup @Upd_Qase @JIRA[MMCV-10702]
Scenario: Verify_that_it_is_possible_to_share_map_in_Gantt_view_from_Gantt_view_via_overlay
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
 	When User clicks button with 'gantt-view' name in 'view' menu
 	Then map is existed in 'Gantt' view mode
	Then Gantt toolbar is displayed to User
	When User clicks menu button with 'coedit' name in 'OverlayPanelPageElement' container
	Then 'coedit' Menu is displayed to User
	When User clicks button with 'Share' name in 'coedit' menu
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	Then 'Map View' option is chosen in dropdown 'share-file-dialog-select' menu by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can view' option from dropdown 'share-file-dialog-select'
	When User clicks selectbox by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog and selects 'Gantt View' option from dropdown 'share-file-dialog-select'	
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits for data loading
	Then Gantt toolbar is displayed to User
	Then map is existed in 'Gantt' view mode

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-2491] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_share_map_in_Map_view_from_Gantt_view_via_overlay
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
 	When User clicks button with 'gantt-view' name in 'view' menu
 	Then map is existed in 'Gantt' view mode
	Then Gantt toolbar is displayed to User
	When User clicks menu button with 'coedit' name in 'OverlayPanelPageElement' container
	Then 'coedit' Menu is displayed to User
	When User clicks button with 'Share' name in 'coedit' menu
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	Then 'Map View' option is chosen in dropdown 'share-file-dialog-select' menu by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can view' option from dropdown 'share-file-dialog-select'
	When User clicks selectbox by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog and selects 'Map View' option from dropdown 'share-file-dialog-select'	
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits for data loading
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode

@MindManager @MindManagerFiles @BasicSharing @SharingGanttMapView @App_QA @App_Staging @App_Prod @Qase[WEB-2492] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_share_map_in_Map_view_from_Map_view_via_overlay
	When User clicks menu button with 'coedit' name in 'OverlayPanelPageElement' container
	Then 'coedit' Menu is displayed to User
	When User clicks button with 'Share' name in 'coedit' menu
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	Then 'Map View' option is chosen in dropdown 'share-file-dialog-select' menu by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can edit' option from dropdown 'share-file-dialog-select'
	When User clicks selectbox by text 'People you share with will be directed to Map view' in 'share-file-dialog' dialog and selects 'Map View' option from dropdown 'share-file-dialog-select'	
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then value is copied to the clipboard
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' hyperlink
	When User switches to '2' tab
	When User waits for data loading
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode