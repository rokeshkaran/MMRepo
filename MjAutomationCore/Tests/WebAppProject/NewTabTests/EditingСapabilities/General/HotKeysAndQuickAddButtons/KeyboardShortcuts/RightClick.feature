@retry(2)
Feature: RightClick

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @Keyboard_Shortcuts @RightClick @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-552] @Upd_Qase
Scenario: Check_that_right_click_to_pan_always_works_regardless_of_what_is_under_the_users_mouse_Topic
	When User remembers the map location on Canvas
	And User right clicks 'MT' topic on Canvas and hold
	And User moves cursor by '15' '0' coordinates on Canvas
	Then map has changed location by X axis on Canvas
	When User remembers the map location on Canvas
	And User moves cursor by '0' '15' coordinates on Canvas
	Then map has changed location by Y axis on Canvas
	When User remembers the map location on Canvas
	And User moves cursor by '-40' '-40' coordinates on Canvas
	Then map has changed location by X axis on Canvas
	And map has changed location by Y axis on Canvas