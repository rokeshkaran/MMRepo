@retry(2)
Feature: EditMode
Check the possibility editing topic

	Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-304] @Upd_Qase
Scenario: Check_it_is_possible_to_resize_the_topics_width_by_drag_and_drop
	When User remembers 'Text Formatting' topic width size
	When User clicks 'Text Formatting' topic on Canvas
	When User drag the 'right' edge of the 'Text Formatting' topic by '-10' and '-10' coordinates on Canvas
	Then 'Text Formatting' topic width changed on Canvas

@MindManager @EditingCapabilities @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-307] @Upd_Qase
Scenario: Check_save_command_works_correctly
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','210' position on Canvas
	Then 'Rectangle' Shape is displayed on Canvas
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User clicks button with 'save' name in 'file' menu
	Then menu button with 'save' name is displayed in 'saved' state on Overlay panel
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User clicks button with 'close' name in 'file' menu
	Then content page is displayed to User
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then 'Rectangle' Shape is displayed on Canvas

