@retry(2)
Feature: RelationshipLines
Verify relationship lines attributes

Background: Pre-condition
	Given User is logged into MindManager web app via Api

@MindManager @MindManagerCloud @RelationshipLines @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1008] @Upd_Qase
Scenario: Verify_that_the_line_color_is_applied_to_all_topics
	Given User uploads following publish files via Api
		| Name                 | PublishFile           |
		| auto_test_SRND.mdeck | rel_line_colors.mdeck |
	And Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND.mdeck' published file via Api
	And User clicks 'Published Files' tab on file manager header page
	And User clicks 'View' button in row with 'auto_test_SRND.mdeck' file name of Published Files table
	And User switches to '1' tab
	Then Web Editor page is displayed to the User
	And Relationship lines are displaying in following colors on Canvas:
		| colors             |
		| rgb(18, 179, 47)   |
		| rgb(68, 71, 191)   |
		| rgb(251, 184, 25)  |
		| rgb(169, 169, 179) |
		| rgb(255, 149, 228) |
	
@MindManager @MindManagerCloud @RelationshipLines @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1009] @Upd_Qase
Scenario: Verify_that_the_line_thickness_is_applied_to_all_topics
	Given User uploads following publish files via Api
		| Name                 | PublishFile              |
		| auto_test_SRND.mdeck | rel_line_thickness.mdeck |
	And Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND.mdeck' published file via Api
	And User clicks 'Published Files' tab on file manager header page
	And User clicks 'View' button in row with 'auto_test_SRND.mdeck' file name of Published Files table
	And User switches to '1' tab
	Then Web Editor page is displayed to the User
	And '11' relationship lines are displayed on Canvas
	And Relationship lines are displaying in following width on Canvas:
		| width      |
		| 0.666667px |
		| 1.33333px  |
		| 2px        |
		| 3px        |
		| 26.6667px  |
		| 4px        |
		| 6px        |
		| 8px        |
		| 10.6667px  |
		| 16px       |
		| 40px       |

