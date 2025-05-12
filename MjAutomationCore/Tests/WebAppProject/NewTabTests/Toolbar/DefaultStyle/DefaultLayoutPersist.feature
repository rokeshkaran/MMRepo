@retry(2)
Feature: DefaultLayoutPersist
Check the default layout persist between sessions

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

@MindManager @Toolbar @SetLayoutDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1381] @Health_Check @Upd_Qase
Scenario: Verify_that_default_layout_persists_for_floating_topic_between_sessions
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks 'Design' button of side Toolbox
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Layout' section is displayed on 'PanelByName' side panel with 'Design' header
	When User clicks 'Tree' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Set Default Style' button on Tools panel
	When User waits '1000' miliseconds
	When User clicks on the 'Set Default Layout' button in Share context menu
	When User waits '2000' miliseconds
	When User close Active tab
	#User A logged in
	When User openes 'chrome' browser
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
	Then 'Tree' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header

@MindManager @Toolbar @SetLayoutDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1462] @Upd_Qase
Scenario: Verify_that_default_layout_persists_for_main_topic_between_sessions
	When User clicks 'MT' topic on Canvas
	When User clicks 'Design' button of side Toolbox
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Layout' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Layout' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	When User clicks 'Timeline' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Layout' button in Share context menu
	When User waits '2000' miliseconds
	When User close Active tab
	#User A logged in
	When User openes 'chrome' browser
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
	Then 'Timeline' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header

@MindManager @Toolbar @SetLayoutDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1463] @Upd_Qase
Scenario: Verify_that_default_layout_persists_for_sub_topic_between_sessions
	When User clicks 'MTST' topic on Canvas
	When User clicks 'Design' button of side Toolbox
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Layout' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Layout' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	When User clicks 'Timeline' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Layout' button in Share context menu
	When User waits '2000' miliseconds
	When User close Active tab
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
	Then 'Timeline' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header

@MindManager @Toolbar @SetLayoutDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1464] @Upd_Qase
Scenario: Verify_that_default_layout_persists_for_callout_topic_between_sessions
	When User clicks 'MTCO' topic on Canvas
	When User clicks 'Design' button of side Toolbox
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Layout' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Layout' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	When User clicks 'Right' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Layout' button in Share context menu
	When User waits '2000' miliseconds
	When User close Active tab
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

@MindManager @Toolbar @SetLayoutDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1465] @Upd_Qase @JIRA[MMCV-9960]
Scenario: Verify_that_default_layout_persists_for_relationship_label_between_sessions
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
	When User waits '2000' miliseconds
	When User clicks 'Delete' button on Tools panel
	When User close Active tab
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