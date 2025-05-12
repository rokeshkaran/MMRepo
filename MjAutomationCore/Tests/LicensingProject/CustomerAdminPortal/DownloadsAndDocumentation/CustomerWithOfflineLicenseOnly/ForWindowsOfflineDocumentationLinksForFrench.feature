@retry(2)
Feature: ForWindowsOfflineDocumentationLinksForFrench

Background: Pre-condition
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName        | Seats | ProductId   | EndDate |
		| Automation_testSRND | 1     | MMD-W23-OFF | D(1)    |
	#Admin portal
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	When admin 'Automation_testSRND' accepts BULA terms via API
	When User refresh page
	When admin 'Automation_testSRND' accepts BULA Addendum terms via API
	When User accepts Optanon cookies
	When User clicks 'Téléchargements' button

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OfflineLicense @QA @Staging @Qase[LICENSE-525] @Locale_French @Cleanup
Scenario: To_verify_that_it_is_possible_to_open_User_guide_and_online_help_offline_Locale_French
	When User clicks on 'Guide de l’utilisateur et aide en ligne' link in 'Pour Windows' section
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/fr/support/product-registration/user-manuals-and-online-help/?'
	Then header 'Guides d'utilisation et Aide en ligne' is displayed on MindManager online help page
	When User clicks 'Aide en ligne' link for 'MindManager 24 pour Windows' product on MindManager online help page
	When User switches to '2' tab
	Then page url is 'https://onlinehelp.mindjet.com/24/index.html?app=MindManager&lang=fr'
	When User close Active tab
	When User switches to '1' tab
	When User clicks 'Aide en ligne' link for 'MindManager 23 pour Windows' product on MindManager online help page
	When User switches to '2' tab
	Then page url is 'https://onlinehelp.mindjet.com/23/index.html?app=MindManager&lang=fr'
	When User close Active tab
	When User switches to '1' tab
	When User clicks 'Aide en ligne' link for 'MindManager 22 pour Windows' product on MindManager online help page
	When User switches to '2' tab
	Then page url is 'https://onlinehelp.mindjet.com/22/index.html?app=MindManager&lang=fr'
	When User close Active tab
	When User switches to '1' tab
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

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OfflineLicense @QA @Staging @Qase[LICENSE-531] @Locale_French @Cleanup
Scenario: To_verify_that_it_is_possible_to_open_End_user_language_selection_instructions_offline_Locale_French
	When User clicks on 'Instructions de sélection de la langue de l’utilisateur final' link in 'Pour Windows' section
	When User switches to '1' tab
	Then page url is 'https://download.mindjet.com/MME_End_User_Language_Selector_Instructions_FR.pdf?'

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OfflineLicense @QA @Staging @Qase[LICENSE-517] @Locale_French @Cleanup
Scenario: To_verify_that_it_is_possible_to_open_MindManager_Windows_Release_Notes_offline_Locale_French
	When User clicks on 'Notes sur l’édition' link in 'Pour Windows' section
	When User switches to '1' tab
	# As per MMCV-9409, it is as designed
	Then page url is 'https://download.mindjet.com/MindManager_24_Windows_Release_Notes_EN.pdf?'
	#TODO --->>>Add verification steps for downloading PDF files
