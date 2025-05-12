@retry(2)
Feature: StickyNoteControlRight
Check Sticky Note functionality 

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2342] @Upd_Qase
Scenario: To_verify_that_Sticky_Note_topics_are_displayed_correctly_in_Web_app_if_Show_topic_controls_to_the_right_setting_is_applied
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath                |
		| auto_test_SRND.mmap | StickyNotesOnRight.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Sticky Note 2' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky Note 2' topic on Canvas
	When User Right clicks on 'Sticky Note 2' topic
	When User clicks button with 'topic-info-collapse-state' name in 'topic-contextmenu' menu
	Then 'Right' Icon is not displayed to the 'Sticky Note 2' Topic infobox
	Then 'Neutral' Icon is not displayed to the 'Sticky Note 2' Topic infobox
	Then 'Priority 2' Icon is not displayed to the 'Sticky Note 2' Topic infobox
	Then '50% done' Icon is not displayed to the 'Sticky Note 2' Topic infobox
	Then Three dots button is displayed in 'Sticky Note 2' Topic with X value '3' and Y value '3'
	When User Right clicks on 'Sticky Note 2' topic
	When User clicks button with 'Expand Info on Topic' name in 'topic-contextmenu' menu
	Then 'Right' Icon is displayed to the 'Sticky Note 2' Topic infobox
	Then 'Neutral' Icon is displayed to the 'Sticky Note 2' Topic infobox
	Then 'Priority 2' Icon is displayed to the 'Sticky Note 2' Topic infobox
	Then '50% done' Icon is displayed to the 'Sticky Note 2' Topic infobox

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2342] @Upd_Qase
Scenario: To_verify_that_Sticky_Note_topics_are_displayed_correctly_in_Web_app_if_Show_topic_controls_to_the_right_setting_is_not_applied
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath         |
		| auto_test_SRND.mmap | StickyNotes.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Sticky Note 2' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky Note 2' topic on Canvas
	When User Right clicks on 'Sticky Note 2' topic
	When User clicks button with 'topic-info-collapse-state' name in 'topic-contextmenu' menu
	Then 'Right' Icon is not displayed to the 'Sticky Note 2' Topic infobox
	Then 'Neutral' Icon is not displayed to the 'Sticky Note 2' Topic infobox
	Then 'Priority 2' Icon is not displayed to the 'Sticky Note 2' Topic infobox
	Then '50% done' Icon is not displayed to the 'Sticky Note 2' Topic infobox
	Then Three dots button is displayed in 'Sticky Note 2' Topic infobox
	When User Right clicks on 'Sticky Note 2' topic
	When User clicks button with 'Expand Info on Topic' name in 'topic-contextmenu' menu
	Then 'Right' Icon is displayed to the 'Sticky Note 2' Topic infobox
	Then 'Neutral' Icon is displayed to the 'Sticky Note 2' Topic infobox
	Then 'Priority 2' Icon is displayed to the 'Sticky Note 2' Topic infobox
	Then '50% done' Icon is displayed to the 'Sticky Note 2' Topic infobox