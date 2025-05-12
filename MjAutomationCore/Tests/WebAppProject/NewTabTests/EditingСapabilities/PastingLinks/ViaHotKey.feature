@retry(2)
Feature: ViaHotKey
pasting links in topic

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'settings' name in 'file' menu
	And User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	And 'Link Titles' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User checks 'Link Titles' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Link Titles' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User

@MindManager @EditingCapabilities @PastingLinks @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1345] @Upd_Qase @JIRA[MMCV-9356,MMCV-8442]
Scenario: To_verify_that_all_detected_URLs_in_a_pasted_text_are_added_as_links_attached_to_the_topic_has_no_custom_text
	When User clicks 'FT3' topic on Canvas
	And User waits '500' miliseconds
	And User triple clicks to the 'FT3' topic text on Canvas
	And User enters 'here is some random text that has been copied to the clipboard that also contains a link http://www.google.com, but also there is more text with another link http://www.mindmanager.com' text to the topic on Canvas
	And User clicks 'MT3' topic on Canvas
	And User waits '500' miliseconds
	And User clicks 'here is some random text that has been copied to the clipboard that also contains a link http://www.google.com, but also there is more text with another link http://www.mindmanager.com' topic on Canvas
	Then 'here is some random text that has been copied to the clipboard that also contains a link http://www.google.com, but also there is more text with another link http://www.mindmanager.com' is outlined with a blue circuit
	When User waits '500' miliseconds
	And User triple clicks to the 'here is some random text that has been copied to the clipboard that also contains a link http://www.google.com, but also there is more text with another link http://www.mindmanager.com' topic text on Canvas
	And User presses the Ctrl_C combination key on the keyboard
	And User presses the 'Delete' key on the keyboard
	And User waits '500' miliseconds
	And User clicks 'Main Topic' topic on Canvas
	And User presses the Ctrl_V combination key on the keyboard
	And User waits '500' miliseconds
	Then 'google.com' Link title is displayed to the 'here is some random text that has been copied to the clipboard that also contains a link http://www.google.com, but also there is more text with another link http://www.mindmanager.com' topic infobox
	And 'mindmanager.com' Link title is displayed to the 'here is some random text that has been copied to the clipboard that also contains a link http://www.google.com, but also there is more text with another link http://www.mindmanager.com' topic infobox
	When User clicks on 'google.com' Link title displayed to the 'here is some random text that has been copied to the clipboard that also contains a link http://www.google.com, but also there is more text with another link http://www.mindmanager.com' topic infobox
	And User switches to '1' tab
	Then page url is 'https://www.google.com'
	When User switches to '0' tab
	And User clicks on 'mindmanager.com' Link title displayed to the 'here is some random text that has been copied to the clipboard that also contains a link http://www.google.com, but also there is more text with another link http://www.mindmanager.com' topic infobox
	And User switches to '2' tab
	Then page url is 'https://www.mindmanager.com/en/'

@MindManager @EditingCapabilities @PastingLinks @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1347] @Upd_Qase @JIRA[MMCV-9356,MMCV-8442]
Scenario: To_verify_that_all_the_detected_URLs_in_a_pasted_text_are_added_as_links_attached_to_the_topics
	When User clicks 'Main Topic' topic on Canvas
	And User waits '500' miliseconds
	And User triple clicks to the 'Main Topic' topic text on Canvas
	And User enters 'here is some random text that has been copied to the clipboard that also contains a link http://www.google.com, but also there is more text with another link http://www.mindmanager.com' text to the topic on Canvas
	And User clicks 'MT3' topic on Canvas
	And User waits '500' miliseconds
	And User clicks 'here is some random text that has been copied to the clipboard that also contains a link http://www.google.com, but also there is more text with another link http://www.mindmanager.com' topic on Canvas
	Then 'here is some random text that has been copied to the clipboard that also contains a link http://www.google.com, but also there is more text with another link http://www.mindmanager.com' is outlined with a blue circuit
	When User waits '500' miliseconds
	And User triple clicks to the 'here is some random text that has been copied to the clipboard that also contains a link http://www.google.com, but also there is more text with another link http://www.mindmanager.com' topic text on Canvas
	And User presses the Ctrl_C combination key on the keyboard
	And User presses the 'Delete' key on the keyboard
	And User waits '500' miliseconds
	And User selects first 'FT2' and second 'FT3' topic on Canvas
	And User waits '500' miliseconds
	And User presses the Ctrl_V combination key on the keyboard
	And User waits '500' miliseconds
	Then 'google.com' Link title is displayed to the 'FT2' topic infobox
	And 'mindmanager.com' Link title is displayed to the 'FT2' topic infobox
	When User clicks 'MT3' topic on Canvas
	Then 'google.com' Link title is displayed to the 'FT3' topic infobox
	And 'mindmanager.com' Link title is displayed to the 'FT3' topic infobox
	When User clicks on 'google.com' Link title displayed to the 'FT2' topic infobox
	And User switches to '1' tab
	Then page url is 'https://www.google.com'
	When User switches to '0' tab
	And User clicks on 'mindmanager.com' Link title displayed to the 'FT2' topic infobox
	And User switches to '2' tab
	Then page url is 'https://www.mindmanager.com/en/'
	When User switches to '0' tab
	And User clicks on 'google.com' Link title displayed to the 'FT3' topic infobox
	And User switches to '3' tab
	Then page url is 'https://www.google.com'
	When User switches to '0' tab
	And User clicks on 'mindmanager.com' Link title displayed to the 'FT3' topic infobox
	And User switches to '4' tab
	Then page url is 'https://www.mindmanager.com/en/'

