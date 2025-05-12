@retry(2)
Feature: Filter
Check filter panel functionality

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-690] @Upd_Qase
Scenario: Check_that_topic_boundaries_are_faded_with_the_topic
	When User clicks 'F1ST6ST6' topic on Canvas
	When User clicks 'Add boundary' button on Tools panel
	Then 'F1ST6ST6' topic is located in boundary on Canvas
	When User clicks 'Filter' button of side Toolbox
	When User checks 'Priority 2' checkbox to 'Priority' group in 'General' section on Filter panel
	Then 'Priority 2' checkbox is checked to 'Priority' group in 'General' section on Filter panel
	When User clicks 'Fade' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'MT2' is displayed with at 50 percent opacity on Canvas
	Then 'F1ST6ST6' topic is displayed with '1' opacity on Canvas
	When User clicks 'F1ST6ST6' topic on Canvas
	When User Right clicks 'Priority 3' icon in 'F1ST6ST6' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'Quick Filter' name in 'topic-contextmenu' menu
	When User clicks button with 'fade' name in 'quick-filter' menu
	Then 'F1ST6ST6' is displayed with at 50 percent opacity on Canvas
	Then 'F1ST6ST6' topic is located in '0.15' opacity boundary on Canvas

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-691] @Upd_Qase
Scenario: Check_that_filter_display_the_same_tags_from_different_tag_groups
	When User Right clicks 'Tag #2' tags in 'MT4ST3' topic infobox
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'Quick Filter' name in 'topic-contextmenu' menu
	When User clicks button with 'xor-hide' name in 'quick-filter' menu
	Then 'MT4ST3' topic is displayed on Canvas
	Then 'MT4' topic is displayed on Canvas
	Then 'MT2' topic is not displayed on Canvas
	Then 'MT3' topic is not displayed on Canvas

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-692] @JIRA[MMCV-8888] @Upd_Qase
Scenario: Check_that_applying_a_filter_pans_the_map_to_show_the_matching_result
	When User remembers the map location on Canvas
	Then User set zoom level to '150' via the side tool bar
	When User remembers location of 'MT2' topic on Canvas
	When User clicks 'Filter' button of side Toolbox
	Then 'PanelWithMenuButton' side panel with 'Filter' header is displayed to the User
	When User checks 'Priority 2' checkbox to 'Priority' group in 'General' section on Filter panel
	Then 'Priority 2' checkbox is checked to 'Priority' group in 'General' section on Filter panel
	Then 'MT2' topic has changed location by X axis on Canvas
	Then 'MT2' topic has changed location by Y axis on Canvas
	Then 'MT2' topic is displayed on Canvas
	Then 'F1ST6' subtopic is displayed on Canvas
	Then 'MT3' topic is not displayed on Canvas
	When User clicks menu button with 'filter' name in 'OverlayPanelPageElement' container
	When User clicks button with 'remove-filter' name in 'filter' menu
	Then 'MT2' topic has changed location by X axis on Canvas
	Then 'MT2' topic has changed location by Y axis on Canvas
	Then 'MT2' topic is displayed on Canvas
	Then 'F1ST6' subtopic is displayed on Canvas
	Then 'MT3' topic is displayed on Canvas
	When User remembers location of 'MT2' topic on Canvas
	When User Right clicks 'Priority 2' icon in 'MT2' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'Show' name in 'quick-filter' menu
	Then menu button with 'filter' name is displayed in 'OverlayPanelPageElement' container
	Then 'MT2' topic has changed location by X axis on Canvas
	Then 'MT2' topic has changed location by Y axis on Canvas
	Then 'MT2' topic is displayed on Canvas
	Then 'F1ST6' subtopic is displayed on Canvas
	Then 'MT3' topic is not displayed on Canvas

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-693] @Upd_Qase
Scenario: Check_that_filter_is_applied_to_the_collapsed_topics
	When User clicks 'Filter' button of side Toolbox
	Then 'PanelWithMenuButton' side panel with 'Filter' header is displayed to the User
	When User clicks 'Hide' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Hide' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	When User checks 'Priority 2' checkbox to 'Priority' group in 'General' section on Filter panel
	Then 'Priority 2' checkbox is checked to 'Priority' group in 'General' section on Filter panel
	Then 'MT2' topic is not displayed on Canvas
	When User checks 'Priority 3' checkbox to 'Priority' group in 'General' section on Filter panel
	Then 'Priority 3' checkbox is checked to 'Priority' group in 'General' section on Filter panel
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'expand-all' name in 'view' menu
	Then all subtopics are expanded on Canvas
	Then 'F1ST7ST7' subtopic is not displayed on Canvas