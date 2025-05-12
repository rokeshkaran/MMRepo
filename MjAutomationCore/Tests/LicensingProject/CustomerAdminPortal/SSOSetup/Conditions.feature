@retry(2)
Feature: Conditions

@Licensing @CustomerAdminPortal @SSOSetup @Conditions @QA @Qase[LICENSE-556] @Cleanup
Scenario: To_verify_that_SSO_setup_is_not_available_for_the_client_with_perpetual_key_for_less_than_5_seats
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId   | EndDate |
		| <customerName> | 2     | MMD-W21-M14 | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	Then User sees '<customerName> Admin Home' page header
	When User clicks 'Setup SSO' button
	Then Tooltip 'SSO setup requires an active Pro or MSA subscription with 5 or more seats. If you do not meet these requirements, please contact your account representative to discuss available options.' is displayed for Setup SSO button
Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @SSOSetup @Conditions @QA @Qase[LICENSE-557] @Cleanup
Scenario: To_verify_that_SSO_setup_is_available_for_the_client_with_perpetual_key_for_5plus_seats
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId   | EndDate |
		| <customerName> | 6     | MMD-W21-M14 | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	Then User sees '<customerName> Admin Home' page header
	When User clicks 'Setup SSO' button
	Then User sees '<customerName> Admin Home / Setup SSO' page header

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @SSOSetup @Conditions @QA @Qase[LICENSE-558] @Cleanup
Scenario: To_verify_that_SSO_setup_is not_available_for_the_client_with_perpetual_key_for_less_than_5_seats_per_one_key
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId   | EndDate |
		| <customerName> | 2     | MMD-W21-M14 | D(2)    |
		| <customerName> | 4     | MMD-W21-M13 | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	Then User sees '<customerName> Admin Home' page header
	When User clicks 'Setup SSO' button
	Then Tooltip 'SSO setup requires an active Pro or MSA subscription with 5 or more seats. If you do not meet these requirements, please contact your account representative to discuss available options.' is displayed for Setup SSO button

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @SSOSetup @Conditions @QA @Qase[LICENSE-559] @Cleanup
Scenario: To_verify_that_SSO_setup_is_available_for_the_client_who_has_a_total_of_5_or_more_unexpired_subscription_seats
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(2)    |
		| <customerName> | 2     | MMSUBSCRIPTION | D(2)    |
		| <customerName> | 1     | MMSUBSCRIPTION | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	Then User sees '<customerName> Admin Home' page header
	When User clicks 'Setup SSO' button
	Then User sees '<customerName> Admin Home / Setup SSO' page header

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @SSOSetup @Conditions @QA @Qase[LICENSE-560] @Cleanup
Scenario: To_verify_that_SSO_setup_is_not_available_for_the_client_with_total_5plus_seats_of_subscription_if_the_number_of_seats of_unexpired_subscription_is_less_than_5
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId    | EndDate |
		| <customerName> | 4     | MSTEAMSEDIT  | D(5)    |
		| <customerName> | 11    | MMESSENTIALS | D(1)    |
	When User updates 'MMESSENTIALS' purchase data for '<customerName>' customer in Sales portal via Api
		| EndDate |
		| D(-2)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	Then User sees '<customerName> Admin Home' page header
	When User clicks 'Setup SSO' button
	Then Tooltip 'SSO setup requires an active Pro or MSA subscription with 5 or more seats. If you do not meet these requirements, please contact your account representative to discuss available options.' is displayed for Setup SSO button

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @SSOSetup @Conditions @QA @Qase[LICENSE-561] @Cleanup
Scenario: To_verify_that_SSO_setup_page_is_accessible_for_the_client_despite_the_requirements_is_they_had_set_up_SSO_before_24.0_release
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId    | EndDate |
		| <customerName> | 5     | MMD-W21-M14  | D(2)    |
		| <customerName> | 5     | MMESSENTIALS | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	Then User sees '<customerName> Admin Home' page header
	When User clicks 'Setup SSO' button
	Then User sees '<customerName> Admin Home / Setup SSO' page header

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @SSOSetup @Conditions @QA @Qase[LICENSE-564] @JIRA[MMCV-10397,MMCV-10518] @Cleanup
Scenario: To_verify_that_eligibility_for_SSO_setup_can_be_override_by_support_member_turn_off
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId    | EndDate |
		| <customerName> | 5     | MMESSENTIALS | D(1)    |
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'Email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button	
	When User waits for data loading
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'Enter search term' field on Action panel
	Then 'SSO Status' checkbox for eligibility is unchecked in 'Customer' column for '<customerName>' value 'license-support-tenant-search-result' table
	When User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and change 'SSO Status' eligibility checkbox details
	Then 'Tenant has been updated.' text message is displayed in toast container
	Then 'SSO Status' checkbox for eligibility is checked in 'Customer' column for '<customerName>' value 'license-support-tenant-search-result' table
	#Admin portal
	When User open new tab in browser
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User accepts Optanon cookies
	Then User sees '<customerName> Admin Home' page header
	When User clicks 'Setup SSO' button
	Then User sees '<customerName> Admin Home / Setup SSO' page header
	#Support portal
	When User switches to '0' tab
	When User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and change 'SSO Status' eligibility checkbox details
	Then 'Tenant has been updated.' text message is displayed in toast container
	When User refresh page
	Then 'SSO Status' checkbox for eligibility is unchecked in 'Customer' column for '<customerName>' value 'license-support-tenant-search-result' table
	#Admin portal
	When User switches to '1' tab
	When User refresh page
	When User clicks 'Setup SSO' button
	Then Tooltip 'SSO setup requires an active Pro or MSA subscription with 5 or more seats. If you do not meet these requirements, please contact your account representative to discuss available options.' is displayed for Setup SSO button

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @SSOSetup @Conditions @QA @Qase[LICENSE-566] @Cleanup @JIRA[MMCV-10518]
Scenario: To_verify_that_eligibility_for_SSO_setup_can_be_override_by_support_member
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId    | EndDate |
		| <customerName> | 5     | MMESSENTIALS | D(1)    |
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'Email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'Enter search term' field on Action panel
	Then 'SSO Status' checkbox for eligibility is unchecked in 'Customer' column for '<customerName>' value 'license-support-tenant-search-result' table
	#Admin portal
	When User open new tab in browser
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User accepts Optanon cookies
	Then User sees '<customerName> Admin Home' page header
	When User clicks 'Setup SSO' button
	Then Tooltip 'SSO setup requires an active Pro or MSA subscription with 5 or more seats. If you do not meet these requirements, please contact your account representative to discuss available options.' is displayed for Setup SSO button
	#Support portal
	When User switches to '0' tab
	Then 'SSO Status' checkbox for eligibility is unchecked in 'Customer' column for '<customerName>' value 'license-support-tenant-search-result' table
	When User find '<customerName>' value in 'Customer' column of 'license-support-tenant-search-result' table and change 'SSO Status' eligibility checkbox details
	Then 'Tenant has been updated.' text message is displayed in toast container
	Then 'SSO Status' checkbox for eligibility is checked in 'Customer' column for '<customerName>' value 'license-support-tenant-search-result' table
	#Admin portal
	When User switches to '1' tab
	When User refresh page
	When User clicks 'Setup SSO' button
	Then User sees '<customerName> Admin Home / Setup SSO' page header

Examples:
	| customerName        |
	| Automation_testSRND |