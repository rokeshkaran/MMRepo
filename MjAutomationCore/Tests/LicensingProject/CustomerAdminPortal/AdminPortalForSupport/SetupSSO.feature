@retry(2)
Feature: SetupSSO
To verify the 'Setup SSO' menu in Admin in read-only mode

@Licensing @CustomerAdminPortal @AdminPortalForSupport @SetupSSO @QA @Staging @Qase[LICENSE-417] @Cleanup @LC_Upd @Upd_Qase @JIRA[MMCV-10518]
Scenario: To_verify_New_setup_SSO_page_in_read_only_mode
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	And User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 5     | MMSUBSCRIPTION | D(2)    |
	#Admin portal
	And User is logged in to '<customerName>' customer on Admin portal via Api
	And admin '<customerName>' accepts BULA terms via API
	And User refresh page
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	And User clicks 'Sign In' button
	And User provides the Password from company account and clicks on Sign In button
	And User waits for data loading
	And User selects 'Customer Search' search option on Action panel
	And User enters '<customerName>' value in the 'search-input' field on Action panel
	And User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'View Admin' button
	And User switches to '1' tab
	Then User sees '<customerName> Admin Home' page header
	And '(read only)' mark is displayed on section header
	When User clicks 'Setup SSO' button
	Then 'client_id' input field is disabled on the page
	And 'client_secret' input field is disabled on the page
	And 'token_expiration' input field is disabled on the page
	And 'directory_id' input field is disabled on the page
	And 'connected_domains' input field is disabled on the page
	And 'submit' input field is disabled on the page
	And SSO step button 'new' is Active on left panel
	And Following SSO steps are displayed:
		| SSO step            |
		| new                 |
		| domain-verification |
		| ready-for-testing   |
		| ready-to-activate   |
		| activated           |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @AdminPortalForSupport @SetupSSO @QA @Staging @Qase[LICENSE-421] @Cleanup @LC_Upd @Upd_Qase @JIRA[MMCV-10518]
Scenario: To_verify_ready_to_activate_page_in_read_only_mode
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	And User clicks 'Sign In' button
	And User provides the Password from company account and clicks on Sign In button
	And User waits for data loading
	And User selects 'Customer Search' search option on Action panel
	And User enters '<customerName>' value in the 'search-input' field on Action panel
	And User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'View Admin' button
	And User switches to '1' tab
	Then User sees '<customerName> Admin Home' page header
	And '(read only)' mark is displayed on section header
	When User clicks 'Setup SSO' button
	Then Folowing SSO steps have Done status:
		| SSO step            |
		| new                 |
		| domain-verification |
		| ready-for-testing   |
	And SSO step button 'ready-to-activate' is Active on left panel
	And Following SSO steps are displayed:
		| SSO step            |
		| new                 |
		| domain-verification |
		| ready-for-testing   |
		| ready-to-activate   |
		| activated           |
	And 'Activate SSO' button is disabled on setup SSO page
	And 'Back' button is enabled on setup SSO page
	When User clicks 'Back' button on setup SSO page

Examples:
	| customerName                               |
	| Automation_test_SSO_ReadyToActivate_status |

@Licensing @CustomerAdminPortal @AdminPortalForSupport @SetupSSO @QA @Staging @Qase[LICENSE-422] @Cleanup @LC_Upd @Upd_Qase @JIRA[MMCV-10518]
Scenario: To_verify_ready_for_testing_page_in_read-only_mode
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	And User clicks 'Sign In' button
	And User provides the Password from company account and clicks on Sign In button
	And User waits for data loading
	And User selects 'Customer Search' search option on Action panel
	And User enters '<customerName>' value in the 'search-input' field on Action panel
	And User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'View Admin' button
	And User switches to '1' tab
	Then User sees '<customerName> Admin Home' page header
	And '(read only)' mark is displayed on section header
	When User clicks 'Setup SSO' button
	And User clicks 'Back' button on setup SSO page
	Then SSO step button 'ready-for-testing' is Active on left panel
	And Folowing SSO steps have Done status:
		| SSO step            |
		| new                 |
		| domain-verification |
		| ready-for-testing   |
	And Following SSO steps are displayed:
		| SSO step            |
		| new                 |
		| domain-verification |
		| ready-for-testing   |
		| ready-to-activate   |
		| activated           |
	And hyperlink 'open a support ticket' is disabled
	And 'Back' button is enabled on setup SSO page
	And 'Test SSO' button is disabled on setup SSO page

