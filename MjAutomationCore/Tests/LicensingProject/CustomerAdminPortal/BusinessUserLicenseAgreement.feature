@retry(2)
Feature: BusinessUserLicenseAgreement

Background: Pre-condition
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName        | Seats | ProductId | EndDate |
		| Automation_testSRND | 2     | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	Then 'bula-dialog' dialog is displayed to User

@Licensing @Admin_Portal @BusinessUserLicenseAgreement @QA @Qase[LICENSE-448] @JIRA[MMCV-10397,MMCV-10518] @Cleanup @LC_Upd
Scenario: Check_that_the_BULA_acceptance_info_is_added_to_support_portal_QA
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-tenant-search-result' table:
		| ColumnName    | Value          |
		| Customer      | <customerName> |
		| Type          | enterprise     |
		| Created       | D(0)           |
		| SSO Status    | Eligibility    |
		| BULA Accepted | No             |
		| Date Accepted |                |
		| Who Accepted  |                |
	#Admin portal
	When admin '<customerName>' accepts BULA terms via API
	#Support portal
	When User refresh page
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-tenant-search-result' table:
		| ColumnName    | Value                     |
		| Customer      | <customerName>            |
		| Type          | enterprise                |
		| Created       | D(0)                      |
		| SSO Status    | Eligibility               |
		| BULA Accepted | Yes                       |
		| Date Accepted | D(0)                      |
		| Who Accepted  | auto.test.mm.lc@gmail.com |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @Admin_Portal @BusinessUserLicenseAgreement @Staging @Qase[LICENSE-448] @JIRA[MMCV-10518] @Cleanup @LC_Upd
Scenario: Check_that_the_BULA_acceptance_info_is_added_to_support_portal_STG
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-tenant-search-result' table:
		| ColumnName    | Value          |
		| Customer      | <customerName> |
		| Type          | enterprise     |
		| Created       | D(0)           |
		| SSO Status    | N/A            |
		| BULA Accepted | No             |
		| Date Accepted |                |
		| Who Accepted  |                |
	#Admin portal
	When admin '<customerName>' accepts BULA terms via API
	#Support portal
	When User refresh page
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-tenant-search-result' table:
		| ColumnName    | Value                     |
		| Customer      | <customerName>            |
		| Type          | enterprise                |
		| Created       | D(0)                      |
		| SSO Status    | N/A                       |
		| BULA Accepted | Yes                       |
		| Date Accepted | D(0)                      |
		| Who Accepted  | auto.test.mm.lc@gmail.com |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @Admin_Portal @Add_Append @QA @Staging @Qase[LICENSE-444] @Cleanup @LC_Upd
Scenario: Check_that_the_admin_cannot_skip_the_accepting_BULA_before_using_the_Admin_portal
	Then 'Continue' button is disabled on 'bula-dialog' dialog
	When User clicks 'Continue' button in 'bula-dialog' dialog
	Then '! Please accept the terms to continue to the admin portal' section warning content message is displayed in 'bula-dialog' dialog for BULA terms

@Licensing @Admin_Portal @Add_Append @QA @Staging @Qase[LICENSE-446] @Cleanup @LC_Upd
Scenario: Verify_that_the_BULA_dialog_cannot_be_skipped_by_clicking_outside_the_dialog
	When User clicks outside the 'bula-dialog' dialog for BULA terms
	Then 'bula-dialog' dialog is displayed to User
	Then 'Continue' button is disabled on 'bula-dialog' dialog
	When User clicks 'Continue' button in 'bula-dialog' dialog
	Then '! Please accept the terms to continue to the admin portal' section warning content message is displayed in 'bula-dialog' dialog for BULA terms

@Licensing @Admin_Portal @BusinessUserLicenseAgreement @QA @Staging @Qase[LICENSE-445] @Cleanup @LC_Upd
Scenario: Check_that_the_admin_can_proceed_to_Admin_portal_once_BULA_is_accepted
	When User checks checkbox by label 'I accept the terms in the Business User License Agreement on behalf of my organization *' on 'bula-dialog' dialog
	Then checkbox by label 'I accept the terms in the Business User License Agreement on behalf of my organization *' is checked on 'bula-dialog' dialog
	Then 'Continue' button is enabled on 'bula-dialog' dialog
	When User clicks 'Continue' button in 'bula-dialog' dialog
	Then 'bula-dialog' dialog is not displayed to User
	Then User sees '<customerName> Admin Home' page header

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @Admin_Portal @BusinessUserLicenseAgreement @QA @Staging @Qase[LICENSE-447] @Cleanup @LC_Upd
Scenario: Check_the_default_state_of_the_Accept_the_terms_checkbox
	Then 'BUSINESS USER LICENSE AGREEMENT' header is displayed in 'bula-dialog' dialog
	Then 'PLEASE READ THIS BUSINESS USER LICENSE AGREEMENT' text is displayed in 'bula-dialog' dialog
	Then checkbox by label 'I accept the terms in the Business User License Agreement on behalf of my organization *' is unchecked on 'bula-dialog' dialog
	Then 'Continue' button is disabled on 'bula-dialog' dialog

@Licensing @Admin_Portal @BusinessUserLicenseAgreement @QA @Staging @Qase[LICENSE-449] @Cleanup @LC_Upd
Scenario: Check_it_is_not_possible_to_close_the_BULA_with_ESC_button
	When User presses the 'Esc' key on the keyboard
	Then 'bula-dialog' dialog is displayed to User