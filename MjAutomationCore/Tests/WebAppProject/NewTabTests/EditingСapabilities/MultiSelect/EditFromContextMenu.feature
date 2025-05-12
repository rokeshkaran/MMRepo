@retry(2)
Feature: EditFromContextMenu
Verify the task info can be edited via context menu

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @NewTab @ContextMenu @MultiSelect @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-467] @Upd_Qase @JIRA[MMCV-10053]
Scenario: Check_that_it_is_possible_to_edit_the_topic_progress_on_some_topics_at_the_same_time_from_the_context_menu
	When User selects first 'FT1' and second 'MT2' topic on Canvas
	And User Right clicks '25% done' icon in 'FT1' topic
	And User clicks icon button with '50% done' name in 'topic-contextmenu' menu
	Then '50% done' Icon is displayed to the 'FT1' Topic
	And '50% done' Icon is displayed to the 'MT2' Topic

@MindManager @NewTab @ContextMenu @MultiSelect @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-468] @Upd_Qase @JIRA[MMCV-10053]
Scenario: Check_that_it_is_possible_to_edit_the_topic_priority_on_some_topics_at_the_same_time_from_the_context_menu
	When User selects first 'FT1' and second 'MT2' topic on Canvas
	And User Right clicks 'Priority 5' icon in 'FT1' topic
	And User clicks icon button with 'Priority 2' name in 'topic-contextmenu' menu
	Then 'Priority 2' Icon is displayed to the 'FT1' Topic
	And 'Priority 2' Icon is displayed to the 'MT2' Topic