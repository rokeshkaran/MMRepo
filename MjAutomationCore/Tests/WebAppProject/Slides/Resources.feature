@retry(2)
Feature: Resources
Check the functionality of resources in the Slides mode

Background: Pre-condition
	Given '1' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User

@MindManager @Slides @Resources @QA @Staging @Prod @Qase[WEB-941] @Upd_Qase
Scenario: Check_that_Resources_correctly_displayed_cloud
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	Then 'Me' resource is displayed in 'Effort and duration' topic
	When User clicks 'Me' resource in 'Effort and duration' topic infobox
	Then 'PanelPublished' side panel with 'Task Information' header is displayed to the User
	Then 'Me' resource is displayed in 'Resources' section of 'PanelPublished' side panel with 'Task Information' header

@MindManager @Slides @Resources @App_QA @App_Staging @App_Prod @Qase[WEB-941] @Upd_Qase
Scenario: Check_that_Resources_correctly_displayed
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'View' button in the 'resources_task_info.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	Then 'Ahsoka Tano' resource is displayed in 'Development' topic
	Then 'Anakin Jedi' resource is displayed in 'Development' topic
	When User clicks 'Ahsoka Tano' resource in 'Development' topic infobox
	Then 'PanelPublished' side panel with 'Task Information' header is displayed to the User
	Then 'Ahsoka Tano' resource is displayed in 'Resources' section of 'PanelPublished' side panel with 'Task Information' header
	Then 'Anakin Jedi' resource is displayed in 'Resources' section of 'PanelPublished' side panel with 'Task Information' header