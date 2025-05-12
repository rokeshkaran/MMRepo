@retry(2)
Feature: TopicInfoColumn
Check Topic Info Column functionality in Gantt view

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath                     |
		| auto_test_SRND.mmap | GanttViewMode_SimpleMap.mmap |
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Gantt toolbar is displayed to User
	Then following columns are displayed in Gantt Grid:
		| Header     |
		| task_info  |
		| start_date |
		| end_date   |
		| duration   |
		| progress   |
		| priority   |
		| stub       |

@MindManager @Gantt_View @TopicInfoColumn @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2382,WEB-2394,WEB-2386,WEB-2387,WEB-2388] @Upd_Qase
Scenario: To_verify_that_tasks_column_are_displayed_in_Gantt_view
	Then only following headers with text are displayed in Gantt Grid:
		| Header     |
		| Task       |
		| Start Date |
		| Due Date   |
	Then the following data are displayed for task 'MT_1' in Gantt Grid:
		| Column     | Value     |
		| task_info  | MT_1      |
		| start_date | 7/31/2024 |
		| end_date   | 8/1/2024  |
		| duration   | 1d        |
	Then the following icons are displayed for task 'MT_1' in Gantt Grid:
		| Column   | Icon             |
		| progress | percentageDone09 |
		| priority | priority01       |

@MindManager @Gantt_View @TopicInfoColumn @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2383,WEB-2392] @Upd_Qase
Scenario: To_verify_that_progress_and_priority_columns_and_icons_are_displayed_in_Gantt_view
	Then the following icons are displayed for task 'MT_1' in Gantt Grid:
		| Column   | Icon             |
		| progress | percentageDone09 |
		| priority | priority01       |

@MindManager @Gantt_View @TopicInfoColumn @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2383,WEB-2392] @Upd_Qase
Scenario: To_verify_that_progress_and_priority_columns_can_be_empty_in_Gantt_view
	Then the following icons are displayed for task 'ST_1' in Gantt Grid:
		| Column   | Icon |
		| progress |      |
		| priority |      |

@MindManager @Gantt_View @TopicInfoColumn @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2437] @Upd_Qase
Scenario: To_verify_that_progress_column_is_not_displayed_in_Gantt_view_when_no_progres_on_topics
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'standard-view' name in 'view' menu
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User Right clicks 'Task done' icon in 'MT_1' topic
	When User clicks button with 'icon-remove' name in 'topic-contextmenu' menu
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'gantt-view' name in 'view' menu
	Then Gantt toolbar is displayed to User
	Then following columns are displayed in Gantt Grid:
		| Header     |
		| task_info  |
		| start_date |
		| end_date   |
		| duration   |
		| priority   |
		| stub       |

@MindManager @Gantt_View @TopicInfoColumn @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2438] @Upd_Qase
Scenario: To_verify_that_priority_column_is_not_displayed_in_Gantt_view_when_no_progres_on_topics
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'standard-view' name in 'view' menu
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User Right clicks 'Priority 1' icon in 'MT_1' topic
	When User clicks button with 'icon-remove' name in 'topic-contextmenu' menu
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'gantt-view' name in 'view' menu
	Then Gantt toolbar is displayed to User
	Then following columns are displayed in Gantt Grid:
		| Header     |
		| task_info  |
		| start_date |
		| end_date   |
		| duration   |
		| progress   |
		| stub       |

@MindManager @Gantt_View @TopicInfoColumn @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2391] @Upd_Qase
Scenario: To_verify_that_Duration_column_can_be_hide_in_Gantt_view
	When User clicks 'options' button on Gantt toolbar
	Then 'Gantt View' screen is displayed to User
	Then 'Duration' checkbox is checked in the 'Show' section of 'Gantt View' screen
	When User unchecks 'Duration' checkbox in the 'Show' section of 'Gantt View' screen
	Then 'Duration' checkbox is unchecked in the 'Show' section of 'Gantt View' screen
	When User clicks 'OK' button on 'Gantt View' screen
	Then 'Gantt View' screen is not displayed to User
	Then following columns are displayed in Gantt Grid:
		| Header     |
		| task_info  |
		| start_date |
		| end_date   |
		| progress   |
		| priority   |
		| stub       |