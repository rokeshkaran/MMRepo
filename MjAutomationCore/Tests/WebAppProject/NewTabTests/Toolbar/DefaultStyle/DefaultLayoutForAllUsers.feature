@retry(2)
Feature: DefaultLayoutForAllUsers
Check the User can set Defaults layout Styles for all users

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

@MindManager @Toolbar @SetLayoutDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1379] @Upd_Qase @JIRA[MMCV-9857]
Scenario: Check_that_default_layout_for_floating_topics_applies_to_all_user
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks 'Design' button of side Toolbox
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Layout' section is displayed on 'PanelByName' side panel with 'Design' header
	When User clicks 'Tree' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Layout' button in Share context menu
	Then text 'Default Layout Saved!' is displayed in toast notification on Overlay panel
	When User clicks by coordinates '200' and '70' on Canvas
	When User clicks 'Add floating topic' button on Tools panel
	When User add floating topic by coordinates '200', '70' to the Canvas
	Then 'Radial' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Org-Chart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Flowchart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Subtopic' topic is displayed on Canvas
	Then 'Tree' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Design' button of side Toolbox
	When User clicks 'Add floating topic' button on Tools panel
	When User add floating topic by coordinates '210', '90' to the Canvas
	Then 'Radial' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Org-Chart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Flowchart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Subtopic' topic is displayed on Canvas
	Then 'Tree' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header

@MindManager @Toolbar @SetLayoutDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1432] @Upd_Qase
Scenario: Check_that_default_layout_for_main_topics_applies_to_all_user
	When User clicks 'MT' topic on Canvas
	When User clicks 'Design' button of side Toolbox
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Layout' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Layout' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	When User clicks 'Timeline' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Layout' button in Share context menu
	When User clicks by coordinates '200' and '70' on Canvas
	When User clicks 'CT' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	Then 'Radial' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Org-Chart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Subtopic' topic is displayed on Canvas
	Then 'Timeline' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Design' button of side Toolbox
	When User clicks 'CT' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	Then 'Radial' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Org-Chart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Subtopic' topic is displayed on Canvas
	Then 'Timeline' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header

@MindManager @Toolbar @SetLayoutDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1433] @Upd_Qase
Scenario: Check_that_default_layout_for_subtopic_applies_to_all_user
	When User clicks 'MTST' topic on Canvas
	When User clicks 'Design' button of side Toolbox
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Layout' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Layout' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	When User clicks 'Timeline' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Layout' button in Share context menu
	When User clicks by coordinates '200' and '70' on Canvas
	When User clicks 'MT' topic on Canvas
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Radial' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Org-Chart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Undo' button on Tools panel
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Design' button of side Toolbox
	When User clicks 'MT' topic on Canvas
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Radial' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Org-Chart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header

@MindManager @Toolbar @SetLayoutDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1434] @Upd_Qase
Scenario: Check_that_default_layout_for_callout_applies_to_all_user
	When User clicks 'MTCO' topic on Canvas
	When User clicks 'Design' button of side Toolbox
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Layout' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Layout' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	When User clicks 'Right' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Layout' button in Share context menu
	When User clicks by coordinates '200' and '70' on Canvas
	When User clicks 'MT' topic on Canvas
	When User clicks 'Add callout' button on Tools panel
	Then 'Radial' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Org-Chart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Undo' button on Tools panel
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Design' button of side Toolbox
	When User clicks 'MT' topic on Canvas
	When User clicks 'Add callout' button on Tools panel
	Then 'Right' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header

@MindManager @Toolbar @SetLayoutDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1435] @Upd_Qase @JIRA[MMCV-9960]
Scenario: Check_that_default_layout_for_relationship_label_applies_to_all_user
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
	When User clicks on the 'Set Default Layout' button in Share context menu
	When User clicks 'Delete' button on Tools panel
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'ImageTopic1' topic on Canvas
	When User clicks 'FT' topic on Canvas
	When User clicks Relationship label on Canvas
	Then 'Radial' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Org-Chart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Delete' button on Tools panel
	When User clicks by coordinates '200' and '70' on Canvas
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Design' button of side Toolbox
	When User waits '1000' miliseconds
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	When User hovers cursor the 'FT' topic
	When User clicks 'FT' topic on Canvas
	When User clicks Relationship label on Canvas
	Then 'Right' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header