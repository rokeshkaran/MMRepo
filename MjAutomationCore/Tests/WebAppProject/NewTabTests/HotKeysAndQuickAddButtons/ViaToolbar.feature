@retry(2)
Feature: ViaToolbar
	Check the functionality of multi select via toolbar

	Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks Create button on the Create New page

@MindManager @NewTab @EditingMultiple @App_QA @App_Staging @App_Prod @JIRA[MMCV-4081]
Scenario: Select_boundary
	When User clicks 'Central Topic' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	When User clicks 'Add subtopic' button on Tools panel
	When User clicks on the Add floating topic button on the toolbar
	When User add floating topic by coordinates '500', '300' to the Canvas
	When User selects first 'Floating Topic' and second 'Main Topic' topic on Canvas
	When User clicks 'Add boundary' button on Tools panel
	Then 'Floating Topic' topic is located in boundary on Canvas
	Then 'Main Topic' topic is located in boundary on Canvas
	When User clicks on the Body on Canvas
	When User selects first 'Floating Topic' and second 'Main Topic' topic boundary on the View Map page
	Then Topic Border is highlight blue color in 'Floating Topic' topic on Canvas
	Then Topic Border is highlight blue color in 'Main Topic' topic on Canvas