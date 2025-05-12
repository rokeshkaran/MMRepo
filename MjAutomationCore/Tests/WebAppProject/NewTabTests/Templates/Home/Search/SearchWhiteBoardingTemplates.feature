@retry(2)
Feature: SearchWhiteBoardingTemplates
Check functionality of templates search for WhiteBoarding

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'New' tab on file manager header page
	Then cloud templates page is displayed to User

@MindManager @Templates @Search @SearchWhiteBoarding @App_QA @App_Staging @App_Prod @Qase[WEB-2303,WEB-2304,WEB-2305,WEB-2306] @Upd_Qase @JIRA[MMCV-9946]
Scenario: Verify_template_search_returns_list_of_templates_tagged_as_Whiteboarding_when_searching_by_Whiteboarding_word
	Then search bar is displayed on the cloud template page
	When user enters '<SearchList>' in search input field 'Search for templates by keyword, use cases, or specific attributes' on the cloud template page
	When User presses the 'Enter' key on the keyboard
	Then list of templates is displayed as matching result:
		| templates             |
		| Whiteboard            |
		| Asking 5 Whys         |
		| Business Model Canvas |
		| Lean Canvas Model     |
		| Reverse Brainstorming |
		| Eisenhower Matrix     |
		| SWOT Analysis         |
		| Impact Effort Matrix  |
		| Empathy Map           |
		| Customer Journey Map  |
		| Affinity Diagram      |
Examples:
	| SearchList     | 
	| Whiteboarding  | 
	| White boarding | 
	| White board    | 
	| Whiteboard     |

