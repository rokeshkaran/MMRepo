@retry(2)
Feature: PublishedMap
Check Share functionality in Toolbar Menu for MindManager Files for Published maps

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
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'publish' name in 'share-contextmenu' menu
	Then header 'Publish Complete!' is displayed on page
	When User clicks 'Done' button on SOME page
	Then published file with 'auto_test_SRND.mmap' name exists via Api
	Then Web Editor page is displayed to the User

@MindManager @ShareMenus @Toolbar @PublishedMap @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2243] @Upd_Qase
Scenario: Check_share_menu_buttons_on_tool_bar_when_map_is_published
	When User clicks 'Share' button on Tools panel
	Then following buttons are displayed in 'share' menu
		| items            |
		| Share            |
		| Copy Link        |
		| Unpublish        |
		| Publish Update   |
		| About Publishing |

@MindManager @ShareMenus @Toolbar @PublishedMap @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2243] @Upd_Qase
Scenario: Check_share_menu_export_on_tool_bar_when_map_is_published
	When User clicks 'Share' button on Tools panel
	Then following menu buttons are displayed in 'share' menu
		| items  |
		| Export |
	When User mouse hovers menu button with 'export' name in 'share' menu
	Then following buttons are displayed in 'export' menu
		| Button             |
		| Download as HTML 5 |
		| Download as MMAP   |

@MindManager @ShareMenus @Toolbar @PublishedMap @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2243] @Upd_Qase
Scenario: Check_share_menu_separators_on_tool_bar_when_map_is_published
	When User clicks 'Share' button on Tools panel
	Then Custom content 'joint-horizontal-separator' is displayed at the folowing number in 'share' menu
		| number |
		| 3      |
		| 7      |