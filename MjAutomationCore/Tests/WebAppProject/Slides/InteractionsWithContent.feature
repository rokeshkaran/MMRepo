@retry(2)
Feature: InteractionsWithContent
Expand and Collapse subtopic in slide mode

Background: Pre-condition
	Given '1' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode

@MindManager @Slides @InteractionsWithContent @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-910] @Upd_Qase
Scenario: Check_that_parent_topic_of_the_collapsed_branch_is_on_focus_after_the_action_is_finished_cloud
	When User clicks 'Notes' topic collapse button
	Then '3' collapsed subtopic of 'Notes' topic are displayed to User
	Then 'Note sub' topic is not displayed on Canvas

@MindManager @Slides @InteractionsWithContent @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-910] @Upd_Qase
Scenario: Check_that_parent_topic_of_the_expanded_branch_is_on_focus_after_the_action_is_finished_cloud
	Then User set zoom level to '86' via the side tool bar
	When User remembers location of 'Notes' topic on Canvas
	When User clicks 'Notes' topic collapse button
	Then '3' collapsed subtopic of 'Notes' topic are displayed to User
	Then 'Note sub' topic is not displayed on Canvas
	When User clicks 'Notes' topic collapse button
	Then all subtopics are expanded on Canvas
	Then 'Notes' topic has not changed location by X axis on Canvas
	Then 'Notes' topic has not changed location by Y axis on Canvas