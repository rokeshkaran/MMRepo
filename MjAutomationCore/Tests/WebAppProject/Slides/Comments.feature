@retry(2)
Feature: Comments
	Check Comments functionality

Background: Pre-condition
	Given '1' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode

@MindManager @Slides @Comments @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-972] @Upd_Qase
Scenario: Hovering_the_comment_App
	Then '4' number is displayed in the comment icon of the 'FT2ST1' topic infobox
	When User mouse over the comment icon in the 'FT2ST1' topic infobox on Canvas
	Then 'MindManager Reader User10/10/2018, 10:49:45 AMAnd one more for the scroll to appearMindManager Reader User10/10/2018, 10:49:20 AMOne more commenno name8/8/2018, 6:14:06 PMComment 2no name8/8/2018, 6:13:44 PMComment 1' tooltip is displayed to the User

@MindManager @Slides @Comments @QA @Staging @Prod @Cleanup @Qase[WEB-972] @Upd_Qase
Scenario: Hovering_the_comment
	Then '4' number is displayed in the comment icon of the 'FT2ST1' topic infobox
	When User mouse over the comment icon in the 'FT2ST1' topic infobox on Canvas
	Then 'MindManager Reader User10/10/2018, 10:49:45 AMAnd one more for the scroll to appearMindManager Reader User10/10/2018, 10:49:20 AMOne more commenno name8/8/2018, 6:14:06 PMComment 2no name8/8/2018, 6:13:44 PMComment 1' tooltip is displayed to the User

@MindManager @Slides @Comments @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-973] @Upd_Qase
Scenario: Comments_UI_App
	When User clicks 'FT2ST1' topic on Canvas
	Then 'FT2ST1' topic border is highlighted 'rgb(62, 158, 255)' color with no quick add buttons on Canvas
	Then 'PanelPublished' side panel with 'Comments' header is displayed to the User
	Then 'Selected Topic' tab is active on Сomments panel
	Then '1' comment contains following info on Comments panel:
		| commentAvatar | CommentAuthor | CommentTopic | CommentText | CommentTime          |
		| image/svg+xml | no name       |              | Comment 1   | 8/8/2018, 6:13:44 PM |
	Then '3' comment contains following info on Comments panel:
		| commentAvatar                      | CommentAuthor           | CommentTopic | CommentText     | CommentTime             |
		| https://secure.gravatar.com/avatar | MindManager Reader User |              | One more commen | 10/10/2018, 10:49:20 AM |

@MindManager @Slides @Comments @QA @Staging @Prod @Cleanup @Qase[WEB-973] @Upd_Qase
Scenario: Comments_UI
	When User clicks 'FT2ST1' topic on Canvas
	Then 'FT2ST1' topic border is highlighted 'rgb(62, 158, 255)' color with no quick add buttons on Canvas
	Then 'PanelPublished' side panel with 'Comments' header is displayed to the User
	Then 'Selected Topic' tab is active on Сomments panel
	Then '2' comment contains following info on Comments panel:
		| commentAvatar | CommentAuthor | CommentTopic | CommentText | CommentTime          |
		| image/svg+xml | no name       |              | Comment 1   | 8/8/2018, 6:13:44 PM |
	Then '8' comment contains following info on Comments panel:
		| commentAvatar                      | CommentAuthor           | CommentTopic | CommentText     | CommentTime             |
		| https://secure.gravatar.com/avatar | MindManager Reader User |              | One more commen | 10/10/2018, 10:49:20 AM |

