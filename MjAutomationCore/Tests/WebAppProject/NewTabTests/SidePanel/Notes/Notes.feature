@retry(2)
Feature: Notes
Check that it is possible to edit Notes

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath          |
		| auto_test_SRND.mmap | ContentNotes.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @SidePanel @Notes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-799] @Upd_Qase
Scenario: Edit_Notes_plain_text
	When User clicks Notes icon in 'Floating Topic' topic infobox
	Then 'PanelByName' side panel with 'Notes' header is displayed to the User
	When User Clear notes input field
	When User clicks Notes input field
	When User enters 'Note#1' text to input note field on Notes panel
	Then 'Note#1' text is dipslayed in Note field on Notes panel
	When User clicks by coordinates '200' and '200' on Canvas
	When User clicks Notes icon in 'Floating Topic' topic infobox
	Then 'Note#1' text is dipslayed in Note field on Notes panel

@MindManager @SidePanel @Notes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-799] @Upd_Qase
Scenario: Edit_Notes_edit_image_and_text
	When User clicks 'Central Topic' topic on Canvas
	When User clicks 'Notes' button of side Toolbox
	Then plain text is displayed in notes textbox
	Then 'audi.jpg' image is displayed in notes textbox
	When User Clear notes input field
	When User clicks Notes input field
	When User enters '2000' characters to input note field on Notes panel
	When User clicks on 'note-icon-picture' button in note style section 'note-insert' of 'PanelByName' side panel with 'Notes' header
	When User uploads 'FruitsOutlineIcon.png' file through input type file to note field
	Then 'FruitsOutlineIcon.png' image is displayed in notes textbox
	When User clicks by coordinates '200' and '200' on Canvas
	When User clicks Notes icon in 'Central Topic' topic infobox
	Then User checks text to note field on Notes panel
	Then 'FruitsOutlineIcon.png' image is displayed in notes textbox
	Then 'audi.jpg' image is not displayed in notes textbox

@MindManager @SidePanel @Notes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-798] @Upd_Qase
Scenario: Verify_note_content_contains_plain_text_for_floating_topic
	When User clicks 'Floating Topic' topic on Canvas
	When User clicks 'Notes' button of side Toolbox
	Then width of the notes side panel is '279'
	Then text is displayed as 'break-word' wrapped in notes textbox
	When User remembers location of image 'audi.jpg' in notes textbox
	When User scrolls the note textbox down
	Then 'audi.jpg' image has changed location by Y axis in notes textbox
	When User remembers location of image 'audi.jpg' in notes textbox
	When User scrolls the note textbox up
	Then 'audi.jpg' image has changed location by Y axis in notes textbox
	When notes textbox is increase by width X axis '-35' and Y axis '-300'
	Then width of the notes side panel is '314'
	
@MindManager @SidePanel @Notes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-798] @Upd_Qase
Scenario: Verify_note_content_contains_plain_text_and_image_for_central_topic
	When User clicks 'Central Topic' topic on Canvas
	When User clicks 'Notes' button of side Toolbox
	Then plain text is displayed in notes textbox
	Then 'audi.jpg' image is displayed in notes textbox

@MindManager @SidePanel @Notes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-798] @Upd_Qase
Scenario: Verify_note_content_contains_bulleted_list_for_main_topic
	When User clicks 'Main Topic 1' topic on Canvas
	When User clicks 'Notes' button of side Toolbox
	Then bulleted list 'disc' is displayed in notes textbox

@MindManager @SidePanel @Notes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-798] @Upd_Qase
Scenario: Verify_note_content_contains_table_for_callout_topic
	When User clicks 'CALLOUT' topic on Canvas
	When User clicks 'Notes' button of side Toolbox
	Then a table 'collapse' is displayed in notes textbox
	Then notes textbox contains vertical scroll bars
	Then notes textbox contains horizontal scroll bars
	When User remembers location of image 'audi.jpg' in notes textbox
	When User scrolls the note textbox down
	Then 'audi.jpg' image has changed location by Y axis in notes textbox
	When User remembers location of image 'audi.jpg' in notes textbox
	When User scrolls the note textbox up
	Then 'audi.jpg' image has changed location by Y axis in notes textbox
	When User remembers location of image 'audi.jpg' in notes textbox
	When User scrolls the note textbox to right
	Then 'audi.jpg' image has changed location by X axis in notes textbox
	Then width of the notes side panel is '279'
	When notes textbox is increase by width X axis '-35' and Y axis '-300'
	Then width of the notes side panel is '314'

@MindManager @SidePanel @Notes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-798] @Upd_Qase @JIRA[MMCV-8648]
Scenario: Verify_note_content_contains_a_hyperlink_and_link_to_central_topic_for_subtopic
	When User clicks 'Subtopic' topic on Canvas
	When User clicks 'Notes' button of side Toolbox
	Then hyperlink 'https://www.lipsum.com/' is displayed in notes textbox
	Then hyperlink with topic name 'Central Topic' is displayed in notes textbox

@MindManager @SidePanel @Notes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-798] @Upd_Qase
Scenario: Verify_main_topic_does_not_contains_a_note
	When User clicks 'Main Topic 3' topic on Canvas
	When User clicks 'Notes' button of side Toolbox
	Then plain text is not displayed in notes textbox