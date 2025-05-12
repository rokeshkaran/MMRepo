@retry(2)
Feature: Search
	Verification Search in Snap panel in web app

Background: Pre-condition
	Given '1' User uploads following files to '/' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given '1' User is logged into MindManager web app via Api
	When '1' User upload capture item via Api
		| Type       | Source           | Text                          | Link                    | Note         | Item | File                               |
		| link       | MindManager Snap | automation_bookmark_1#_SRND   | https://www.google.com/ |              |      |                                    |
		| link       | MindManager Snap | automation_bookmark_2#_SRND   | https://www.google.com/ |              |      |                                    |
		| attachment | MindManager Snap | image_file_attachment_1#_SRND |                         |              |      | FruitImages.jpg                    |
		| attachment | MindManager Snap | image_file_attachment_2#_SRND |                         |              |      | FruitImages.jpg                    |
		| attachment | MindManager Snap | text_file_attachment_1#_SRND  |                         |              |      | Automatic License Provisioning.txt |
		| attachment | MindManager Snap | text_file_attachment_2#_SRND  |                         |              |      | Automatic License Provisioning.txt |
		| mappart    | MindManager Snap | automation_mappart_1#_SRND    |                         |              |      | Business profile info.mmap         |
		| mappart    | MindManager Snap | automation_mappart_2#_SRND    |                         |              |      | Business profile info.mmap         |
		| text       | MindManager Snap | test_notes_1#_SRND            |                         | MSNAP text 1 |      |                                    |
		| text       | MindManager Snap | test_notes_2#_SRND            |                         | MSNAP text 2 |      |                                    |
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User

@Snap @Search @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-38,MSNAP-66] @Upd_Qase
Scenario: To_verify_that_user_can_search_for_specific_text_with_two_string
	Then 'Open Search' button is displayed on Snap panel
	When User clicks 'Open Search' button on Snap panel
	Then 'Search' placeholder is displayed in 'mm-capture-queue-search-input' enter field
	Then 'mm-capture-queue-search-input' input filed is displayed in 'CaptureQueueHeaderElement' container
	When User clicks on 'mm-capture-queue-search-input' field of 'CaptureQueueHeaderElement' container
	Then search icon is not displayed in Search field on Span panel
	When User enters 'bo' value in 'mm-capture-queue-search-input' field of 'CaptureQueueHeaderElement' container
	Then following capture items are displayed in Snap panel:
		| captureItemTitle              |
		| automation_bookmark_1#_SRND   |
		| automation_bookmark_2#_SRND   |
		| image_file_attachment_1#_SRND |
		| image_file_attachment_2#_SRND |
		| text_file_attachment_1#_SRND  |
		| text_file_attachment_2#_SRND  |
		| automation_mappart_1#_SRND    |
		| automation_mappart_2#_SRND    |
		| test_notes_1#_SRND            |
		| test_notes_2#_SRND            |
	When User presses the 'Enter' key on the keyboard
	Then 'bo' text is highlighted in the following capture items in Snap panel:
		| captureItemTitle            |
		| automation_bookmark_1#_SRND |
		| automation_bookmark_2#_SRND |
	Then clear button is visible in 'Search' field on Snap panel
	When User clicks on clear button on Snap panel
	Then 'Search' placeholder is displayed in 'mm-capture-queue-search-input' enter field

@Snap @Search @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-38,MSNAP-66] @Upd_Qase
Scenario: To_verify_that_user_can_search_for_specific_text_with_three_string
	Then 'Open Search' button is displayed on Snap panel
	When User clicks 'Open Search' button on Snap panel
	When User enters 'note' value in 'mm-capture-queue-search-input' field of 'CaptureQueueHeaderElement' container
	Then 'note' text is highlighted in the following capture items in Snap panel:
		| captureItemTitle   |
		| test_notes_1#_SRND |
		| test_notes_2#_SRND |
	When User clicks on clear button on Snap panel
	When User drags and drops 'automation_mappart_2#_SRND' capture item from Snap panel in 'ImageTopic2' topic
	Then 'profile info' topic is displayed on Canvas
	Then 'Appropriate standards' subtopic is displayed on Canvas
	Then 'Benchmark' subtopic is displayed on Canvas

@Snap @Search @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-39,MSNAP-67] @Upd_Qase
Scenario: To_verify_that_user_can_search_for_capture_attributes
	When User clicks 'Open Search' button on Snap panel
	When User enters '20' value in 'mm-capture-queue-search-input' field of 'CaptureQueueHeaderElement' container
	When User presses the 'Enter' key on the keyboard
	Then following capture items are displayed in Snap panel:
		| captureItemTitle              |
		| automation_bookmark_1#_SRND   |
		| automation_bookmark_2#_SRND   |
		| image_file_attachment_1#_SRND |
		| image_file_attachment_2#_SRND |
		| text_file_attachment_1#_SRND  |
		| text_file_attachment_2#_SRND  |
		| automation_mappart_1#_SRND    |
		| automation_mappart_2#_SRND    |
		| test_notes_1#_SRND            |
		| test_notes_2#_SRND            |
	When User enters 'MSNAP' value in 'mm-capture-queue-search-input' field of 'CaptureQueueHeaderElement' container
	Then following capture items are displayed in Snap panel:
		| captureItemTitle   |
		| test_notes_1#_SRND |
		| test_notes_2#_SRND |
	Then 'MSNAP' text is not highlighted in search results of capture items:
		| captureItemTitle   |
		| test_notes_1#_SRND |
		| test_notes_2#_SRND |
	When User enters 'google' value in 'mm-capture-queue-search-input' field of 'CaptureQueueHeaderElement' container
	Then following capture items are displayed in Snap panel:
		| captureItemTitle            |
		| automation_bookmark_1#_SRND |
		| automation_bookmark_2#_SRND |
	Then 'google' text is not highlighted in search results of capture items:
		| captureItemTitle            |
		| automation_bookmark_1#_SRND |
		| automation_bookmark_2#_SRND |
	When User enters 'fruit' value in 'mm-capture-queue-search-input' field of 'CaptureQueueHeaderElement' container
	Then following capture items are displayed in Snap panel:
		| captureItemTitle              |
		| image_file_attachment_1#_SRND |
		| image_file_attachment_2#_SRND |
	Then 'fruit' text is not highlighted in search results of capture items:
		| captureItemTitle              |
		| image_file_attachment_1#_SRND |
		| image_file_attachment_2#_SRND |