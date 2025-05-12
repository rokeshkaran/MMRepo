@retry(2)
Feature: ResetToDefaultLayoutStyle
Check the User can reset Defaults layout Styles

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

@MindManager @Toolbar @ResetLayoutDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1369] @Upd_Qase
Scenario: Check_that_User_can_reset_default_layout_style_for_floating_topic
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks 'Design' button of side Toolbox
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Layout' section is displayed on 'PanelByName' side panel with 'Design' header
	When User clicks 'Tree' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	When User clicks by coordinates '200' and '70' on Canvas
	When User clicks 'ImageTopic1' topic on Canvas
	Then 'Radial' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Org-Chart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Flowchart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	
@MindManager @Toolbar @ResetLayoutDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1370] @Upd_Qase
Scenario: Check_that_User_can_reset_default_layout_style_for_main_topic
	When User clicks 'MT' topic on Canvas
	When User clicks 'Design' button of side Toolbox
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Layout' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Layout' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	When User clicks 'Timeline' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	When User clicks by coordinates '200' and '70' on Canvas
	When User clicks 'MT' topic on Canvas
	Then 'Radial' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Org-Chart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header

@MindManager @Toolbar @ResetLayoutDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1371] @Upd_Qase
Scenario: Check_that_User_can_reset_default_layout_style_for_subtopic
	When User clicks 'MTST' topic on Canvas
	When User clicks 'Design' button of side Toolbox
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Layout' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Layout' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	When User clicks 'Timeline' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	When User clicks by coordinates '200' and '70' on Canvas
	When User clicks 'MTST' topic on Canvas
	Then 'Radial' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Org-Chart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header

@MindManager @Toolbar @ResetLayoutDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1372] @Upd_Qase
Scenario: Check_that_User_can_reset_default_layout_style_for_callout_topic
	When User clicks 'MTCO' topic on Canvas
	When User clicks 'Design' button of side Toolbox
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Layout' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Layout' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	When User clicks 'Right' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	When User clicks by coordinates '200' and '70' on Canvas
	When User clicks 'MTCO' topic on Canvas
	Then 'Radial' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Org-Chart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header

@MindManager @Toolbar @ResetLayoutDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1373] @Upd_Qase @JIRA[MMCV-9960]
Scenario: Check_that_User_can_reset_default_layout_style_for_relationship_label_topic
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'ImageTopic1' topic on Canvas
	When User clicks 'FT' topic on Canvas
	Then '1' relationship lines are displayed on Canvas
	When User clicks Relationship label on Canvas
	When User enters 'Relationship label' text to the topic on Canvas
	When User clicks by coordinates '200' and '70' on Canvas
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks 'Design' button of side Toolbox
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Layout' section is displayed on 'PanelByName' side panel with 'Design' header
	When User clicks 'Right' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	When User clicks by coordinates '200' and '70' on Canvas
	When User clicks 'Relationship label' topic on Canvas
	Then 'Radial' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Org-Chart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Flowchart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header