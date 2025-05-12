@retry(2)
Feature: AlignmentMenu
Check functionality alignment menu on side menu

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar

@MindManager @SidePanel @AlignmentMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-865] @Upd_Qase
Scenario: Check_that_it_is_possible_to_invoke_alignment_menu_from_the_top_menu
	When User selects first 'FT2' and second 'FT3' topic on Canvas
	Then Topic Border is highlight blue color in 'FT2' topic on Canvas
	Then Topic Border is highlight blue color in 'FT3' topic on Canvas
	When User clicks menu button with 'design' name in 'ToolbarPageElement' container
	Then 'design' Menu is displayed to User
	When User clicks button with 'align' name in 'design' menu
	Then 'Align' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Align' section is displayed as expanded of 'PanelByName' side panel with 'Design' header

@MindManager @SidePanel @AlignmentMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-866] @Upd_Qase
Scenario: Check_that_it_is_possible_to_invoke_alignment_menu_from_the_context_menu_from_topics
	When User selects first 'FT2' and second 'FT3' topic on Canvas
	Then Topic Border is highlight blue color in 'FT2' topic on Canvas
	Then Topic Border is highlight blue color in 'FT3' topic on Canvas
	When User Right clicks on 'FT2' topic
	Then 'topic-contextmenu' Menu is displayed to User
	Then menu button with 'shapes-align' name is displayed in 'topic-contextmenu' menu
	When User mouse hovers menu button with 'shapes-align' name in 'topic-contextmenu' menu
	Then 'shapes-align' Menu is displayed to User

@MindManager @SidePanel @AlignmentMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-866] @Upd_Qase
Scenario: Check_that_it_is_possible_to_invoke_alignment_menu_from_the_context_menu_from_shapes
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	When User adds 'Text Bubble' shape from 'toolpanel-popup' dropdown menu to '50','50' position on Canvas
	When User selects first 'Rectangle' shape and second 'Text Bubble' shape on Canvas
	When User right clicks on 'Text Bubble' shape
	Then 'background-object-contextmenu' Menu is displayed to User
	Then menu button with 'shapes-align' name is displayed in 'background-object-contextmenu' menu
	When User mouse hovers menu button with 'shapes-align' name in 'background-object-contextmenu' menu
	Then 'shapes-align' Menu is displayed to User