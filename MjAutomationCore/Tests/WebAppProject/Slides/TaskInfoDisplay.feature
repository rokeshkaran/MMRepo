@retry(2)
Feature: TaskInfoDisplay
Check Task Info Display functionality 

@MindManager @MyPublishedFiles @Slides @TaskInfoDisplay @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-917] @Upd_Qase @Cleanup
Scenario: Check_that_Task_Progress_and_Priority_are_displayed_correctly
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName             | FilePath    |
		| auto_test_SRND.mdeck | Slide.mdeck |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mdeck' file
	Then Web Editor page is displayed to the User
	Then 'Priority 3' Icon is displayed to the 'Floating Topic' Topic
	Then '50% done' Icon is displayed to the 'Effort and duration' Topic
	Then 'Alarm' Icon is displayed to the 'Effort and duration' Topic

@MindManager @MyPublishedFiles @Slides @TaskInfoDisplay @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-918] @Upd_Qase @Cleanup
Scenario: Check_that_Start_and_Due_dates_are_correctly_displayed
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName             | FilePath    |
		| auto_test_SRND.mdeck | Slide.mdeck |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mdeck' file
	Then Web Editor page is displayed to the User
	Then '2/1' Start date is displayed to the 'Effort and duration' topic infobox
	Then '- 2/2' Due date is displayed to the 'Effort and duration' topic infobox
	Then ': 2 workday(s)' date info is displayed to the 'Effort and duration' topic infobox
	Then 'Effort: 10 minute(s)' effort info is displayed to the 'Effort and duration' topic infobox

@MindManager @MyPublishedFiles @Slides @TaskInfoDisplay @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-921] @Upd_Qase @Cleanup
Scenario: Check_that_hovering_on_any_task_info_shows_a_tooltip_with_all_task_info_Cloud
	Given '1' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel
	When User mouses over 'Me' resource in 'Effort and duration' topic infobox
	Then '2/1 - 2/2Duration: 2 workday(s)Effort: Effort: 10 minute(s)Resources: Me' tooltip is displayed to the User

@MindManager @MyPublishedFiles @Slides @TaskInfoDisplay @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-920] @Upd_Qase @Cleanup
Scenario: To_verify_that_the_efforts_are_displayed_in_Slide_show_mode
	Given '1' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel
	Then 'Effort: 10 minute(s)' effort info is displayed to the 'Effort and duration' topic infobox
	When User clicks 'Effort and duration' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelPublished' side panel with 'Task Information' header is displayed to the User
	Then Input field is disabled in 'Start Date' section of 'PanelPublished' side panel with 'Task Information' header
	Then Input field is disabled in 'Due Date' section of 'PanelPublished' side panel with 'Task Information' header
	Then 'General' input field is disabled of 'PanelPublished' side panel with 'Task Information' header

@MindManager @MyPublishedFiles @Slides @TaskInfoDisplay @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-923] @Upd_Qase @Cleanup
Scenario: To_verify_the_roll_up_task_topic_display_details
	Given '1' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel
	Then 'Task info' Icon is displayed to the 'FT2' Topic
	Then '75% done' icon has lock in 'FT2' topic on Canvas
	Then '2/15' Start date is displayed to the 'FT2ST1' topic infobox
	Then '- 2/17' Due date is displayed to the 'FT2ST1' topic infobox
	Then 'Me' Resource text is displayed to the 'rgb(51, 51, 51)' color in 'FT2ST2' topic infobox

@MindManager @MyPublishedFiles @Slides @TaskInfoDisplay @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-925] @Upd_Qase @Cleanup
Scenario: To_verify_that_a_tooltip_with_the_information_is_displayed
	Given '1' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel
	Then 'Task info' Icon is displayed to the 'FT2' Topic
	When User hover over 'Task info' icon in 'FT2' topic
	Then 'Task info is automatically maintained within this branch' tooltip is displayed to the User