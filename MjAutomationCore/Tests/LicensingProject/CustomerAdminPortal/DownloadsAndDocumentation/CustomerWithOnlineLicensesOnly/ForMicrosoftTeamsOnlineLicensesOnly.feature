@retry(2)
Feature: ForMicrosoftTeamsOnlineLicensesOnly

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
Scenario Outline: Verify_Installers_for_Microsoft_Teams_with_online_licenses_only
	Then following installers are displayed in the 'For Microsoft Teams' section:
		| InstallerTitle                  |
		| Get it from Microsoft AppSource |
		| Download App Manifest           |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-494] @Cleanup
Scenario Outline: Verify_documentation_links_for_Microsoft_Teams_with_online_licenses_only
	Then following documentation links are displayed in the 'For Microsoft Teams' section:
		| LinkTitle                       |
		| Overview Video                  |
		| Release Notes                   |
		| Installation instructions       |
		| Microsoft Publisher Attestation |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-496] @Cleanup
Scenario Outline: To_verify_that_it_is_possible_to_get_MM_Teams_from_Microsoft_app_source_online
	When User clicks on 'Get it from Microsoft AppSource' installer button in the 'For Microsoft Teams' section
	When User switches to '1' tab
	Then page url is 'https://appsource.microsoft.com/en-us/product/office/WA200002261'

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-495] @Cleanup
Scenario Outline: To_verify_that_it_is_possible_to_download_App_Manifest_online
	When User clicks on 'Download App Manifest' installer button in the 'For Microsoft Teams' section
	Then User checks that file 'MindManager_Teams_Manifest' was downloaded

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-522] @Cleanup
Scenario Outline: To_verify_that_it_is_possible_to_open_MM_Teams_Release_Notes_online
	When User clicks on 'Release Notes' link in 'For Microsoft Teams' section
	When User switches to '1' tab
	Then page url is 'https://share.mindmanager.com/#publish/9Vz-cnj9jsjZW-I-mjtP2LZhpQ3rwOaG2yD-Mvwq?'

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-537] @Cleanup
Scenario Outline: To_verify_that_it_is_possible_to_open_Overview_Video_online
	When User clicks on 'Overview Video' link in 'For Microsoft Teams' section
	When User switches to '1' tab
	Then page url is 'https://vimeo.com/'

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-538] @Cleanup
Scenario Outline: To_verify_that_it_is_possible_to_open_Installation_instructions_online
	When User clicks on 'Installation instructions' link in 'For Microsoft Teams' section
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/static/mm/docs/2021/teams-quick-start-guide-en.pdf?'
	#TODO --->>>Add verification steps for downloading PDF files

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-543] @Cleanup
Scenario Outline: To_verify_that_it_is_possible_to_open_Microsoft_Publisher_Attestation_online
	When User clicks on 'Microsoft Publisher Attestation' link in 'For Microsoft Teams' section
	When User switches to '1' tab
	Then page url is 'https://learn.microsoft.com/en-us/microsoft-365-app-certification/teams/corel-mindmanager?'

Examples:
	| customerName        |
	| Automation_testSRND |