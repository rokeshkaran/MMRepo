@retry(2)
Feature: Design
	Check functionality Toolbar Menu for QA,Staging,Prod

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @Top_Menu @Design @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1226] @Upd_Qase
Scenario: Check_Layout_button_functionality
	When User clicks menu button with 'design' name in 'ToolbarPageElement' container
	When User clicks button with 'layout' name in 'design' menu
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Text' section is displayed as collapsed of 'PanelByName' side panel with 'Design' header
	Then 'Layout' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	Then 'Theme' section is displayed as collapsed of 'PanelByName' side panel with 'Design' header
	Then following items is displayed in 'Layout' section of 'PanelByName' side panel with 'Design' header:
		| Items      |
		| Radial     |
		| Right      |
		| Org-Chart  |
		| Timeline   |
		| Tree       |
		| Whiteboard |
	Then 'Radial' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User remembers location of 'MT1' topic on Canvas
	When User clicks 'Tree' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'MT1' topic has changed location by X axis on Canvas
	Then 'MT1' topic has changed location by Y axis on Canvas

@MindManager @Top_Menu @Design @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1227] @Upd_Qase
Scenario: Check_Theme_button_functionality
	When User clicks menu button with 'design' name in 'ToolbarPageElement' container
	When User clicks button with 'theme' name in 'design' menu
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	When User waits '1000' miliseconds
	Then 'Theme' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	When User clicks '12-good-vibes' Theme icon in 'Theme' section of 'PanelByName' side panel with 'Design' header
	Then '12-good-vibes' Theme icon is displayed as selected in 'Theme' section of 'PanelByName' side panel with 'Design' header
	Then 'CT' topic is assigned 'capsule' shape on Canvas

@MindManager @Top_Menu @Design @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1228] @Upd_Qase
Scenario: Check_that_it_is_possible_to_edit_the_map_background
	When User clicks menu button with 'design' name in 'ToolbarPageElement' container
	Then 'design' Menu is displayed to User
	When User clicks button with 'background' name in 'design' menu
	Then 'Background' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Color:' subsection is displayed in the 'Background' section with 'Design' header
	Then 'Image:' subsection is displayed in the 'Background' section with 'Design' header
	When User clicks Color Picker menu button in 'Color:' field in 'Background' section of 'PanelByName' side panel with 'Design' header
	Then Color Picker window is displayed to User
	When User enters '#ffea20ce' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then background color is 'rgba(234, 32, 206, 1)' on Canvas