@retry(2)
Feature: DropContextMenuInFlowchart
Check functionality of topic drop context menu in Flowchart

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | FlowchartMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @Topics @DropContextMenuInFlowchart @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-291] @Upd_Qase @JIRA[MMCV-9732]
Scenario: Insert_relationship_in_Flowchart
	When User Drag 'TT1' topic on 'ST' topic and hold then release
	When User clicks 'Insert Relationship' item in 'drop-context-menu' dropdown menu
	Then '3' relationship lines are displayed on Canvas

@MindManager @EditingCapabilities @Topics @DropContextMenuInFlowchart @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-293] @Upd_Qase @JIRA[MMCV-9732]
Scenario: Insert_link_in_Flowchart
	When User Drag 'TT1' topic on 'TT2' topic and hold then release
	When User clicks 'Insert Link' item in 'drop-context-menu' dropdown menu
	Then 'TT1' item is displayed in 'Related Topics' section of 'PanelByName' side panel with 'Attachments & Links' header
	Then 'TT1' Link title is displayed to the 'TT2' topic infobox