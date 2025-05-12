@retry(2)
Feature: ForMacOfflineDocumentationLinksForFrench

Background: Pre-condition
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName        | Seats | ProductId      | EndDate |
		| Automation_testSRND | 1     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	When admin 'Automation_testSRND' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User clicks 'Téléchargements' button

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OfflineLicense @QA @Staging @Qase[LICENSE-533,LICENSE-534] @Locale_French @Cleanup
Scenario Outline: To_verify_that_it_is_possible_to_open_Online_help_from_Mac_section_offline_Locale_French
	When User clicks on 'Aide en ligne' link in 'Pour Mac' section
	When User switches to '1' tab
	When User waits for data loading
	Then page url is 'https://www.mindmanager.com/fr/support/product-registration/user-manuals-and-online-help/?'
	When User clicks 'Aide en ligne' link for 'MindManager 24 pour Mac' product on MindManager online help page
	When User switches to '2' tab
	Then page url is 'https://help.mindjet.com/24/index.html?app=MindManager&lang=fr'
	When User close Active tab
	When User switches to '1' tab
	When User clicks 'Aide en ligne' link for 'MindManager 23 pour Mac' product on MindManager online help page
	When User switches to '2' tab
	Then page url is 'https://help.mindjet.com/23/index.html?app=MindManager&lang=en'
	When User close Active tab
	When User switches to '1' tab
	When User clicks 'Aide en ligne' link for 'MindManager 14 pour Mac' product on MindManager online help page
	When User switches to '2' tab
	Then page url is 'https://help.mindjet.com/22/index.html?app=MindManager&lang=fr'

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OfflineLicense @QA @Staging @Qase[LICENSE-518] @Locale_French @Cleanup
Scenario Outline: To_verify_that_it_is_possible_to_open_MindManager_Mac_Release_Notes_offline_Locale_French
	When User clicks on 'Notes sur l’édition' link in 'Pour Mac' section
	When User switches to '1' tab
	# As per MMCV-9409, it is as designed
	Then page url is 'https://download.mindjet.com/MindManager_24_Mac_Release_Notes_EN.pdf?'