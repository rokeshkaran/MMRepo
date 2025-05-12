@retry(2)
Feature: DragAndDropInFlowchart
Check the functionality of drag and drop topics in Flowchart

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | FlowchartMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @Topics @DragAndDropInFlowchart @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-300] @Upd_Qase @JIRA[MMCV-9732]
Scenario: Drag_and_Drop_in_Flowchart
	When User remembers location of 'TT1' topic on Canvas
	When User drags and hold 'TT1' topic to '-50' and '-50' coordinates on Canvas
	Then selected topic is displayed attached to the mouse cursor at 50 percent opacity
	Then 'rectangle' topic shape is attached to the cursor on Canvas
	When User releases all pressed keys
	Then 'TT1' topic is displayed on Canvas
	Then 'TT1' topic has changed location by X axis on Canvas
	Then 'TT1' topic has changed location by Y axis on Canvas
	When User clicks 'Add floating topic' button on Tools panel
	When User add floating topic by coordinates '-80', '-80' to the Canvas
	Then '2' relationship lines are displayed on Canvas
	When User Drag 'Topic' topic on 'TT2' topic and hold then release
	Then 'drop-context-menu' dropdown menu is displayed to User
	When User clicks 'Insert Relationship' item in 'drop-context-menu' dropdown menu
	Then '3' relationship lines are displayed on Canvas