Examples:
	| customerName                               |
	| Automation_test_SSO_ReadyToActivate_status |

@Licensing @CustomerAdminPortal @AdminPortalForSupport @SetupSSO @QA @Staging @Qase[LICENSE-420] @Cleanup @LC_Upd @Upd_Qase @JIRA[MMCV-10518]
Scenario: To_verify_domain_verification_page_in_read-only_mode
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	And User clicks 'Sign In' button
	And User provides the Password from company account and clicks on Sign In button
	And User waits for data loading
	And User selects 'Customer Search' search option on Action panel
	And User enters '<customerName>' value in the 'search-input' field on Action panel
	And User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'View Admin' button
	And User switches to '1' tab
	Then User sees '<customerName> Admin Home' page header
	And '(read only)' mark is displayed on section header
	When User clicks 'Setup SSO' button
	And User clicks 'Back' button on setup SSO page
	And User clicks 'Back' button on setup SSO page
	Then SSO step button 'domain-verification' is Active on left panel
	And Folowing SSO steps have Done status:
		| SSO step            |
		| new                 |
		| domain-verification |
		| ready-for-testing   |
	And Following SSO steps are displayed:
		| SSO step            |
		| new                 |
		| domain-verification |
		| ready-for-testing   |
		| ready-to-activate   |
		| activated           |
	And 'Back' button is enabled on setup SSO page
	And 'Verify' button is disabled on setup SSO page

Examples:
	| customerName                               |
	| Automation_test_SSO_ReadyToActivate_status |

@Licensing @CustomerAdminPortal @AdminPortalForSupport @SetupSSO @QA @Staging @Qase[LICENSE-424] @Cleanup @LC_Upd @Upd_Qase @JIRA[MMCV-10681]
Scenario: To_verify_report_issue_page_in_read-only_mode
#Test needs to be updated after fix MMCV-10681
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	And User clicks 'Sign In' button
	And User provides the Password from company account and clicks on Sign In button
	And User waits for data loading
	And User selects 'Customer Search' search option on Action panel
	And User enters '<customerName>' value in the 'search-input' field on Action panel
	And User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'View Admin' button
	And User switches to '1' tab
	Then User sees '<customerName> Admin Home' page header
	And '(read only)' mark is displayed on section header
	When User clicks 'Setup SSO' button
	Then Folowing SSO steps have Done status:
		| SSO step            |
		| new                 |
		| domain-verification |
		| ready-for-testing   |
		| report-issue        |
	And Following SSO steps are displayed:
		| SSO step            |
		| new                 |
		| domain-verification |
		| ready-for-testing   |
		| report-issue        |
		| waiting-for-support |
		| ready-to-activate   |
		| activated           |
	When User clicks 'report-issue' SSO step button on Left SSO panel
	Then SSO step button 'report-issue' is Active on left panel
	And 'issue_email' input field is disabled on the page
	And 'form-input' text area is disabled on the page
	And 'submit' input field is disabled on the page

Examples:
	| customerName                                 |
	| Automation_test_SSO_WaitingForSupport_status |

@Licensing @CustomerAdminPortal @AdminPortalForSupport @SetupSSO @QA @Staging @Qase[LICENSE-425] @Cleanup @LC_Upd @Upd_Qase @JIRA[MMCV-10681,MMCV-10518]
Scenario: To_verify_waiting_for_support_page_in_read-only_mode
#Test needs to be updated after fix MMCV-10681
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	And User clicks 'Sign In' button
	And User provides the Password from company account and clicks on Sign In button
	And User waits for data loading
	And User selects 'Customer Search' search option on Action panel
	And User enters '<customerName>' value in the 'search-input' field on Action panel
	And User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and clicks 'View Admin' button
	And User switches to '1' tab
	Then User sees '<customerName> Admin Home' page header
	And '(read only)' mark is displayed on section header
	When User clicks 'Setup SSO' button
	Then SSO step button 'waiting-for-support' is Active on left panel
	And Folowing SSO steps have Done status:
		| SSO step            |
		| new                 |
		| domain-verification |
		| ready-for-testing   |
		| report-issue        |
	And Following SSO steps are displayed:
		| SSO step            |
		| new                 |
		| domain-verification |
		| ready-for-testing   |
		| report-issue        |
		| waiting-for-support |
		| ready-to-activate   |
		| activated           |

Examples:
	| customerName                                 |
	| Automation_test_SSO_WaitingForSupport_status |