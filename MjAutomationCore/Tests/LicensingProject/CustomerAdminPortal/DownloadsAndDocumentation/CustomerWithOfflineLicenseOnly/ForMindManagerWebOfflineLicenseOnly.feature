@retry(2)
Feature: ForMindManagerWebOfflineLicenseOnly

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
	When User clicks 'Downloads' button

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OfflineLicense @QA @Staging @Qase[LICENSE-493] @Cleanup
Scenario Outline: Verify_Installers_for_MindManager_Web_with_offline_licenses_only
	Then following installers are displayed in the 'For MindManager Web' section:
		| InstallerTitle |
		| Sign In        |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OfflineLicense @QA @Staging @Qase[LICENSE-493] @Cleanup
Scenario Outline: Verify_documentation_links_for_MindManager_Web_with_offline_licenses_only
	Then following documentation links are displayed in the 'For MindManager Web' section:
		| LinkTitle     |
		| Release Notes |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OfflineLicense @QA @Staging @Qase[LICENSE-502] @Cleanup
Scenario Outline: To_verify_that_it_is_possible_to_log_in_to_Web_app_offline
	When User clicks on 'Sign In' installer button in the 'For MindManager Web' section
	When User switches to '1' tab
	Then page url is 'https://cloud.mindmanager.com/authenticate?'
	Then User sees 'Welcome' header on Right Side panel
	When User clicks 'Sign In' button
	When User enters 'automation.prodmj@gmail.com' in the 'email' field
	When User enters 'yl5gD3GeSoHgdj9^C' in the 'password' field
	When User clicks 'Sign In' button
	Then file manager header page is displayed to User

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OfflineLicense @QA @Staging @Qase[LICENSE-521] @Cleanup
Scenario: To_verify_that_it_is_possible_to_open_MindManager_Web_Release_Notes_offline
	When User clicks on 'Release Notes' link in 'For MindManager Web' section
	When User switches to '1' tab
	Then page url is 'https://share.mindmanager.com/#publish/9Vz-cnj9jsjZW-I-mjtP2LZhpQ3rwOaG2yD-Mvwq'

Examples:
	| customerName        |
	| Automation_testSRND |