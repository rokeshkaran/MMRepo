@retry(2)
Feature: TagVew
Check that Tag Vew option works

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @Side_Menu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1255] @Upd_Qase
Scenario: Check_it_is_possible_to_switch_to_tag_view_from_edit_mode
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User mouse hovers menu button with 'tag-view' name in 'view' menu
	When User clicks button with 'Kanban' name in 'tag-view' menu
	Then map is displayed in 'Tag' view mode
	Then title 'CT - Kanban' is displayed on the Tag View page
	Then following columns are displayed on Tag View page
	| columns       |
	| UNCATEGORIZED |
	| To Do         |
	| Doing         |
	| Done          |
	Then following tags columns from 'Kanban' group are displayed on Tag View page:
	| tagsName |
	| To Do    |
	| Doing    |
	| Done     |