@retry(2)
Feature: Comments
Verify that can be add, edit and delete Comments

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath      |
		| auto_test_SRND.mmap | Comments.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @SidePanel @Comments @App_QA @Cleanup @Qase[WEB-764] @Upd_Qase
Scenario: Check_that_it_is_possible_to_Add_comments_to_topics
	When User clicks 'Main Topic' topic on Canvas
	When User clicks 'Comments' button of side Toolbox
	Then 'PanelByName' side panel with 'Comments' header is displayed to the User
	Then 'No comments' text is displayed in comment container on Comments panel
	When User enters 'Automation comment-SRND' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '1' number is displayed in the comment icon of the 'Main Topic' topic infobox
	Then '1' comment contains following info on Comments panel:
		| commentAvatar                      | CommentAuthor              | CommentTopic | CommentText             | CommentTime |
		| https://secure.gravatar.com/avatar | automation.mj.qa@gmail.com |              | Automation comment-SRND | D(0)        |
	Then Comment icon is displayed to the 'Main Topic' topic infobox

@MindManager @SidePanel @Comments @App_Staging @App_Prod @Cleanup @Qase[WEB-764] @Health_Check @Upd_Qase
Scenario: Check_that_it_is_possible_to_Add_comments_to_topics_Stg_Prod
	When User clicks 'Main Topic' topic on Canvas
	When User clicks 'Comments' button of side Toolbox
	Then 'PanelByName' side panel with 'Comments' header is displayed to the User
	Then 'No comments' text is displayed in comment container on Comments panel
	When User enters 'Automation comment-SRND' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '1' number is displayed in the comment icon of the 'Main Topic' topic infobox
	Then '1' comment contains following info on Comments panel:
		| commentAvatar                      | CommentAuthor | CommentTopic | CommentText             | CommentTime |
		| https://secure.gravatar.com/avatar | Automation_MJ |              | Automation comment-SRND | D(0)        |
	Then Comment icon is displayed to the 'Main Topic' topic infobox


@MindManager @SidePanel @Comments @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-764] @Upd_Qase
Scenario: Check_that_it_is_possible_to_Delete_comments_via_side_panel
	When User clicks 'Main Topic' topic on Canvas
	When User clicks 'Comments' button of side Toolbox
	When User enters 'Automation comment-SRND' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	When User clicks 'Delete' button on 'Automation comment-SRND' comment text on Comments panel
	Then 'No comments' text is displayed in comment container on Comments panel
	Then Comment icon is not displayed to the 'Main Topic' topic infobox

@MindManager @SidePanel @Comments @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-765] @Upd_Qase
Scenario: Check_that_it_is_possible_to_Cancel_editing_comments_via_side_panel
	When User clicks 'Main Topic' topic on Canvas
	When User clicks 'Comments' button of side Toolbox
	When User enters 'Automation comment-SRND' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '1' comment contains following info on Comments panel:
		| commentAvatar                      | CommentAuthor | CommentTopic | CommentText             | CommentTime |
		| https://secure.gravatar.com/avatar |               |              | Automation comment-SRND | D(0)        |
	When User clicks 'Edit' button on 'Automation comment-SRND' comment text on Comments panel
	Then input field for editing comments is displayed to the User
	When User enters 'Updated comment' text in comment edit field of Comments panel
	When User clicks 'Cancel' button in comment edit bar of Comments panel
	Then input field for editing comments is not displayed to the User
	Then '1' comment contains following info on Comments panel:
		| commentAvatar                      | CommentAuthor | CommentTopic | CommentText             | CommentTime |
		| https://secure.gravatar.com/avatar |               |              | Automation comment-SRND | D(0)        |

@MindManager @SidePanel @Comments @App_Staging @App_Prod @Cleanup @Qase[WEB-765] @Upd_Qase
Scenario Outline: Check_that_it_is_possible_to_edit_Comments_and_save_the_changes_Stg_Prod
	When User clicks '<topicType>' topic on Canvas
	When User clicks 'Comments' button of side Toolbox
	When User enters 'Automation comments' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '1' number is displayed in the comment icon of the '<topicType>' topic infobox
	When User clicks Comment icon to the '<topicType>' topic infobox
	Then 'PanelByName' side panel with 'Comments' header is displayed to the User
	Then '1' comment contains following info on Comments panel:
		| commentAvatar                      | CommentAuthor | CommentTopic | CommentText         | CommentTime |
		| https://secure.gravatar.com/avatar | Automation_MJ |              | Automation comments | D(0)        |
	When User clicks 'Edit' button on 'Automation comments' comment text on Comments panel
	Then input field for editing comments is displayed to the User
	When User enters 'New Comment #2' text in comment edit field of Comments panel
	When User clicks 'Done' button in comment edit bar of Comments panel
	Then '1' comment contains following info on Comments panel:
		| commentAvatar                      | CommentAuthor | CommentTopic | CommentText    | CommentTime |
		| https://secure.gravatar.com/avatar | Automation_MJ |              | New Comment #2 | D(0)        |
Examples:
	| topicType      |
	| Central Topic  |
	| Main Topic     |
	| Subtopic       |
	| Floating Topic |
	| Callout        |

@MindManager @SidePanel @Comments @App_QA @Cleanup @Qase[WEB-765] @Upd_Qase
Scenario Outline: Check_that_it_is_possible_to_edit_Comments_and_save_the_changes_QA
	When User clicks '<topicType>' topic on Canvas
	When User clicks 'Comments' button of side Toolbox
	When User enters 'Automation comments' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '1' number is displayed in the comment icon of the '<topicType>' topic infobox
	When User clicks Comment icon to the '<topicType>' topic infobox
	Then 'PanelByName' side panel with 'Comments' header is displayed to the User
	Then '1' comment contains following info on Comments panel:
		| commentAvatar                      | CommentAuthor              | CommentTopic | CommentText         | CommentTime |
		| https://secure.gravatar.com/avatar | automation.mj.qa@gmail.com |              | Automation comments | D(0)        |
	When User clicks 'Edit' button on 'Automation comments' comment text on Comments panel
	Then input field for editing comments is displayed to the User
	When User enters 'New Comment #2' text in comment edit field of Comments panel
	When User clicks 'Done' button in comment edit bar of Comments panel
	Then '1' comment contains following info on Comments panel:
		| commentAvatar                      | CommentAuthor              | CommentTopic | CommentText    | CommentTime |
		| https://secure.gravatar.com/avatar | automation.mj.qa@gmail.com |              | New Comment #2 | D(0)        |

Examples:
	| topicType      |
	| Central Topic  |
	| Main Topic     |
	| Subtopic       |
	| Floating Topic |
	| Callout        |