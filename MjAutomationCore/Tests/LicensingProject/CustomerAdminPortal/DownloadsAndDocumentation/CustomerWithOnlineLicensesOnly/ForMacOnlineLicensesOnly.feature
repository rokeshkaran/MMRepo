@retry(2)
Feature: ForMacOnlineLicensesOnly

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
	When User clicks 'Downloads' button

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-494] @Cleanup
Scenario Outline: Verify_Installers_for_Mac_with_online_licenses_only
	Then following installers are displayed in the 'For Mac' section:
		| InstallerTitle |
		| Installer      |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-494] @Cleanup
Scenario Outline: Verify_documentation_links_for_Mac_with_online_licenses_only
	Then following documentation links are displayed in the 'For Mac' section:
		| LinkTitle     |
		| Release Notes |
		| Online help   |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-507] @Cleanup
Scenario Outline: To_verify_that_it_is_possible_to_download_Installer_for_Mac_online
	When User clicks on 'Installer' installer button in the 'For Mac' section
	Then User checks that file 'MindManager_Mac_24.1.155.dmg' was downloaded

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-513] @Cleanup
Scenario Outline: To_verify_that_it_is_possible_to_open_MindManager_Mac_Release_Notes_online
	When User clicks on 'Release Notes' link in 'For Mac' section
	When User switches to '1' tab
	Then page url is 'https://download.mindjet.com/MindManager_24_Mac_Release_Notes_EN.pdf'

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-534] @Cleanup
Scenario Outline: To_verify_that_it_is_possible_to_open_Online_help_from_Mac_section_online
	When User clicks on 'Online help' link in 'For Mac' section
	When User switches to '1' tab
	When User waits for data loading
	Then page url is 'https://www.mindmanager.com/en/support/product-registration/user-manuals-and-online-help/?'
	When User clicks 'Online Help' link for 'MindManager Mac 24' product on MindManager online help page
	When User switches to '2' tab
	Then page url is 'https://help.mindjet.com/24/index.html?app=MindManager&lang=en'
	When User close Active tab
	When User switches to '1' tab
	When User clicks 'Online Help' link for 'MindManager Mac 23' product on MindManager online help page
	When User switches to '2' tab
	Then page url is 'https://help.mindjet.com/23/index.html?app=MindManager&lang=en'
	When User close Active tab
	When User switches to '1' tab
	When User clicks 'Online Help' link for 'MindManager Mac 22 (14)' product on MindManager online help page
	When User switches to '2' tab
	Then page url is 'https://help.mindjet.com/22/index.html?app=MindManager&lang=en'

Examples:
	| customerName        |
	| Automation_testSRND |