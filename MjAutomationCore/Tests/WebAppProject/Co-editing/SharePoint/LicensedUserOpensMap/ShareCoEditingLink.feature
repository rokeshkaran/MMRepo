@retry(2)
Feature: ShareCoEditingLink
Check that it is possible to share the co-editing link

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @Co_Editing @ShareCoEditingLink @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-206] @Upd_Qase
Scenario: Via_Status_overlay
	When User clicks menu button with 'coedit' name in 'OverlayPanelPageElement' container
	Then 'coedit' Menu is displayed to User
	When User clicks button with 'share' name in 'coedit' menu
	Then toast notification is displayed on Overlay panel
	Then text 'Link Copiedto clipboard' is displayed in toast notification on Overlay panel
	Then value is copied to the clipboard

@MindManager @Co_Editing @ShareCoEditingLink @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-207] @Upd_Qase @JIRA[MMCV-9396]
Scenario: Via_Toolbar
	When User clicks 'Share' button on Tools panel
	Then 'share-contextmenu' dropdown menu is displayed to User
	When User clicks button with 'copy-link' name in 'share-contextmenu' menu
	Then toast notification is displayed on Overlay panel
	Then text 'Link Copiedto clipboard' is displayed in toast notification on Overlay panel
	Then value is copied to the clipboard

@MindManager @Co_Editing @ShareCoEditingLink @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-208] @Upd_Qase @JIRA[MMCV-9396]
Scenario: Via_Top_menu
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	When User clicks button with 'Copy Link' name in 'share' menu
	Then toast notification is displayed on Overlay panel
	Then text 'Link Copiedto clipboard' is displayed in toast notification on Overlay panel
	Then value is copied to the clipboard