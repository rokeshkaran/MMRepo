@retry(2)
Feature: FilterSettingForShow
Check Filters settings

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | FilterMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'CT' topic on Canvas

@MindManager @Left_Side_Menu_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-699] @Upd_Qase
Scenario: Check_the_default_filters_settings
	Then 'CT' topic is displayed on Canvas
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	Then 'Count Subtopics' checkbox is checked in the 'General' section of 'Settings' screen
	Then 'Fade Non-Matching Topics' checkbox is unchecked in the 'Filters' section of 'Settings' screen
	Then 'Strict Criteria Matching' checkbox is unchecked in the 'Filters' section of 'Settings' screen

@MindManager @Left_Side_Menu_Panel @App_QA @App_Staging @App_Prod @Qase[WEB-700] @Cleanup @Upd_Qase
Scenario: Check_Count_Subtopics_option
	When User clicks 'CT' topic on Canvas
	Then 'CT' is outlined with a blue circuit
	Then '3' subtopics are displayed on Canvas
	Then User set zoom level to '32' via the side tool bar
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	Then 'Count Subtopics' checkbox is checked in the 'General' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then Web Editor page is displayed to the User
	Then '-' collapsed subtopic of 'MT' topic are displayed to User
	When User clicks 'MT' topic collapse button
	Then '1' collapsed subtopic of 'MT' topic are displayed to User
	When User clicks the value '1' to expand subtopics
	Then '-' collapsed subtopic of 'MT' topic are displayed to User
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	When User unchecks 'Count Subtopics' checkbox in the 'General' section of 'Settings' screen
	Then 'Count Subtopics' checkbox is unchecked in the 'General' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then '-' collapsed subtopic of 'MT' topic are displayed to User
	When User clicks 'MT' topic collapse button
	Then '+' collapsed subtopic of 'MT' topic are displayed to User

@MindManager @Left_Side_Menu_Panel @App_QA @App_Staging @App_Prod @Qase[WEB-701] @Cleanup @Upd_Qase
Scenario: Fade_nonmatching_topics_Fade_NonMatching_Topics_checkbox_is_checked
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	When User checks 'Fade Non-Matching Topics' checkbox in the 'Filters' section of 'Settings' screen
	Then 'Fade Non-Matching Topics' checkbox is checked in the 'Filters' section of 'Settings' screen
	When User clicks Close button in the top right corner on 'Settings' screen
	When User clicks 'Filter' button of side Toolbox
	When User checks 'Priority 1' checkbox to 'Priority' group in 'General' section on Filter panel
	When User checks 'Priority 3' checkbox to 'Priority' group in 'General' section on Filter panel
	When User checks 'Discuss' checkbox to 'Flags' group in 'General' section on Filter panel
	Then 'Main Topic' topic is displayed on Canvas
	Then 'CT' is displayed with at 50 percent opacity on Canvas
	Then 'Subtopic' is displayed with at 50 percent opacity on Canvas
	Then 'Callout' is displayed with at 50 percent opacity on Canvas

@MindManager @Left_Side_Menu_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-701] @Upd_Qase
Scenario: Fade_nonmatching_topics_Fade_NonMatching_Topics_checkbox_is_unchecked
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Fade Non-Matching Topics' checkbox is unchecked in the 'Filters' section of 'Settings' screen
	When User checks 'Fade Non-Matching Topics' checkbox in the 'Filters' section of 'Settings' screen
	Then 'Fade Non-Matching Topics' checkbox is checked in the 'Filters' section of 'Settings' screen
	When User clicks Close button in the top right corner on 'Settings' screen
	When User clicks 'Filter' button of side Toolbox
	When User checks 'Priority 1' checkbox to 'Priority' group in 'General' section on Filter panel
	When User checks 'Priority 3' checkbox to 'Priority' group in 'General' section on Filter panel
	When User checks 'Discuss' checkbox to 'Flags' group in 'General' section on Filter panel
	Then 'CT' topic is displayed on Canvas
	Then 'Main Topic' topic is displayed on Canvas
	Then 'Subtopic' is displayed with at 50 percent opacity on Canvas
	Then 'Callout' is displayed with at 50 percent opacity on Canvas

@MindManager @Left_Side_Menu_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-702] @Upd_Qase
Scenario: Check_Strict_Criteria_Matching_checked_Icons
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	When User unchecks 'Fade Non-Matching Topics' checkbox in the 'Filters' section of 'Settings' screen
	Then 'Fade Non-Matching Topics' checkbox is unchecked in the 'Filters' section of 'Settings' screen
	When User checks 'Strict Criteria Matching' checkbox in the 'Filters' section of 'Settings' screen
	Then 'Strict Criteria Matching' checkbox is checked in the 'Filters' section of 'Settings' screen
	When User clicks Close button in the top right corner on 'Settings' screen
	When User clicks 'Filter' button of side Toolbox
	When User checks 'Priority 1' checkbox to 'Priority' group in 'General' section on Filter panel
	When User checks 'Priority 3' checkbox to 'Priority' group in 'General' section on Filter panel
	When User checks 'Discuss' checkbox to 'Flags' group in 'General' section on Filter panel
	Then 'CT' topic is displayed on Canvas
	Then 'Main Topic' topic is not displayed on Canvas
	Then 'FT' topic is not displayed on Canvas
	When User clicks Menu button of Filter panel
	When User clicks 'Clear All' item in 'power-filter' dropdown menu
	When User checks 'Resource #1' checkbox to 'Resources' group in 'General' section on Filter panel
	When User checks 'Resource #2' checkbox to 'Resources' group in 'General' section on Filter panel
	Then 'FT' topic is not displayed on Canvas
	Then 'Main Topic' topic is displayed with '1' opacity on Canvas

