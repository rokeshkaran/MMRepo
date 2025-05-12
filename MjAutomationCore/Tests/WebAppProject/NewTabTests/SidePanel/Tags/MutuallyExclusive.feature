@retry(2)
Feature: MutuallyExclusive

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	
@MindManager @SidePanel @Tags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-777] @Upd_Qase
Scenario: Verify_the_tags_info_tooltip
	When User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User hovers over at 'Kanban' section header on 'PanelByName' side panel with 'Tags' header and clicks ellips button
	Then 'group-header-context-menu' Menu is displayed to User
	Then 'mutually-exclusive' toggle with 'Mutually exclusive' name is enabled in 'group-header-context-menu' Menu
	When User hover on question icon in 'mutually-exclusive' toggle menu in 'group-header-context-menu' Menu
	Then 'When on, only one tag from this group can be assigned to a topic at a time.' tooltip is displayed to the User

@MindManager @SidePanel @Tags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-778] @Upd_Qase
Scenario: Verify_it_is_possible_to_change_tag_group_exclusivity
	When User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User hovers over at 'Kanban' section header on 'PanelByName' side panel with 'Tags' header and clicks ellips button
	Then 'group-header-context-menu' Menu is displayed to User
	Then 'mutually-exclusive' toggle with 'Mutually exclusive' name is enabled in 'group-header-context-menu' Menu
	When User toggle 'mutually-exclusive' and switch 'Mutually exclusive' icon off in 'group-header-context-menu' Menu
	Then 'mutually-exclusive' toggle with 'Mutually exclusive' name is disabled in 'group-header-context-menu' Menu

@MindManager @SidePanel @Tags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-779] @Upd_Qase
Scenario: Verify_that_only_one_tag_from_a_group_can_be_added_to_a_topic_if_tag_group_is_mutually_exclusive
	When User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User hovers over at 'Custom tag group' section header on 'PanelByName' side panel with 'Tags' header and clicks ellips button
	When User toggle 'mutually-exclusive' and switch 'Mutually exclusive' icon on in 'group-header-context-menu' Menu
	Then 'mutually-exclusive' toggle with 'Mutually exclusive' name is enabled in 'group-header-context-menu' Menu
	When User clicks 'MT4ST2ST3' topic on Canvas
	Then 'MT4ST2ST3' is outlined with a blue circuit
	When User clicks 'Tag #1' item in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tag #1' item is displayed as selected in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tag #1' tag is displayed in 'MT4ST2ST3' topic infobox
	When User clicks 'Tag #2' item in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tag #2' item is displayed as selected in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tag #1' item is displayed as unselected in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tag #2' tag is displayed in 'MT4ST2ST3' topic infobox
	Then 'Tag #1' tag is not displayed in 'MT4ST2ST3' topic infobox

@MindManager @SidePanel @Tags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-780] @Upd_Qase
Scenario: Verify_it_is_possible_to_assign_more_than_one_tag_to_a_topic_from_the_same_tag_group_if_tag_group_is_NOT_mutually_exclusive
	When User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User hovers over at 'Custom tag group' section header on 'PanelByName' side panel with 'Tags' header and clicks ellips button
	Then 'mutually-exclusive' toggle with 'Mutually exclusive' name is disabled in 'group-header-context-menu' Menu
	When User clicks 'MT4ST2ST3' topic on Canvas
	Then 'MT4ST2ST3' is outlined with a blue circuit
	When User clicks 'Tag #1' item in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tag #1' item is displayed as selected in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tag #1' tag is displayed in 'MT4ST2ST3' topic infobox
	When User clicks 'Tag #2' item in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tag #2' item is displayed as selected in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tag #2' tag is displayed in 'MT4ST2ST3' topic infobox