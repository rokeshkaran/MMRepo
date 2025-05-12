@retry(2)
Feature: FilterRecalculation
To verify the formulas are recalculated

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-720] @Upd_Qase
Scenario: To_verify_the_formulas_are_recalculated_depending_on_filters_hide_topics
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath                        |
		| auto_test_SRND.mmap | Recalculate_Hidder_filters.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And '25% done' Icon is displayed to the 'Topic A' Topic
	And '50% done' Icon is displayed to the 'Topic B' Topic
	And '75% done' Icon is displayed to the 'TopicC' Topic
	And 'topic_info_icon_calculated_property.svg' Icon with value '1.5' is displayed to the 'Central Topic' Topic infobox
	When User clicks 'Filter' button of side Toolbox
	Then 'PanelWithMenuButton' side panel with 'Filter' header is displayed to the User
	And 'Show' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	When User clicks 'Hide' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Hide' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	When User checks 'Complete (%): 25%' checkbox to 'Progress' group in 'General' section on Filter panel
	Then '25% done' Icon is not displayed to the 'Topic A' Topic
	And 'Topic A' topic is not displayed on Canvas
	And menu button with 'filter' name is displayed in 'status-missing-info' state on Overlay panel
	And 'topic_info_icon_calculated_property.svg' Icon with value '1.25' is displayed to the 'Central Topic' Topic infobox
	When User unchecks 'Complete (%): 25%' checkbox to 'Progress' group in 'General' section on Filter panel
	Then '25% done' Icon is displayed to the 'Topic A' Topic
	And 'Topic A' topic is displayed on Canvas
	And 'topic_info_icon_calculated_property.svg' Icon with value '1.5' is displayed to the 'Central Topic' Topic infobox
	And menu button with 'filter' name is not displayed on 'OverlayPanelPageElement' container

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-721] @Upd_Qase
Scenario: To_verify_the_topics_are_recounted_depending_on_filters_hide_topics
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath                      |
		| auto_test_SRND.mmap | Renumber_Hidden_Filter_2.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And 'Up' Icon is displayed to the '1. Topic A' Topic
	And 'Down' Icon is displayed to the '2. Topic B' Topic
	And 'Left' Icon is displayed to the '3. TopicC' Topic
	When User hover over 'Down' icon in '2. Topic B' topic
	When User Right clicks 'Down' icon in '2. Topic B' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'Hide Topics with this Icon' name in 'quick-filter' menu
	Then 'Topic B' topic is not displayed on Canvas
	And menu button with 'filter' name is displayed in 'status-missing-info' state on Overlay panel
	And 'Up' Icon is displayed to the '1. Topic A' Topic
	And 'Left' Icon is displayed to the '2. TopicC' Topic
	When User clicks on 'filter' button on the Overlay panel
	When User clicks button with 'remove-filter' name in 'filter' menu
	Then menu button with 'filter' name is not displayed on 'OverlayPanelPageElement' container
	And 'Up' Icon is displayed to the '1. Topic A' Topic
	And 'Down' Icon is displayed to the '2. Topic B' Topic
	And 'Left' Icon is displayed to the '3. TopicC' Topic

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-723] @Upd_Qase
Scenario: To_verify_the_topics_are_recounted_when_filter_is_applied
Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath                      |
		| auto_test_SRND.mmap | Renumber_Hidden_Filter_2.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And 'Up' Icon is displayed to the '1. Topic A' Topic
	And 'Down' Icon is displayed to the '2. Topic B' Topic
	And 'Left' Icon is displayed to the '3. TopicC' Topic
	When User hover over 'Down' icon in '2. Topic B' topic
	When User Right clicks 'Down' icon in '2. Topic B' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'quick-filter' name in 'topic-contextmenu' menu
	Then 'quick-filter' Menu is displayed to User
	When User clicks button with 'Show Topics with this Icon' name in 'quick-filter' menu
	Then '1. Topic A' topic is not displayed on Canvas
	Then '3. TopicC' topic is not displayed on Canvas
	And 'Down' Icon is displayed to the '1. Topic B' Topic
	And menu button with 'filter' name is displayed in 'status-missing-info' state on Overlay panel
	When User clicks on 'filter' button on the Overlay panel
	When User clicks button with 'remove-filter' name in 'filter' menu
	Then menu button with 'filter' name is not displayed on 'OverlayPanelPageElement' container
	And 'Up' Icon is displayed to the '1. Topic A' Topic
	And 'Down' Icon is displayed to the '2. Topic B' Topic
	And 'Left' Icon is displayed to the '3. TopicC' Topic

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-724] @Upd_Qase
Scenario: To_verify_the_topics_are_recounted_when_filter_is_applied_progress
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath                        |
		| auto_test_SRND.mmap | Recalculate_Hidder_filters.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And '25% done' Icon is displayed to the 'Topic A' Topic
	And '50% done' Icon is displayed to the 'Topic B' Topic
	And '75% done' Icon is displayed to the 'TopicC' Topic
	And 'topic_info_icon_calculated_property.svg' Icon with value '1.5' is displayed to the 'Central Topic' Topic infobox
	When User clicks 'Filter' button of side Toolbox
	Then 'PanelWithMenuButton' side panel with 'Filter' header is displayed to the User
	And 'Show' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	When User checks 'Complete (%): 25%' checkbox to 'Progress' group in 'General' section on Filter panel
	Then '25% done' Icon is displayed to the 'Topic A' Topic
	Then 'Topic B' topic is not displayed on Canvas
	Then 'Topic C' topic is not displayed on Canvas
	And menu button with 'filter' name is displayed in 'status-missing-info' state on Overlay panel
	And 'topic_info_icon_calculated_property.svg' Icon with value '0.25' is displayed to the 'Central Topic' Topic infobox
	When User unchecks 'Complete (%): 25%' checkbox to 'Progress' group in 'General' section on Filter panel
	Then '25% done' Icon is displayed to the 'Topic A' Topic
	And '50% done' Icon is displayed to the 'Topic B' Topic
	And '75% done' Icon is displayed to the 'TopicC' Topic
	Then menu button with 'filter' name is not displayed on 'OverlayPanelPageElement' container
	And 'topic_info_icon_calculated_property.svg' Icon with value '1.5' is displayed to the 'Central Topic' Topic infobox