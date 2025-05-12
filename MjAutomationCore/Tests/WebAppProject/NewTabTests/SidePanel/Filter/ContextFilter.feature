@retry(2)
Feature: ContextFilter
Check Context filter functionality

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | FilterMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @Side_Panel @Context_Filter @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-704] @Upd_Qase
Scenario: Check_Context_Filter_for_faded_items
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	When User checks 'Fade Non-Matching Topics' checkbox in the 'Filters' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	When User clicks 'Filter' button of side Toolbox
	Then 'PanelWithMenuButton' side panel with 'Filter' header is displayed to the User
	When User clicks 'Show' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	When User checks 'Discuss' checkbox to 'Flags' group in 'General' section on Filter panel
	Then 'Discuss' checkbox is checked to 'Flags' group in 'General' section on Filter panel
	Then 'CT' is displayed with at 50 percent opacity on Canvas
	When User Right clicks 'Doing' tags in 'MT' topic infobox
	Then filter context menu is not displayed to User
	Then 'PanelWithMenuButton' side panel with 'Filter' header is displayed to the User
	When User clicks 'Fade' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Main Topic' is displayed with at 50 percent opacity on Canvas
	When User right clicks 'Resource #1' resource in 'Main Topic' topic
	Then filter context menu is not displayed to User

@MindManager @Side_Panel @Context_Filter @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-705] @Upd_Qase
Scenario: Check_that_filters_can_be_stacked
	When User Right clicks 'Priority 3' icon in 'Main Topic' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'fade' name in 'quick-filter' menu
	When User clicks 'Filter' button of side Toolbox
	Then 'PanelWithMenuButton' side panel with 'Filter' header is displayed to the User
	Then 'Fade' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Priority 3' checkbox is checked to 'Priority' group in 'General' section on Filter panel
	When User Right clicks '25% done' icon in 'FT' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'Show' name in 'quick-filter' menu
	Then 'Combo' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Fade Priority 3' item is displayed in 'History' section on Filter panel
	Then 'Show Complete (%): 25%' item is displayed in 'History' section on Filter panel

@MindManager @Side_Panel @Context_Filter @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-706] @Upd_Qase
Scenario: Check_Filter_History
	When User clicks 'MT' topic on Canvas
	When User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	When User clicks 'Up' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'CT' topic on Canvas
	When User clicks '50% done' item in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then '50% done' Icon is displayed to the 'CT' Topic
	When User clicks 'FT' topic on Canvas
	When User clicks 'Happy' item in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then 'Happy' Icon is displayed to the 'FT' Topic
	When User clicks 'Filter' button of side Toolbox
	Then 'PanelWithMenuButton' side panel with 'Filter' header is displayed to the User
	Then 'Show' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	When User clicks 'Hide' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Hide' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	When User checks 'Up' checkbox to 'Arrows' group in 'General' section on Filter panel
	Then 'MT' topic is not displayed on Canvas
	When User Right clicks 'Happy' icon in 'FT' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'Show' name in 'quick-filter' menu
	Then 'Combo' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Hide Up (from panel)' item is displayed in 'History' section on Filter panel
	Then 'Show Happy' item is displayed in 'History' section on Filter panel

@MindManager @Side_Panel @Context_Filter @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-707] @Upd_Qase
Scenario: Check_Remove_context_filter_from_history
	When User Right clicks 'Priority 3' icon in 'Main Topic' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'fade' name in 'quick-filter' menu
	When User clicks 'Filter' button of side Toolbox
	Then 'PanelWithMenuButton' side panel with 'Filter' header is displayed to the User
	Then 'Fade' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Priority 3' checkbox is checked to 'Priority' group in 'General' section on Filter panel
	When User Right clicks '25% done' icon in 'FT' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'Show' name in 'quick-filter' menu
	When User Right clicks 'Up' icon in '12345' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'Hide' name in 'quick-filter' menu
	Then 'Combo' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Fade Priority 3' item is displayed in 'History' section on Filter panel
	Then 'Show Complete (%): 25%' item is displayed in 'History' section on Filter panel
	Then 'Hide Up' item is displayed in 'History' section on Filter panel
	When User clicks Remove button in 'Fade Priority 3' item in 'History' section on Filter panel
	Then 'Fade Priority 3' item is not displayed to 'History' section on Filter panel
	Then 'Show Complete (%): 25%' item is displayed in 'History' section on Filter panel
	Then 'Hide Up' item is displayed in 'History' section on Filter panel