@MindManager @EditingCapabilities @PastingLinks @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1353] @Upd_Qase @JIRA[MMCV-9356,MMCV-8442]
Scenario: To_verify_that_all_the_detected_URLs_in_a_pasted_text_are_added_as_links_attached_to_the_topic_has_custom_text
	When User clicks 'FT3' topic on Canvas
	And User waits '500' miliseconds
	And User triple clicks to the 'FT3' topic text on Canvas
	And User enters 'here is some random text that has been copied to the clipboard that also contains a link http://www.google.com, but also there is more text with another link http://www.mindmanager.com' text to the topic on Canvas
	And User clicks 'MT3' topic on Canvas
	And User waits '500' miliseconds
	And User clicks 'here is some random text that has been copied to the clipboard that also contains a link http://www.google.com, but also there is more text with another link http://www.mindmanager.com' topic on Canvas
	Then 'here is some random text that has been copied to the clipboard that also contains a link http://www.google.com, but also there is more text with another link http://www.mindmanager.com' is outlined with a blue circuit
	When User waits '500' miliseconds
	And User triple clicks to the 'here is some random text that has been copied to the clipboard that also contains a link http://www.google.com, but also there is more text with another link http://www.mindmanager.com' topic text on Canvas
	And User presses the Ctrl_C combination key on the keyboard
	And User presses the 'Delete' key on the keyboard
	And User waits '500' miliseconds
	And User clicks 'MT1' topic on Canvas
	And User presses the Ctrl_V combination key on the keyboard
	And User waits '500' miliseconds
	Then 'google.com' Link title is displayed to the 'MT1' topic infobox
	And 'mindmanager.com' Link title is displayed to the 'MT1' topic infobox
	When User clicks on 'google.com' Link title displayed to the 'MT1' topic infobox
	And User switches to '1' tab
	Then page url is 'https://www.google.com'
	When User switches to '0' tab
	And User clicks on 'mindmanager.com' Link title displayed to the 'MT1' topic infobox
	And User switches to '2' tab
	Then page url is 'https://www.mindmanager.com/en/'

@MindManager @EditingCapabilities @PastingLinks @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1382] @Upd_Qase @JIRA[MMCV-9356,MMCV-8442]
Scenario: To_verify_that_if_pasted_text_contains_the_links_integrated_with_text_they_are_added_as_links_attached_to_the_topic
	Then integrated links is copied to the clipboard
	When User waits '500' miliseconds
	And User clicks 'Main Topic' topic on Canvas
	And User presses the Ctrl_V combination key on the keyboard
	And User waits '500' miliseconds
	Then 'Google' Link title is displayed to the 'here are my Google and Microsoft links to be copied to Cloud' topic infobox
	And 'Microsoft' Link title is displayed to the 'here are my Google and Microsoft links to be copied to Cloud' topic infobox
	When User clicks on 'Google' Link title displayed to the 'here are my Google and Microsoft links to be copied to Cloud' topic infobox
	And User switches to '1' tab
	Then page url is 'https://www.google.com'
	When User switches to '0' tab
	And User clicks on 'Microsoft' Link title displayed to the 'here are my Google and Microsoft links to be copied to Cloud' topic infobox
	And User switches to '2' tab
	Then page url is 'https://www.microsoft.com/en-us/'

@MindManager @EditingCapabilities @PastingLinks @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1485] @Upd_Qase
Scenario: To_verify_that_if_pasted_text_contains_the_links_without_http_they_are_added_as_links_attached_to_the_topic
	Then 'www.youtube.com' text is copied to the clipboard
	When User clicks 'Main Topic' topic on Canvas
	And User presses the Ctrl_V combination key on the keyboard
	And User waits '500' miliseconds
	Then 'www.youtube.com' topic is displayed on Canvas
	And 'youtube.com' Link title is displayed to the 'www.youtube.com' topic infobox
	When User clicks on 'youtube.com' Link title displayed to the 'www.youtube.com' topic infobox
	And User switches to '1' tab
	Then page url is 'https://www.youtube.com'