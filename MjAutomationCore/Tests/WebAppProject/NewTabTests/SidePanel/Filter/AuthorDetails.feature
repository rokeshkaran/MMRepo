@retry(2)
Feature: AuthorDetails
	Check Author Details function in filter panel

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath     |
		| auto_test_SRND.mmap | MapInfo.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Filter' button of side Toolbox

@MindManager @Side_Panel @Filter_Panel @AuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2525] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_Topic_Author_Details_is_available_in_the_Filter_tab_on_the_Side_panel
	Then 'This file does not contain any content that can be used by these filters.' text of empty content is displayed in 'General' section of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Map Info' section is displayed on 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Created' subsection is displayed on 'Map Info' section on 'PanelWithMenuButton' side panel with 'Filter' header
	Then checkbox is displayed in 'creatorDate' row in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'icon_calendar.svg' icon is displayed in 'creatorDate' row in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'date-picker' input is displayed in 'creatorDate' row in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then User name 'Automation_MJ Automation' is displayed in 'creator_Automation_MJ Automation' row in the 'Created' subsection of 'Map Info' section with 'Filter' header
	When User clicks 'Central Topic' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	Then 'Last modified' subsection is displayed on 'Map Info' section on 'PanelWithMenuButton' side panel with 'Filter' header
	Then checkbox is displayed in 'modificatorDate' row in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'icon_calendar.svg' icon is displayed in 'modificatorDate' row in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'date-picker' input is displayed in 'modificatorDate' row in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then User name 'Automation_MJ Automation' is displayed in 'modificator_Automation_MJ Automation' row in the 'Last modified' subsection of 'Map Info' section with 'Filter' header

@MindManager @Side_Panel @Filter_Panel @AuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2529] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_Created_Topic_Author_Details_can_be_use_to_hide_topic
	When User clicks 'Hide' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then radio button 'all' is checked on Filter popup
	Then 'Topic 1' topic is displayed on Canvas
	Then 'Test' topic is displayed on Canvas
	When User checks 'creator_Automation_MJ Automation' checkbox in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'creator_Automation_MJ Automation' checkbox is selected in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'Topic 1' topic is not displayed on Canvas
	When User checks 'creator_MM_Tests_1 MM_Tests_1' checkbox in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'creator_MM_Tests_1 MM_Tests_1' checkbox is selected in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'Test' topic is not displayed on Canvas

@MindManager @Side_Panel @Filter_Panel @AuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2530] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_LastModified_Topic_Author_Details_can_be_use_to_hide_topic
	When User clicks 'Hide' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then radio button 'all' is checked on Filter popup
	Then 'Topic 1' topic is displayed on Canvas
	Then 'Test' topic is displayed on Canvas
	When User checks 'modificator_Automation_MJ Automation' checkbox in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'modificator_Automation_MJ Automation' checkbox is selected in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'Topic 1' topic is not displayed on Canvas
	When User checks 'modificator_MM_Tests_1 MM_Tests_1' checkbox in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'modificator_MM_Tests_1 MM_Tests_1' checkbox is selected in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'Test' topic is not displayed on Canvas

@MindManager @Side_Panel @Filter_Panel @AuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2533] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_Created_Topic_Author_Details_can_be_use_to_Fade_topic
	When User clicks 'Fade' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then radio button 'all' is checked on Filter popup
	Then 'Topic 1' topic is displayed on Canvas
	Then 'Test' topic is displayed on Canvas
	When User checks 'creator_Automation_MJ Automation' checkbox in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'creator_Automation_MJ Automation' checkbox is selected in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'Topic 1' is displayed with at 50 percent opacity on Canvas
	When User checks 'creator_MM_Tests_1 MM_Tests_1' checkbox in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'creator_MM_Tests_1 MM_Tests_1' checkbox is selected in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'Test' is displayed with at 50 percent opacity on Canvas

@MindManager @Side_Panel @Filter_Panel @AuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2534] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_LastModified_Topic_Author_Details_can_be_use_to_Fade_topic
	When User clicks 'Fade' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then radio button 'all' is checked on Filter popup
	Then 'Topic 1' topic is displayed on Canvas
	Then 'Test' topic is displayed on Canvas
	When User checks 'modificator_Automation_MJ Automation' checkbox in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'modificator_Automation_MJ Automation' checkbox is selected in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'Topic 1' is displayed with at 50 percent opacity on Canvas
	When User checks 'modificator_MM_Tests_1 MM_Tests_1' checkbox in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'modificator_MM_Tests_1 MM_Tests_1' checkbox is selected in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'Test' is displayed with at 50 percent opacity on Canvas

