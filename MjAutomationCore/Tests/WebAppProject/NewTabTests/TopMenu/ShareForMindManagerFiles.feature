@retry(2)
Feature: ShareForMindManagerFiles
Check Share functionality in Toolbar Menu for MindManager Files

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	Given User uploads following files to '/' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User waits for data loading
	When User clicks 'auto_test_SRND' file
	Then Web Editor page is displayed to the User

@MindManager @Top_Menu @ShareForMindManagerFiles @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2247] @Upd_Qase
Scenario: Check_share_menu_buttons_on_top_menu
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	Then following buttons are displayed in 'share' menu
		| items            |
		| Share            |
		| Copy Link        |
		| Publish          |
		| About Publishing |

@MindManager @Top_Menu @ShareForMindManagerFiles @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2247] @Upd_Qase
Scenario: Check_share_menu_export_on_top_menu
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	Then following menu buttons are displayed in 'share' menu
		| items  |
		| Export |
	When User mouse hovers menu button with 'export' name in 'share' menu
	Then following buttons are displayed in 'export' menu
		| Button             |
		| Download as HTML 5 |
		| Download as MMAP   |

@MindManager @Top_Menu @ShareForMindManagerFiles @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2247] @Upd_Qase
Scenario: Check_share_menu_separators_on_top_menu
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	Then Custom content 'joint-horizontal-separator' is displayed at the folowing number in 'share' menu
		| number |
		| 3      |
		| 6      |