@MindManager @Left_Side_Menu_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-703] @Upd_Qase
Scenario: Check_Strict_Criteria_Matching_unchecked_Icons
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	When User checks 'Fade Non-Matching Topics' checkbox in the 'Filters' section of 'Settings' screen
	Then 'Fade Non-Matching Topics' checkbox is checked in the 'Filters' section of 'Settings' screen
	Then 'Strict Criteria Matching' checkbox is unchecked in the 'Filters' section of 'Settings' screen
	When User clicks Close button in the top right corner on 'Settings' screen
	When User clicks 'Filter' button of side Toolbox
	When User checks 'Priority 1' checkbox to 'Priority' group in 'General' section on Filter panel
	When User checks 'Priority 3' checkbox to 'Priority' group in 'General' section on Filter panel
	When User checks 'Discuss' checkbox to 'Flags' group in 'General' section on Filter panel
	Then 'Main Topic' topic is displayed on Canvas
	Then 'CT' is displayed with at 50 percent opacity on Canvas
	Then 'Subtopic' is displayed with at 50 percent opacity on Canvas
	Then 'Callout' is displayed with at 50 percent opacity on Canvas
	When User clicks Menu button of Filter panel
	When User clicks 'Clear All' item in 'power-filter' dropdown menu
	When User checks 'Resource #1' checkbox to 'Resources' group in 'General' section on Filter panel
	When User checks 'Resource #2' checkbox to 'Resources' group in 'General' section on Filter panel
	Then 'CT' is displayed with at 50 percent opacity on Canvas
	Then 'FT' is displayed with at 50 percent opacity on Canvas
	Then 'Main Topic' topic is displayed with '1' opacity on Canvas

@MindManager @Left_Side_Menu_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-702] @Upd_Qase
Scenario: Check_Strict_Criteria_Matching_resources_checked
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	When User checks 'Fade Non-Matching Topics' checkbox in the 'Filters' section of 'Settings' screen
	Then 'Fade Non-Matching Topics' checkbox is checked in the 'Filters' section of 'Settings' screen
	When User checks 'Strict Criteria Matching' checkbox in the 'Filters' section of 'Settings' screen
	Then 'Strict Criteria Matching' checkbox is checked in the 'Filters' section of 'Settings' screen
	When User clicks Close button in the top right corner on 'Settings' screen
	When User clicks 'Filter' button of side Toolbox
	When User checks 'Resource #1' checkbox to 'Resources' group in 'General' section on Filter panel
	When User checks 'Resource #2' checkbox to 'Resources' group in 'General' section on Filter panel
	Then 'Main Topic' topic is displayed on Canvas
	Then 'Resource #1' resource is displayed in 'Main Topic' topic
	Then 'Resource #2' resource is displayed in 'Main Topic' topic
	Then 'CT' is displayed with at 50 percent opacity on Canvas
	Then 'Subtopic' is displayed with at 50 percent opacity on Canvas
	Then 'Callout' is displayed with at 50 percent opacity on Canvas

@MindManager @Left_Side_Menu_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-703] @Cleanup @Upd_Qase
Scenario: Check_Strict_Criteria_Matching_resources_unchecked
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	When User checks 'Fade Non-Matching Topics' checkbox in the 'Filters' section of 'Settings' screen
	Then 'Fade Non-Matching Topics' checkbox is checked in the 'Filters' section of 'Settings' screen
	Then 'Strict Criteria Matching' checkbox is unchecked in the 'Filters' section of 'Settings' screen
	When User clicks Close button in the top right corner on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	When User clicks 'Filter' button of side Toolbox
	When User checks 'Resource #1' checkbox to 'Resources' group in 'General' section on Filter panel
	When User checks 'Resource #2' checkbox to 'Resources' group in 'General' section on Filter panel
	Then 'Main Topic' topic is displayed on Canvas
	Then 'Subtopic' subtopic is displayed on Canvas
	Then 'Callout' callout is displayed on Canvas
	Then 'Resource #1' resource is displayed in 'Main Topic' topic
	Then 'Resource #2' resource is displayed in 'Main Topic' topic
	Then 'Resource #2' resource is displayed in 'Subtopic' topic
	Then 'Resource #1' resource is displayed in 'Callout' topic
	Then 'CT' is displayed with at 50 percent opacity on Canvas