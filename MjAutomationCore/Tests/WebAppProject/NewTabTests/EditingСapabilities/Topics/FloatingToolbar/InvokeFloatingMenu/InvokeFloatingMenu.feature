@retry(2)
Feature: InvokeFloatingMenu
Check the functionality of floating Toolbar for opening Sub Menu

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar
	When User clicks 'MT8' topic on Canvas
	Then Floating Toolbar is displayed on Canvas

@MindManager @EditingCapabilities @Topics @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2414] @Upd_Qase
Scenario: Check_that_it_is_possible_to_invoke_Floating_toolbar_for_Main_topic
	When User clicks 'MT1' topic on Canvas
	Then Floating Toolbar is displayed on Canvas
	When User clicks by coordinates '120' and '75' on Canvas
	Then Floating Toolbar is not displayed on Canvas

@MindManager @EditingCapabilities @Topics @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2415] @Upd_Qase
Scenario: Check_that_it_is_possible_to_invoke_Floating_toolbar_for_Floating_Topic
	When User clicks 'FT2' topic on Canvas
	Then Floating Toolbar is displayed on Canvas
	When User clicks by coordinates '120' and '75' on Canvas
	Then Floating Toolbar is not displayed on Canvas

@MindManager @EditingCapabilities @Topics @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2416] @Upd_Qase
Scenario: Check_that_it_is_possible_to_invoke_Floating_toolbar_for_Sub_Topic
	When User clicks 'MT4ST1' topic on Canvas
	Then Topic Border is highlight blue color in 'MT4ST1' topic on Canvas
	Then Floating Toolbar is displayed above 'MT4ST1' topic on Canvas
	When User clicks 'MT5' topic on Canvas
	Then Topic Border is highlight blue color in 'MT5' topic on Canvas
	Then Floating Toolbar is displayed above 'MT5' topic on Canvas

@MindManager @EditingCapabilities @Topics @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2417] @Upd_Qase
Scenario: Check_that_it_is_possible_to_invoke_Floating_toolbar_for_Central_Topic
	When User clicks 'CT' topic on Canvas
	Then Topic Border is highlight blue color in 'CT' topic on Canvas
	Then Floating Toolbar is displayed above 'CT' topic on Canvas
	When User clicks 'MT5' topic on Canvas
	Then Topic Border is highlight blue color in 'MT5' topic on Canvas
	Then Floating Toolbar is displayed above 'MT5' topic on Canvas

@MindManager @EditingCapabilities @Topics @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2418] @Upd_Qase
Scenario: Check_that_it_is_possible_to_invoke_Floating_toolbar_for_Callout_Topic
	When User clicks 'CO1' topic on Canvas
	Then Topic Border is highlight blue color in 'CO1' topic on Canvas
	Then Floating Toolbar is displayed above 'CO1' topic on Canvas
	When User clicks by coordinates '120' and '75' on Canvas
	Then Floating Toolbar is not displayed on Canvas

@MindManager @EditingCapabilities @Topics @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2419] @Upd_Qase
Scenario: Check_that_it_is_possible_to_invoke_Floating_toolbar_for_Relationship_label_Topic
	When User clicks 'RL1' topic on Canvas
	Then Topic Border is highlight blue color in 'RL1' topic on Canvas
	Then Floating Toolbar is displayed above 'RL1' topic on Canvas
	When User clicks on the relationship line
	Then Floating Toolbar is not displayed on Canvas

@MindManager @EditingCapabilities @Topics @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2420] @Upd_Qase
Scenario: Check_that_it_is_possible_to_invoke_Floating_toolbar_for_Sticky_notes_Topic
	When User clicks 'Add sticky note' button on Tools panel
	When User add sticky note by coordinates '210', '90' to the Canvas
	Then 'Sticky note' topic is displayed on Canvas
	When User clicks by coordinates '120' and '75' on Canvas
	When User clicks 'Sticky note' topic on Canvas
	Then Floating Toolbar is displayed above 'Sticky note' topic on Canvas

@MindManager @EditingCapabilities @Topics @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2421] @Upd_Qase
Scenario: Check_that_it_is_not_possible_to_invoke_Floating_toolbar_for_BO_shapes
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','50' position on Canvas
	Then 'Rectangle' shape is highlighted green frame
	When User clicks by coordinates '120' and '75' on Canvas
	When User clicks on 'Rectangle' shape
	Then Floating Toolbar is not displayed on Canvas
	When User uploads 'FruitsOutlineIcon.png' image from Tool panel to '50','50' position on Canvas
	Then 'FruitsOutlineIcon.png' image with approximate '264' width and approximate '184' height is displayed on page
	When User clicks by coordinates '120' and '75' on Canvas
	When User clicks on 'FruitsOutlineIcon.png' uploaded image on Canvas
	Then Floating Toolbar is not displayed on Canvas
	When User clicks 'Insert Text Box' button on Tools panel
	When User clicks by coordinates '200' and '200' on Canvas
	When User presses the 'A' key on the keyboard
	When User clicks by coordinates '120' and '75' on Canvas
	When User click on Textbox with text 'A' on canvas
	Then Textbox is selected on Canvas
	Then Floating Toolbar is not displayed on Canvas

@MindManager @EditingCapabilities @Topics @FloatingToolbar @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2433] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_image_via_floating_toolbar
	When User clicks 'FT2' topic on Canvas
	Then Topic Border is highlight blue color in 'FT2' topic on Canvas
	Then Floating Toolbar is displayed above 'FT2' topic on Canvas
	When User uploads 'FruitImages.jpg' file through 'hidden-file-input' input
	Then image is displayed in 'FT2' topiс on Canvas