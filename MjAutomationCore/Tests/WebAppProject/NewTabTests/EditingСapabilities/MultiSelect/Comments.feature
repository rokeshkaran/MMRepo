@retry(2)
Feature: Comments
Check the functionality of Comments multi select

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @MultiSelect @Comments @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-480] @Upd_Qase
Scenario: Multiple_topics_with_comments_selected
	When User selects first 'MT1' and second 'MT2' topic on Canvas
	And User clicks 'Comments' button of side Toolbox
	Then 'All' tab is active on Сomments panel
	And '2' comment contains following info on Comments panel:
		| commentAvatar                      | CommentAuthor              | CommentTopic | CommentText         | CommentTime            |
		| https://secure.gravatar.com/avatar | automation.mj.qa@gmail.com | RE: MT2      | Automation comments | 6/16/2022, 10:30:05 AM |
	And 'Selected Topic' tab is not displayed on Сomments panel
	And 'comment-input' text area is not displayed to User

@MindManager @EditingCapabilities @MultiSelect @Comments @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-481] @Upd_Qase
Scenario: Adding_comments_to_multiple_topics_are_not_allowed
	When User selects first 'MT1' and second 'MT2' topic on Canvas
	And User clicks 'Comments' button of side Toolbox
	Then 'All' tab is active on Сomments panel
	And 'Selected Topic' tab is not displayed on Сomments panel
	And 'comment-input' text area is not displayed to User