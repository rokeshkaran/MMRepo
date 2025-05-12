@retry(2)
Feature: TopicInfoColumnDefaultSetting
Check Topic Info Column default functionality for Gantt view

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks on 'search' button in the template side menu on cloud template page
	Then all templates are displayed on the cloud template page
	When User right clicks on 'anyRandom' template card on cloud template page
	Then 'cloud-templates-context-menu' Menu is displayed to User
	When User clicks button with 'blank' name in 'cloud-templates-context-menu' menu
	Then Web Editor page is displayed to the User
	When User remembers mindmanager cloud template map details from '/' directory via API
	When User clicks 'Add floating topic' button on Tools panel
	When User add floating topic by coordinates '30', '30' to the Canvas
	When User enters text 'Topic1' using keyboard
	When User presses the 'Enter' key on the keyboard
	When User clicks 'Task Information' button of side Toolbox
	When User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 1' Icon is displayed to the 'Topic1' Topic
	When User clicks '50% done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '50% done' Icon is displayed to the 'Topic1' Topic
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '05/02/2023' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '05/02/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'gantt-view' name in 'view' menu
	Then Gantt toolbar is displayed to User

@MindManager @Gantt_View @TopicInfoColumn @TopicInfoColumnDefaultSetting @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2384] @Upd_Qase @JIRA[MMCV-10629]
Scenario: To_verify_that_Progress_column_can_be_hide_in_Gantt_view
	Then following columns are displayed in Gantt Grid:
		| Header     |
		| task_info  |
		| start_date |
		| end_date   |
		| progress   |
		| priority   |
		| stub       |
	When User clicks 'options' button on Gantt toolbar
	Then 'Gantt View' screen is displayed to User
	Then 'Progress' checkbox is checked in the 'Show' section of 'Gantt View' screen
	When User unchecks 'Progress' checkbox in the 'Show' section of 'Gantt View' screen
	Then 'Progress' checkbox is unchecked in the 'Show' section of 'Gantt View' screen
	When User clicks 'OK' button on 'Gantt View' screen
	Then 'Gantt View' screen is not displayed to User
	Then following columns are displayed in Gantt Grid:
		| Header     |
		| task_info  |
		| start_date |
		| end_date   |
		| priority   |
		| stub       |

@MindManager @Gantt_View @TopicInfoColumn @TopicInfoColumnDefaultSetting @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2393] @Upd_Qase @JIRA[MMCV-10629]
Scenario: To_verify_that_Priority_column_can_be_hide_in_Gantt_view
	Then following columns are displayed in Gantt Grid:
		| Header     |
		| task_info  |
		| start_date |
		| end_date   |
		| progress   |
		| priority   |
		| stub       |
	When User clicks 'options' button on Gantt toolbar
	Then 'Gantt View' screen is displayed to User
	Then 'Priority' checkbox is checked in the 'Show' section of 'Gantt View' screen
	When User unchecks 'Priority' checkbox in the 'Show' section of 'Gantt View' screen
	Then 'Priority' checkbox is unchecked in the 'Show' section of 'Gantt View' screen
	When User clicks 'OK' button on 'Gantt View' screen
	Then 'Gantt View' screen is not displayed to User
	Then following columns are displayed in Gantt Grid:
		| Header     |
		| task_info  |
		| start_date |
		| end_date   |
		| progress   |
		| stub       |

@MindManager @Gantt_View @TopicInfoColumn @TopicInfoColumnDefaultSetting @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2389] @Upd_Qase @JIRA[MMCV-10629]
Scenario: To_verify_that_Start_Date_column_can_be_hide_in_Gantt_view
	Then following columns are displayed in Gantt Grid:
		| Header     |
		| task_info  |
		| start_date |
		| end_date   |
		| progress   |
		| priority   |
		| stub       |
	When User clicks 'options' button on Gantt toolbar
	Then 'Gantt View' screen is displayed to User
	Then 'Start Date' checkbox is checked in the 'Show' section of 'Gantt View' screen
	When User unchecks 'Start Date' checkbox in the 'Show' section of 'Gantt View' screen
	Then 'Start Date' checkbox is unchecked in the 'Show' section of 'Gantt View' screen
	When User clicks 'OK' button on 'Gantt View' screen
	Then 'Gantt View' screen is not displayed to User
	Then following columns are displayed in Gantt Grid:
		| Header     |
		| task_info  |
		| end_date   |
		| progress   |
		| priority   |
		| stub       |

@MindManager @Gantt_View @TopicInfoColumn @TopicInfoColumnDefaultSetting @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2390] @Upd_Qase @JIRA[MMCV-10629]
Scenario: To_verify_that_Due_Date_column_can_be_hide_in_Gantt_view
	Then following columns are displayed in Gantt Grid:
		| Header     |
		| task_info  |
		| start_date |
		| end_date   |
		| progress   |
		| priority   |
		| stub       |
	When User clicks 'options' button on Gantt toolbar
	Then 'Gantt View' screen is displayed to User
	Then 'Due Date' checkbox is checked in the 'Show' section of 'Gantt View' screen
	When User unchecks 'Due Date' checkbox in the 'Show' section of 'Gantt View' screen
	Then 'Due Date' checkbox is unchecked in the 'Show' section of 'Gantt View' screen
	When User clicks 'OK' button on 'Gantt View' screen
	Then 'Gantt View' screen is not displayed to User
	Then following columns are displayed in Gantt Grid:
		| Header     |
		| task_info  |
		| start_date |
		| progress   |
		| priority   |
		| stub       |

@MindManager @Gantt_View @TopicInfoColumn @TopicInfoColumnDefaultSetting @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2391] @Upd_Qase @JIRA[MMCV-10629]
Scenario: To_verify_that_Duration_column_can_be_shown_in_Gantt_view
	Then following columns are displayed in Gantt Grid:
		| Header     |
		| task_info  |
		| start_date |
		| end_date   |
		| progress   |
		| priority   |
		| stub       |
	When User clicks 'options' button on Gantt toolbar
	Then 'Gantt View' screen is displayed to User
	Then 'Duration' checkbox is unchecked in the 'Show' section of 'Gantt View' screen
	When User checks 'Duration' checkbox in the 'Show' section of 'Gantt View' screen
	Then 'Duration' checkbox is checked in the 'Show' section of 'Gantt View' screen
	When User clicks 'OK' button on 'Gantt View' screen
	Then 'Gantt View' screen is not displayed to User
	Then following columns are displayed in Gantt Grid:
		| Header     |
		| task_info  |
		| start_date |
		| end_date   |
		| duration   |
		| progress   |
		| priority   |
		| stub       |