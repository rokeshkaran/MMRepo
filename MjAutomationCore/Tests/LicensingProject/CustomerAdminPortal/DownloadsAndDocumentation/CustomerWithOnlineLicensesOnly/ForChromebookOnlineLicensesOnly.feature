@retry(2)
Feature: ForChromebookOnlineLicensesOnly

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
Scenario Outline: Verify_Installers_for_Chromebook_with_online_licenses_only
	Then following installers are displayed in the 'For Chromebook' section:
		| InstallerTitle  |
		| Get Application |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-494] @Cleanup
Scenario Outline: Verify_documentation_links_for_Chromebook_with_online_licenses_only
	Then following documentation links are displayed in the 'For Chromebook' section:
		| LinkTitle     |
		| Release Notes |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-497] @Cleanup
Scenario Outline: To_verify_that_it_is_possible_to_download_MM_app_for_Chromebook_online
	When User clicks on 'Get Application' installer button in the 'For Chromebook' section
	When User switches to '1' tab
	Then page url is 'https://play.google.com/store/apps/details?id=com.corel.mindmanager.twa'

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-515] @Cleanup
Scenario Outline: To_verify_that_it_is_possible_to_open_Release_Notes_for_Chromebook_online
	When User clicks on 'Release Notes' link in 'For Chromebook' section
	When User switches to '1' tab
	Then page url is 'https://share.mindmanager.com/#publish/9Vz-cnj9jsjZW-I-mjtP2LZhpQ3rwOaG2yD-Mvwq?'

Examples:
	| customerName        |
	| Automation_testSRND |