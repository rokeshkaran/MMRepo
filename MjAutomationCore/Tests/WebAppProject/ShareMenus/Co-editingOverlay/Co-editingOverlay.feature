@retry(2)
Feature: Co-editing Overlay
Check Share functionality of Co-editing overlay for MindManager Files

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User waits for data loading
	When User clicks 'For QA Automation' folder
	When User clicks 'RuntimeData File' folder
	When User clicks 'auto_test_SRND' file

@MindManager @ShareMenus @CoEditingOverlay @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2244] @Upd_Qase
Scenario: To_verify_menu_options_in_co-editing_overlay_for_MM_Files
	When User clicks menu button with 'coedit' name in 'OverlayPanelPageElement' container
	Then following buttons are displayed in 'coedit' menu
		| items              |
		| Co-editing enabled |
		| Share              |
		| Copy link          |

@MindManager @ShareMenus @CoEditingOverlay @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2245] @Upd_Qase
Scenario: To_verify_Share_option_in_Co-editing_overlay_for_MM_Files
	When User clicks menu button with 'coedit' name in 'OverlayPanelPageElement' container
	Then 'coedit' Menu is displayed to User
	When User clicks button with 'Share' name in 'coedit' menu
	Then 'share-file-dialog' dialog is displayed to User