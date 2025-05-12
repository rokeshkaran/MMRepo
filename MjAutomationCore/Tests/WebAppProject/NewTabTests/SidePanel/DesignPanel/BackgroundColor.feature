@retry(2)
Feature: BackgroundColor
Check functionality background color on side toolbox

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar

@MindManager @Side_Toolbox @Background @BackgroundColor @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-852] @Upd_Qase
Scenario: Check_that_user_can_add_color_to_background_using_color_picker
	When User clicks 'Design' button of side Toolbox
	Then 'Color:' subsection is displayed in the 'Background' section with 'Design' header
	When User clicks Color Picker menu button in 'Color:' field in 'Background' section of 'PanelByName' side panel with 'Design' header
	Then Color Picker window is displayed to User
	When User enters '#ffea20ce' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then background color is 'rgba(234, 32, 206, 1)' on Canvas

@MindManager @Side_Toolbox @Background @BackgroundColor @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-853] @Upd_Qase
Scenario: Check_that_user_can_reset_background_color_to_default
	When User clicks 'Design' button of side Toolbox
	Then 'Color:' subsection is displayed in the 'Background' section with 'Design' header
	When User clicks Color Picker menu button in 'Color:' field in 'Background' section of 'PanelByName' side panel with 'Design' header
	Then Color Picker window is displayed to User
	When User enters '#ffea20ce' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then background color is 'rgba(234, 32, 206, 1)' on Canvas
	When User clicks Color Picker menu button in 'Color:' field in 'Background' section of 'PanelByName' side panel with 'Design' header
	Then Color Picker window is displayed to User
	When User clicks no color checkbox in palette container on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then background color is 'rgba(255, 255, 255, 1)' on Canvas