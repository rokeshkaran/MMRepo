@retry(2)
Feature: ForWindowsOnlineAndOfflineDocumentationLinksForGerman

Background: Pre-condition
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName        | Seats | ProductId      | EndDate |
		| Automation_testSRND | 1     | MMSUBSCRIPTION | D(1)    |
		| Automation_testSRND | 1     | MMD-W23-OFF    | D(1)    |
	#Admin portal
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	When admin 'Automation_testSRND' accepts BULA terms via API
	When User refresh page
	When admin 'Automation_testSRND' accepts BULA Addendum terms via API
	When User accepts Optanon cookies
	When User clicks 'Downloads' button

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineANDOfflineLicenses @QA @Staging @Qase[LICENSE-524] @Locale_German @Cleanup
Scenario: To_verify_that_it_is_possible_to_open_End_user_language_selection_instructions_with_both_onlineANDoffline_licenses_Locale_German
	When User clicks on 'Anleitung zur Sprachauswahl für Endnutzer' link in 'Für Windows' section
	When User switches to '1' tab
	Then page url is 'https://download.mindjet.com/MME_End_User_Language_Selector_Instructions_DE.pdf'

Examples:
	| customerName        |
	| Automation_testSRND |