@retry(2)
Feature: ForChromebookOnlineAndOfflineLicenses

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

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineANDOfflineLicenses @QA @Staging @Qase[LICENSE-483] @Cleanup
Scenario Outline: Verify_Installers_for_Chromebook_with_both_onlineANDoffline_licenses
	Then following installers are displayed in the 'For Chromebook' section:
		| InstallerTitle  |
		| Get Application |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineANDOfflineLicenses @QA @Staging @Qase[LICENSE-483] @Cleanup
Scenario Outline: Verify_documentation_links_for_Chromebook_with_both_onlineANDoffline_licenses
	Then following documentation links are displayed in the 'For Chromebook' section:
		| LinkTitle     |
		| Release Notes |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineANDOfflineLicenses @QA @Staging @Qase[LICENSE-510] @Cleanup
Scenario Outline: To_verify_that_it_is_possible_to_open_Release_Notes_for_Chromebook_with_both_onlineANDoffline_licenses
	When User clicks on 'Release Notes' link in 'For Chromebook' section
	When User switches to '1' tab
	Then page url is 'https://share.mindmanager.com/#publish/9Vz-cnj9jsjZW-I-mjtP2LZhpQ3rwOaG2yD-Mvwq?'

Examples:
	| customerName        |
	| Automation_testSRND |