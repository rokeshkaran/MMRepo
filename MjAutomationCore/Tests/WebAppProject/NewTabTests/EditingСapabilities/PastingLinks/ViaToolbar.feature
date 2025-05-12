@retry(2)
Feature: ViaToolbar
pasting links in topic via toolbar

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath          |
		| auto_test_SRND.mmap | ContentNotes.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	When User checks 'Link Titles' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Link Titles' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	When User clicks 'Main Topic 4' topic on Canvas
	When User clicks 'Notes' button of side Toolbox
	When User clicks Notes input field
	When User presses the Ctrl_A combination key on the keyboard
	When User presses the Ctrl_C combination key on the keyboard

@MindManager @EditingCapabilities @PastingLinks @Toolbar @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1354] @Upd_Qase
Scenario: To_verify_that_all_detected_URLs_in_a_pasted_text_are_added_as_links_attached_to_the_topic_has_no_custom_text_via_toolbar
	When User clicks 'Floating Topic' topic on Canvas
	When User clicks 'Paste' button on Tools panel
	Then 'http://www.google.com link' topic is displayed on Canvas
	Then 'google.com' Link title is displayed to the 'http://www.google.com link' topic infobox

@MindManager @EditingCapabilities @PastingLinks @Toolbar @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1355] @Upd_Qase
Scenario: To_verify_that_all_detected_URLs_in_a_pasted_text_are_added_as_links_attached_to_the_topic_has_custom_text_via_toolbar
	When User clicks 'Main Topic 3' topic on Canvas
	When User clicks 'Paste' button on Tools panel
	Then 'google.com' Link title is displayed to the 'Main Topic 3' topic infobox

@MindManager @EditingCapabilities @PastingLinks @Toolbar @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1374] @Upd_Qase
Scenario: To_verify_that_all_detected_URLs_in_a_pasted_text_are_added_as_links_attached_to_the_multiple_topics
	When User clicks 'Main Topic 1' topic on Canvas
	When User selects first 'Floating Topic' and second 'Subtopic' topic on Canvas
	When User clicks 'Paste' button on Tools panel
	Then 'google.com' Link title is displayed to the 'http://www.google.com link' topic infobox

@MindManager @EditingCapabilities @PastingLinks @Toolbar @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1383] @Upd_Qase @JIRA[MMCV-9356]
Scenario: To_verify_that_pasted_text_contains_integrate_with_text_they_are_added_as_links_to_topic
	Then integrated links is copied to the clipboard
	When User clicks Notes input field
	When User presses the Ctrl_A combination key on the keyboard
	When User presses the 'Delete' key on the keyboard
	When User clicks Notes input field
	When User presses the Ctrl_V combination key on the keyboard
	When User clicks Notes input field
	When User presses the Ctrl_A combination key on the keyboard
	When User presses the Ctrl_C combination key on the keyboard
	When User clicks 'Main Topic 3' topic on Canvas
	When User clicks 'Paste' button on Tools panel
	Then 'google.com' Link title is displayed to the 'Main Topic 3' topic infobox