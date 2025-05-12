@retry(2)
Feature: Search
Check functionality for templates search

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'New' tab on file manager header page
	Then cloud templates page is displayed to User

@MindManager @Templates @Search @App_QA @App_Staging @App_Prod @Qase[WEB-1110,WEB-1113,WEB-1115] @Upd_Qase
Scenario: Verify_that_search_match_hierarchy_is_as_follows_templatetitle_tags_templatedescription
	Then search bar is displayed on the cloud template page
	When user enters 'chart' in search input field 'template-search-input' on the cloud template page
	Then suggestion result is displayed in search bar:
		| templates                               |
		| Basic Flowchart                         |
		| Organizational Chart                    |
		| Hierarchical Org Chart                  |
		| Cross Functional Flowchart (Horizontal) |
		| Cross Functional Flowchart (Vertical)   |
	When User presses the 'Enter' key on the keyboard
	Then search text 'chart' is still visible in search input field 'template-search-input' on the cloud template page
	Then 'Showing results for “chart”' title is displayed on search results page
	Then list of templates is displayed as matching result:
		| templates                               |
		| Organizational Chart                    |
		| Basic Flowchart                         |
		| Cross Functional Flowchart (Horizontal) |
		| Cross Functional Flowchart (Vertical)   |
		| Hierarchical Org Chart                  |
		| Matrix Organization                     |
		| Customer Journey Map                    |

@MindManager @Templates @Search @App_QA @App_Staging @App_Prod @Qase[WEB-1111] @Upd_Qase
Scenario: Verify_that_the_search_bar_is_highlighted_after_hovering_over
	When User hovers over search bar on cloud template page
	Then search bar is highlighted with 'rgb(0, 0, 255)' color border on cloud template page
	When User moves cursor by '50' '50' coordinates on Canvas
	Then search bar is not highlighted with 'rgb(0, 0, 255)' color border on cloud template page

@MindManager @Templates @Search @App_QA @App_Staging @App_Prod @Qase[WEB-1114] @Upd_Qase
Scenario: Verify_it_is_possible_to_remove_recent_search_result_from_list
	Then search bar is displayed on the cloud template page
	When user enters 'chart' in search input field 'template-search-input' on the cloud template page
	Then suggestion result is displayed in search bar:
		| templates                               |
		| Basic Flowchart                         |
		| Organizational Chart                    |
		| Hierarchical Org Chart                  |
		| Cross Functional Flowchart (Horizontal) |
		| Cross Functional Flowchart (Vertical)   |
	When User clicks on close button in search bar on the cloud template page
	Then suggestion list is not visible in search bar on the cloud template page
	
@MindManager @Templates @Search @App_QA @App_Staging @App_Prod @Qase[WEB-1116] @Upd_Qase
Scenario: Verify_that_hovering_over_a_suggestion_item_triggers_hover_state_highlight
	Then search bar is displayed on the cloud template page
	When user enters 'chart' in search input field 'template-search-input' on the cloud template page
	Then suggestion result is displayed in search bar:
		| templates                               |
		| Basic Flowchart                         |
		| Organizational Chart                    |
		| Hierarchical Org Chart                  |
		| Cross Functional Flowchart (Horizontal) |
		| Cross Functional Flowchart (Vertical)   |
	When User hovers over on suggested result 'Basic Flowchart' in search bar on the cloud template page
	Then suggested result 'Basic Flowchart' is highlighed with 'rgb(105, 105, 105)' color in suggestion list from search results on the cloud template page
	 
@MindManager @Templates @Search @App_QA @App_Staging @App_Prod @Qase[WEB-1117] @Upd_Qase
Scenario: Verify_that_user_is_taken_to_search_results_page_for_selected_item
	Then search bar is displayed on the cloud template page
	When user enters 'chart' in search input field 'template-search-input' on the cloud template page
	When User click on suggested result 'Organizational Chart' in suggestion list from search results on the cloud template page
	Then list of templates is displayed as matching result:
		| templates            |
		| Organizational Chart |
		| Matrix Organization  |

@MindManager @Templates @Search @App_QA @App_Staging @App_Prod @Qase[WEB-1118] @Upd_Qase
Scenario: Verify_Search_is_case_insensitive
	Then search bar is displayed on the cloud template page
	When user enters 'CHART' in search input field 'template-search-input' on the cloud template page
	Then suggestion result is displayed in search bar:
		| templates                               |
		| Basic Flowchart                         |
		| Organizational Chart                    |
		| Hierarchical Org Chart                  |
		| Cross Functional Flowchart (Horizontal) |
		| Cross Functional Flowchart (Vertical)   |
	When User presses the 'Enter' key on the keyboard
	Then list of templates is displayed as matching result:
		| templates                               |
		| Organizational Chart                    |
		| Basic Flowchart                         |
		| Cross Functional Flowchart (Horizontal) |
		| Cross Functional Flowchart (Vertical)   |
		| Hierarchical Org Chart                  |
		| Matrix Organization                     |
		| Customer Journey Map                    |
	When User clicks on close button in search bar on the cloud template page
	When user enters 'chart' in search input field 'template-search-input' on the cloud template page
	Then suggestion result is displayed in search bar:
		| templates                               |
		| Basic Flowchart                         |
		| Organizational Chart                    |
		| Hierarchical Org Chart                  |
		| Cross Functional Flowchart (Horizontal) |
		| Cross Functional Flowchart (Vertical)   |
	When User presses the 'chart' key on the keyboard
	Then list of templates is displayed as matching result:
		| templates                               |
		| Organizational Chart                    |
		| Basic Flowchart                         |
		| Cross Functional Flowchart (Horizontal) |
		| Cross Functional Flowchart (Vertical)   |
		| Hierarchical Org Chart                  |
		| Matrix Organization                     |
		| Customer Journey Map                    |