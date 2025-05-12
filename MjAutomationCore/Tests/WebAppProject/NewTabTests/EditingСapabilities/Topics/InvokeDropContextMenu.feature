@retry(2)
Feature: InvokeDropContextMenu
Check the functionality of topic drop context menu

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @Topics @InvokeDragContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-285] @Upd_Qase @JIRA[MMCV-9732,MMCV-6542]
Scenario: Check_that_the_Drop_context_menu_is_displayed_when_the_Main_topic_is_selected
	When User Drag 'MT1' topic on 'MT3' topic and hold then release
	Then 'drop-context-menu' dropdown menu is displayed to User
	Then following items is displayed in 'drop-context-menu' dropdown menu
		| items                          |
		| Insert Relationship            |
		| Insert Link                    |
		| Insert Reciprocal Links        |
		| Drop as Subtopic               |
		| Drop as Sibling Topic Before   |
		| Drop as Sibling Topic After    |
		| Drop as Notes                  |

@MindManager @EditingCapabilities @Topics @InvokeDragContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-286] @Upd_Qase @JIRA[MMCV-9732]
Scenario: Check_that_the_Drop_context_menu_is_displayed_when_the_Subtopic_is_selected
	When User Drag 'MT1ST1ST' topic on 'MT1' topic and hold then release
	Then 'drop-context-menu' dropdown menu is displayed to User
	Then following items is displayed in 'drop-context-menu' dropdown menu
		| items                        |
		| Insert Relationship          |
		| Insert Link                  |
		| Drop as Subtopic             |
		| Drop as Parent Topic         |
		| Drop as Sibling Topic Before |
		| Drop as Sibling Topic After  |
		| Drop as Note                 |

@MindManager @EditingCapabilities @Topics @InvokeDragContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-287] @Upd_Qase @JIRA[MMCV-3715]
Scenario: Check_that_the_Drop_context_menu_is_displayed_when_the_Callout_is_selected
	Then User set zoom level to '80' via the side tool bar
	When User clicks 'RL1' topic on Canvas
	When User Drag 'RL1' topic around Canvas then hold on 'MT1' topic then release
	Then 'drop-context-menu' dropdown menu is displayed to User
	Then following items is displayed in 'drop-context-menu' dropdown menu
		| items                        |
		| Insert Relationship          |
		| Insert Link                  |
		| Insert Reciprocal Links      |
		| Drop as Callout              |
		| Drop as Subtopic             |
		| Drop as Sibling Topic Before |
		| Drop as Sibling Topic After  |
		| Drop as Notes                |

@MindManager @EditingCapabilities @Topics @InvokeDragContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-288] @Upd_Qase @JIRA[MMCV-9732]
Scenario: Check_that_the_Drop_context_menu_is_displayed_when_the_floating_topic_is_selected
	When User Drag 'FT2' topic on 'MT1' topic and hold then release
	Then 'drop-context-menu' dropdown menu is displayed to User
	Then following items is displayed in 'drop-context-menu' dropdown menu
		| items                        |
		| Insert Relationship          |
		| Insert Link                  |
		| Drop as Subtopic             |
		| Drop as Sibling Topic Before |
		| Drop as Sibling Topic After  |
		| Drop as Note                 |