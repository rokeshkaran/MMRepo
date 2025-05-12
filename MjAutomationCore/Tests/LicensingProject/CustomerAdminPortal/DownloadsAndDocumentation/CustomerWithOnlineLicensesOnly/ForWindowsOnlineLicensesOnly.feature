@retry(2)
Feature: ForWindowsOnlineLicensesOnly
Verify Windows Installers and Documentation for Online Licenses

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
Scenario Outline: Verify_Installers_for_Windows_with_online_licenses_only
	Then following installers are displayed in the 'For Windows' section:
		| InstallerTitle     |
		| Self Installer     |
		| Admin Setup 32-bit |
		| Admin Setup 64-bit |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-494] @Cleanup
Scenario Outline: Verify_documentation_links_for_Windows_with_online_licenses_only
	Then following documentation links are displayed in the 'For Windows' section:
		| LinkTitle                                |
		| Release Notes                            |
		| User guide and online help               |
		| End user language selection instructions |
		| Migration Guide                          |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-503] @Cleanup
Scenario: To_verify_that_it_is_possible_to_download_self_installer_of_Windows_online
	When User clicks on 'Self Installer' installer button in the 'For Windows' section
	Then User checks that file 'MindManager24_setup' was downloaded

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-504] @Cleanup
Scenario: To_verify_that_it_is_possible_to_download_Admin_Setup_32_bit_for_Windows_online
	When User clicks on 'Admin Setup 32-bit' installer button in the 'For Windows' section
	Then User checks that file 'MindManager_32bit_23.1.240_Admin' was downloaded

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-505] @Cleanup
Scenario: To_verify_that_it_is_possible_to_download_Admin_Setup_64_bit_for_Windows_online
	When User clicks on 'Admin Setup 64-bit' installer button in the 'For Windows' section
	Then User checks that file 'MindManager_64bit_23.1.240_Admin' was downloaded

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-512] @Cleanup
Scenario: To_verify_that_it_is_possible_to_open_MindManager_Windows_Release_Notes_online
	When User clicks on 'Release Notes' link in 'For Windows' section
	When User switches to '1' tab
	Then page url is 'https://download.mindjet.com/MindManager_24_Windows_Release_Notes_EN.pdf?'
	#TODO --->>>Add verification steps for downloading PDF files

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-526] @Cleanup
Scenario: To_verify_that_it_is_possible_to_open_User_guide_and_online_help_online
	When User clicks on 'User guide and online help' link in 'For Windows' section
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/en/support/product-registration/user-manuals-and-online-help/?'
	When User clicks 'English Online Help' link for 'MindManager Windows 24' product on MindManager online help page
	When User switches to '2' tab
	Then page url is 'https://onlinehelp.mindjet.com/24/index.html?app=MindManager&lang=en'
	When User close Active tab
	When User switches to '1' tab
	When User clicks 'English Online Help' link for 'MindManager Windows 23' product on MindManager online help page
	When User switches to '2' tab
	Then page url is 'https://onlinehelp.mindjet.com/23/index.html?app=MindManager&lang=en'
	When User close Active tab
	When User switches to '1' tab
	When User clicks 'English Online Help' link for 'MindManager Windows 22' product on MindManager online help page
	When User switches to '2' tab
	Then page url is 'https://onlinehelp.mindjet.com/22/index.html?app=MindManager&lang=en'
	When User close Active tab
	When User switches to '1' tab
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

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-532] @Cleanup
Scenario: To_verify_that_it_is_possible_to_open_End_user_language_selection_instructions_online
	When User clicks on 'End user language selection instructions' link in 'For Windows' section
	When User switches to '1' tab
	Then page url is 'https://download.mindjet.com/MME_End_User_Language_Selector_Instructions_EN.pdf'

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-529] @Cleanup
Scenario: To_verify_that_it_is_possible_to_open_Migration_Guide_online
	When User clicks on 'Migration Guide' link in 'For Windows' section
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/static/mm/docs/MindManagerMigration.pdf'

Examples:
	| customerName        |
	| Automation_testSRND |