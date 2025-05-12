@retry(2)
Feature: InvokeDropContextMenuInFlowchartMap
Check the functionality of topic drop context menu in Flowchart map

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | FlowchartMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @Topics @InvokeDragContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-289] @Upd_Qase @JIRA[MMCV-9732,MMCV-6542]
Scenario: Check_that_the_Drop_context_menu_is_displayed_when_the_floating_topic_is_selected
	When User Drag 'TT1' topic on 'ST' topic and hold then release
	Then 'drop-context-menu' dropdown menu is displayed to User
	Then following items is displayed in 'drop-context-menu' dropdown menu
		| items                   |
		| Insert Relationship     |
		| Insert Link             |
		| Insert Reciprocal Links |
		| Drop as Notes           |