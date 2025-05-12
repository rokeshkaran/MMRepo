@retry(2)
Feature: ViaContextMenu
pasting links in topic via ContextMenu

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
	And User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	When User checks 'Link Titles' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Link Titles' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	When User clicks 'Main Topic 4' topic on Canvas
	And User clicks 'Notes' button of side Toolbox
	And User clicks Notes input field
	And User presses the Ctrl_A combination key on the keyboard
	And User presses the Ctrl_C combination key on the keyboard

@MindManager @EditingCapabilities @PastingLinks @ContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1359] @Upd_Qase @JIRA[MMCV-8450]
Scenario: To_verify_that_all_detected_URLs_in_a_pasted_text_are_added_as_links_attached_to_the_topic_has_no_custom_text_via_context_menu
	When User Right clicks on 'Floating Topic' topic
	And User clicks button with 'Paste' name in 'topic-contextmenu' menu
	Then 'http://www.google.com link' topic is displayed on Canvas
	And 'google.com' Link title is displayed to the 'http://www.google.com link' topic infobox

@MindManager @EditingCapabilities @PastingLinks @ContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1360] @Upd_Qase @JIRA[MMCV-8450]
Scenario: To_verify_that_all_detected_URLs_in_a_pasted_text_are_added_as_links_attached_to_the_topic_has_custom_text_via_context_menu
	When User Right clicks on 'Main Topic 1' topic
	And User clicks button with 'Paste' name in 'topic-contextmenu' menu
	Then 'google.com' Link title is displayed to the 'Main Topic 1' topic infobox

@MindManager @EditingCapabilities @PastingLinks @ContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1377] @Upd_Qase
Scenario: Verify_that_all_detected_URLs_in_a_pasted_text_are_added_as_links_attached_to_a_new_topic_when_no_topic_is_selected_via_context_menu
	When User right-clicks by coordinates '-20' and '-30' on Canvas
	Then 'blank-contextmenu' Menu is displayed to User
	When User clicks button with 'paste' name in 'blank-contextmenu' menu
	Then 'http://www.google.com link' topic is displayed on Canvas
	And 'google.com' Link title is displayed to the 'http://www.google.com link' topic infobox

@MindManager @EditingCapabilities @PastingLinks @ContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1384] @Upd_Qase @JIRA[MMCV-8450]
Scenario: To_verify_that_pasted_text_contains_integrate_with_text_they_are_added_as_links_to_topic
	Then integrated links is copied to the clipboard
	When User clicks Notes input field
	And User presses the Ctrl_A combination key on the keyboard
	And User presses the 'Delete' key on the keyboard
	And User clicks Notes input field
	And User presses the Ctrl_V combination key on the keyboard
	And User clicks Notes input field
	And User presses the Ctrl_A combination key on the keyboard
	And User presses the Ctrl_C combination key on the keyboard
	And User Right clicks on 'Main Topic 3' topic
	And User clicks button with 'Paste' name in 'topic-contextmenu' menu
	Then 'google.com' Link title is displayed to the 'Main Topic 3' topic infobox