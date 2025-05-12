@retry(2)
Feature: ForMacOnlineAndOfflineDocumentationLinksForFrench

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
	When User clicks 'Téléchargements' button

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineANDOfflineLicenses @QA @Staging @Qase[LICENSE-508] @Locale_French @Cleanup
Scenario Outline: To_verify_that_it_is_possible_to_open_MindManager_Mac_Release_Notes_with_both_onlineANDoffline_licenses_Locale_French
	When User clicks on 'Notes sur l’édition' link in 'Pour Mac' section
	When User switches to '1' tab
	# As per MMCV-9409, it is as designed
	Then page url is 'https://download.mindjet.com/MindManager_24_Mac_Release_Notes_EN.pdf'