@retry(2)
Feature: MessageOnCliclingOnUnavailableFeatures
To verify Upsell dialog for unavailable features

@MindManager @UpSellDialog @UpSellDialogWindows @MessageOnCliclingOnUnavailableFeatures @Not_Run_Firefox @Windows_browser @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2887] @Upd_Qase
Scenario: Verify_that_view_pricing_button_on_advertising_dialog_redirects_to_the_MindManager_pricing_page
	Given '21' User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
 		| ItemName            | ItemPath       |
 		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given '21' User is logged into MindManager web app via Api
	Then cloud templates page is displayed to User
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'advanced' name in 'ToolbarPageElement' container
	Then following buttons are displayed in 'advanced' menu
		| Button           |
		| Properties       |
		| Formulas         |
		| SmartRules       |
		| Map Roll-up      |
		| Jira             |
		| Sharepoint       |
		| Microsoft Lists  |
		| Macros & API     |
		| Manage Resources |
		| File Explorer    |
	When User clicks button with 'Properties' name in 'advanced' menu
	Then 'upsell-dialog' dialog is displayed to User
	When User clicks 'View Pricing' button in 'upsell-dialog' dialog
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/en/pricing/'

@MindManager @UpSellDialog @UpSellDialogWindows @MessageOnCliclingOnUnavailableFeatures @Not_Run_Firefox @Windows_browser @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2888] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_close_advertising_dialog_via_Close_button
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
 		| ItemName            | ItemPath       |
 		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	Then cloud templates page is displayed to User
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'advanced' name in 'ToolbarPageElement' container
	Then following buttons are displayed in 'advanced' menu
		| Button           |
		| Properties       |
		| Formulas         |
		| SmartRules       |
		| Map Roll-up      |
		| Jira             |
		| Sharepoint       |
		| Microsoft Lists  |
		| Macros & API     |
		| Manage Resources |
		| File Explorer    |
	When User clicks button with 'Sharepoint' name in 'advanced' menu
	Then 'upsell-dialog' dialog is displayed to User
	When User clicks 'Close' button in 'upsell-dialog' dialog
	Then 'upsell-dialog' dialog is not displayed to User


@MindManager @UpSellDialog @UpSellDialogWindows @MessageOnCliclingOnUnavailableFeatures @Not_Run_Firefox @Windows_browser @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2688] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_close_advertising_dialog_via_X_button
	Given '21' User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
 		| ItemName            | ItemPath       |
 		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given '21' User is logged into MindManager web app via Api
	Then cloud templates page is displayed to User
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'advanced' name in 'ToolbarPageElement' container
	Then 'advanced' Menu is displayed to User
	When User clicks button with 'Jira' name in 'advanced' menu
	Then 'upsell-dialog' dialog is displayed to User
	When User clicks '×' button in 'upsell-dialog' dialog
	Then 'upsell-dialog' dialog is not displayed to User

@MindManager @UpSellDialog @UpSellDialogWindows @MessageOnCliclingOnUnavailableFeatures @Not_Run_Firefox @Windows_browser @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2704] @Upd_Qase
Scenario: Verify_that_tooltip_is_displayed_on_hovering_over_Diamond_icon_for_user_with_essentials_license
	Given '21' User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
 		| ItemName            | ItemPath       |
 		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given '21' User is logged into MindManager web app via Api
	Then cloud templates page is displayed to User
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'advanced' name in 'ToolbarPageElement' container
	Then 'advanced' Menu is displayed to User
	When User mouse hovers Diamond icon on 'Jira' button in 'advanced' menu
	Then 'Upgrade to unlock this feature' tooltip is displayed to the User

@MindManager @UpSellDialog @UpSellDialogWindows @MessageOnCliclingOnUnavailableFeatures @Not_Run_Firefox @Windows_browser @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2705] @Upd_Qase
Scenario: Verify_that_tooltip_is_displayed_on_hovering_over_Diamond_icon_for_user_with_subscription_license
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
 		| ItemName            | ItemPath       |
 		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	Then cloud templates page is displayed to User
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'advanced' name in 'ToolbarPageElement' container
	Then following buttons are displayed in 'advanced' menu
		| Button           |
		| Properties       |
		| Formulas         |
		| SmartRules       |
		| Map Roll-up      |
		| Jira             |
		| Sharepoint       |
		| Microsoft Lists  |
		| Macros & API     |
		| Manage Resources |
		| File Explorer    |
	When User mouse hovers Diamond icon on 'Formulas' button in 'advanced' menu
	Then 'Available in MindManager Desktop' tooltip is displayed to the User

@MindManager @UpSellDialog @UpSellDialogWindows @MessageOnCliclingOnUnavailableFeatures @Not_Run_Firefox @Windows_browser @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2705] @Upd_Qase
Scenario: Verify_that_tooltip_is_displayed_on_hovering_over_Diamond_icon_for_user_with_trial_license
	Given '11' User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
 		| ItemName            | ItemPath       |
 		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given '11' User is logged into MindManager web app via Api
	Then cloud templates page is displayed to User
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'advanced' name in 'ToolbarPageElement' container
	Then following buttons are displayed in 'advanced' menu
		| Button           |
		| Properties       |
		| Formulas         |
		| SmartRules       |
		| Map Roll-up      |
		| Jira             |
		| Sharepoint       |
		| Microsoft Lists  |
		| Macros & API     |
		| Manage Resources |
		| File Explorer    |
	When User mouse hovers Diamond icon on 'Formulas' button in 'advanced' menu
	Then 'Available in MindManager Desktop' tooltip is displayed to the User