@MindManager @Side_Panel @Context_Filter @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-708] @Upd_Qase
Scenario: Check_context_menu_in_combination_with_any_all_matches
	When User Right clicks 'Priority 3' icon in 'Main Topic' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'Show' name in 'quick-filter' menu
	When User clicks 'Filter' button of side Toolbox
	Then 'PanelWithMenuButton' side panel with 'Filter' header is displayed to the User
	Then 'Show' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	Then radio button 'all' is checked on Filter popup
	When User clicks Menu button of Filter panel
	When User clicks 'Reset' item in 'power-filter' dropdown menu
	Then '0' checkboxes are checked on the Filter Pop-up
	When User Right clicks 'Priority 3' icon in 'Main Topic' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'Hide' name in 'quick-filter' menu
	Then 'PanelWithMenuButton' side panel with 'Filter' header is displayed to the User
	Then 'Hide' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	Then radio button 'any' is checked on Filter popup
	When User clicks Menu button of Filter panel
	When User clicks 'Reset' item in 'power-filter' dropdown menu
	Then '0' checkboxes are checked on the Filter Pop-up
	When User Right clicks 'Priority 3' icon in 'Main Topic' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'Fade' name in 'quick-filter' menu
	Then 'PanelWithMenuButton' side panel with 'Filter' header is displayed to the User
	Then 'Fade' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	Then radio button 'any' is checked on Filter popup
	When User clicks Menu button of Filter panel
	When User clicks 'Reset' item in 'power-filter' dropdown menu
	Then '0' checkboxes are checked on the Filter Pop-up

@MindManager @Side_Panel @Context_Filter @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-709] @Upd_Qase
Scenario: Check_that_context_filter_option_works_for_priority_icons
	When User Right clicks 'Priority 3' icon in 'Main Topic' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	Then following buttons are displayed in 'quick-filter' menu
		| Button                         |
		| Show Topics with this Priority |
		| Fade Topics with this Priority |
		| Hide Topics with this Priority |
	When User clicks button with 'Show' name in 'quick-filter' menu
	Then menu button with 'filter' name is displayed in 'OverlayPanelPageElement' container
	Then 'Main Topic' topic is displayed on Canvas
	Then 'CT' topic is displayed on Canvas
	When User clicks menu button with 'filter' name in 'OverlayPanelPageElement' container
	When User clicks button with 'remove-filter' name in 'filter' menu
	When User Right clicks 'Priority 3' icon in 'Main Topic' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'fade' name in 'quick-filter' menu
	Then 'Main Topic' is displayed with at 50 percent opacity on Canvas
	When User clicks menu button with 'filter' name in 'OverlayPanelPageElement' container
	When User clicks button with 'remove-filter' name in 'filter' menu
	When User Right clicks 'Priority 3' icon in 'Main Topic' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'Hide' name in 'quick-filter' menu
	Then 'Main Topic' topic is not displayed on Canvas
      
@MindManager @Side_Panel @Context_Filter @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-710] @Upd_Qase
Scenario: Check_that_context_filter_option_works_for_progress_icons
	When User Right clicks '25% done' icon in 'FT' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	Then following buttons are displayed in 'quick-filter' menu
		| Button                         |
		| Show Topics with this Progress |
		| Fade Topics with this Progress |
		| Hide Topics with this Progress |
	When User clicks button with 'Show' name in 'quick-filter' menu
	Then menu button with 'filter' name is displayed in 'OverlayPanelPageElement' container
	Then 'FT' topic is displayed on Canvas
	Then '12345' topic is displayed on Canvas
	Then 'Main Topic' topic is not displayed on Canvas
	When User clicks menu button with 'filter' name in 'OverlayPanelPageElement' container
	When User clicks button with 'remove-filter' name in 'filter' menu
	When User Right clicks '25% done' icon in 'FT' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'fade' name in 'quick-filter' menu
	Then 'FT' is displayed with at 50 percent opacity on Canvas
	Then '12345' is displayed with at 50 percent opacity on Canvas
	Then 'Main Topic' topic is displayed on Canvas
	When User clicks menu button with 'filter' name in 'OverlayPanelPageElement' container
	When User clicks button with 'remove-filter' name in 'filter' menu
	When User Right clicks '25% done' icon in 'FT' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'Hide' name in 'quick-filter' menu
	Then 'FT' topic is not displayed on Canvas
	Then '12345' topic is not displayed on Canvas
	Then 'Main Topic' topic is displayed on Canvas