@MindManager @Side_Panel @Filter_Panel @AuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2542] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_topic_author_details_can_be_used_in_filters
	When User clicks 'Show' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then radio button 'all' is checked on Filter popup
	Then 'date-picker' input is displayed in 'creatorDate' row in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then User name 'Automation_MJ Automation' is displayed in 'creator_Automation_MJ Automation' row in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then User name 'MM_Tests_1 MM_Tests_1' is displayed in 'creator_MM_Tests_1 MM_Tests_1' row in the 'Created' subsection of 'Map Info' section with 'Filter' header
	When User checks 'creator_Automation_MJ Automation' checkbox in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'Topic 1' topic is displayed on Canvas
	Then menu button with 'filter' name is displayed in 'status-missing-info' state on Overlay panel
	Then text 'Map information hidden byFilters' is displayed in toast notification on Overlay panel
	When User checks 'creator_Automation_MJ Automation' checkbox in the 'Created' subsection of 'Map Info' section with 'Filter' header
	When User checks 'creator_MM_Tests_1 MM_Tests_1' checkbox in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'Test' topic is displayed on Canvas
	Then menu button with 'filter' name is displayed in 'status-missing-info' state on Overlay panel
	Then text 'Map information hidden byFilters' is displayed in toast notification on Overlay panel

@MindManager @Side_Panel @Filter_Panel @AuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2543] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_Created_Topic_Author_Details_can_be_use_to_Show_topic
	When User clicks 'Show' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then radio button 'all' is checked on Filter popup
	Then 'Topic 1' topic is displayed on Canvas
	Then 'Test' topic is displayed on Canvas
	When User checks 'creator_Automation_MJ Automation' checkbox in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'creator_Automation_MJ Automation' checkbox is selected in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'Topic 1' topic is displayed on Canvas
	Then 'Test' topic is not displayed on Canvas
	When User checks 'creator_Automation_MJ Automation' checkbox in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'creator_MM_Tests_1 MM_Tests_1' checkbox is NOT selected in the 'Created' subsection of 'Map Info' section with 'Filter' header
	When User checks 'creator_MM_Tests_1 MM_Tests_1' checkbox in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'creator_MM_Tests_1 MM_Tests_1' checkbox is selected in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'Topic 1' topic is not displayed on Canvas
	Then 'Test' topic is displayed on Canvas

@MindManager @Side_Panel @Filter_Panel @AuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2544] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_LastModified_Topic_Author_Details_can_be_use_to_Show_topic
	When User clicks 'Show' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then radio button 'all' is checked on Filter popup
	When User checks 'modificator_Automation_MJ Automation' checkbox in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'modificator_Automation_MJ Automation' checkbox is selected in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'Topic 1' topic is displayed on Canvas
	Then 'Test' topic is not displayed on Canvas
	When User checks 'modificator_Automation_MJ Automation' checkbox in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'modificator_MM_Tests_1 MM_Tests_1' checkbox is NOT selected in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	When User checks 'modificator_MM_Tests_1 MM_Tests_1' checkbox in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'modificator_MM_Tests_1 MM_Tests_1' checkbox is selected in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'Topic 1' topic is not displayed on Canvas
	Then 'Test' topic is displayed on Canvas

@MindManager @Side_Panel @Filter_Panel @AuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2531] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_Created_Topic_Author_Details_can_be_use_to_Show_Fade_Hide_topic_via_Today_filter
	When User clicks 'Add floating topic' button on Tools panel
	When User add floating topic by coordinates '100', '50' to the Canvas
	Then 'Floating Topic' topic is displayed on Canvas
	When User clicks 'Show' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then radio button 'all' is checked on Filter popup
	When User checks 'creatorDate' checkbox in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'creatorDate' checkbox is selected in the 'Created' subsection of 'Map Info' section with 'Filter' header
	Then 'Topic 1' topic is not displayed on Canvas
	Then 'Test' topic is not displayed on Canvas
	Then 'Floating Topic' topic is displayed on Canvas
	When User clicks 'Fade' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Topic 1' topic is displayed on Canvas
	Then 'Floating Topic' is displayed with at 50 percent opacity on Canvas
	When User clicks 'Hide' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Topic 1' topic is displayed on Canvas
	Then 'Test' topic is displayed on Canvas
	Then 'Floating Topic' topic is not displayed on Canvas

@MindManager @Side_Panel @Filter_Panel @AuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2532] @Upd_Qase @Build_24.0.107
Scenario: Verify_that_LastModified_Topic_Author_can_be_use_to_Show_Fade_Hide_topic_via_Today_filter
	When User clicks 'Topic 1' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'Show' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then radio button 'all' is checked on Filter popup
	When User checks 'modificatorDate' checkbox in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'modificatorDate' checkbox is selected in the 'Last modified' subsection of 'Map Info' section with 'Filter' header
	Then 'Topic 1' topic is displayed on Canvas
	Then 'Test' topic is not displayed on Canvas
	When User clicks 'Fade' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Test' topic is displayed on Canvas
	Then 'Topic 1' is displayed with at 50 percent opacity on Canvas
	When User clicks 'Hide' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Topic 1' topic is not displayed on Canvas
	Then 'Test' topic is displayed on Canvas