@MindManager @Side_Panel @Context_Filter @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-711] @Upd_Qase
Scenario: Check_that_context_filter_option_works_for_icons
	When User Right clicks 'Discuss' icon in 'FT' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	Then following buttons are displayed in 'quick-filter' menu
		| Button                     |
		| Show Topics with this Icon |
		| Fade Topics with this Icon |
		| Hide Topics with this Icon |
	When User clicks button with 'Show' name in 'quick-filter' menu
	Then menu button with 'filter' name is displayed in 'OverlayPanelPageElement' container
	Then 'FT' topic is displayed on Canvas
	Then 'Main Topic' topic is displayed on Canvas
	Then '12345' topic is not displayed on Canvas
	When User clicks menu button with 'filter' name in 'OverlayPanelPageElement' container
	When User clicks button with 'remove-filter' name in 'filter' menu
	When User Right clicks 'Discuss' icon in 'FT' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'fade' name in 'quick-filter' menu
	Then 'FT' is displayed with at 50 percent opacity on Canvas
	Then 'Main Topic' is displayed with at 50 percent opacity on Canvas
	When User clicks menu button with 'filter' name in 'OverlayPanelPageElement' container
	When User clicks button with 'remove-filter' name in 'filter' menu
	When User Right clicks 'Discuss' icon in 'FT' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'Hide' name in 'quick-filter' menu
	Then 'FT' topic is not displayed on Canvas
	Then 'Main Topic' topic is not displayed on Canvas
	Then '12345' topic is displayed on Canvas

@MindManager @Side_Panel @Context_Filter @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-712] @Upd_Qase
Scenario: Check_that_context_filter_option_works_for_tags
	When User Right clicks 'Doing' tags in 'MT' topic infobox
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	Then following buttons are displayed in 'quick-filter' menu
		| Button                    |
		| Show Topics with this Tag |
		| Fade Topics with this Tag |
		| Hide Topics with this Tag |
	When User clicks button with 'Show' name in 'quick-filter' menu
	Then menu button with 'filter' name is displayed in 'OverlayPanelPageElement' container
	Then 'MT' topic is displayed on Canvas
	Then '12345' topic is not displayed on Canvas
	When User clicks menu button with 'filter' name in 'OverlayPanelPageElement' container
	When User clicks button with 'remove-filter' name in 'filter' menu
	When User Right clicks 'Doing' tags in 'MT' topic infobox
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'fade' name in 'quick-filter' menu
	Then 'MT' is displayed with at 50 percent opacity on Canvas
	When User clicks menu button with 'filter' name in 'OverlayPanelPageElement' container
	When User clicks button with 'remove-filter' name in 'filter' menu
	When User Right clicks 'Doing' tags in 'MT' topic infobox
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'Hide' name in 'quick-filter' menu
	Then 'MT' topic is not displayed on Canvas
	Then '9' topics are displayed on Canvas

@MindManager @Side_Panel @Context_Filter @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-713] @Upd_Qase
Scenario: Check_that_context_filter_option_works_for_resources
	When User right clicks 'Resource #1' resource in 'Main Topic' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	Then following buttons are displayed in 'quick-filter' menu
		| Button                                |
		| Show Topics assigned to this Resource |
		| Fade Topics assigned to this Resource |
		| Hide Topics assigned to this Resource |
	When User clicks button with 'Hide' name in 'quick-filter' menu
	Then 'Main Topic' topic is not displayed on Canvas
	When User clicks menu button with 'filter' name in 'OverlayPanelPageElement' container
	When User clicks button with 'remove-filter' name in 'filter' menu
	When User right clicks 'Resource #1' resource in 'Main Topic' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'fade' name in 'quick-filter' menu
	Then 'Main Topic' is displayed with at 50 percent opacity on Canvas
	When User clicks menu button with 'filter' name in 'OverlayPanelPageElement' container
	When User clicks button with 'remove-filter' name in 'filter' menu
	When User right clicks 'Resource #1' resource in 'Main Topic' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'Show' name in 'quick-filter' menu
	Then 'Main Topic' topic is displayed on Canvas
	Then '4' topics are displayed on Canvas