@retry(2)
Feature: BULAOfflineUser

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

@Licensing @CustomerAdminPortal @BusinessUserLicenseAgreement @BULAOfflineUser @QA @Staging @Qase[LICENSE-567,LICENSE-573] @JIRA[MMCV-10662] @Cleanup
Scenario Outline: After_accepting_the_standard_BULA_ensure_that_the_customer_is_prompted_to_accept_the_offline_BULA_addendum
	When User checks checkbox by label 'I accept the terms in the Business User License Agreement on behalf of my organization *' on 'bula-dialog' dialog
	Then checkbox by label 'I accept the terms in the Business User License Agreement on behalf of my organization *' is checked on 'bula-dialog' dialog
	Then 'Continue' button is enabled on 'bula-dialog' dialog
	When User clicks 'Continue' button in 'bula-dialog' dialog
	Then 'OFFLINE VERSION ADDENDUM TO BUSINESS USER LICENSE AGREEMENT' header is displayed in 'bula-addendum-dialog' dialog
	Then compare content displayed in 'bula-addendum-dialog' dialog with content from URL 'https://www.mindmanager.com/en/company/legal/supplemental-terms/'
	When admin 'Automation_testSRND' accepts BULA Addendum terms via API
	Then User sees '<customerName> Admin Home' page header

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @BusinessUserLicenseAgreement @BULAOfflineUser @QA @Staging @Qase[LICENSE-568] @JIRA[MMCV-10518] @Cleanup
Scenario Outline: Verify_that_acceptance_details_are_properly_tracked_and_visible_to_Alludo_employees_with_Admin_Support_permissions
	When admin 'Automation_testSRND' accepts BULA terms via API
	When User refresh page
	When admin 'Automation_testSRND' accepts BULA Addendum terms via API
	When User accepts Optanon cookies
	Then User sees '<customerName> Admin Home' page header
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'Customer Search' search option on Action panel
	When User enters '<customerName>' value in the 'search-input' field on Action panel
	Then Rows with following values is displayed in 'license-support-tenant-search-result' table:
		| ColumnName                  | Value                     |
		| Customer                    | <customerName>            |
		| Type                        | enterprise                |
		| Created                     | D(0)                      |
		| SSO Status                  | Eligibility               |
		| BULA Accepted               | Yes                       |
		| Date Accepted               | D(0)                      |
		| Who Accepted                | auto.test.mm.lc@gmail.com |
		| BULA Addendum Accepted      | Yes                       |
		| BULA Addendum Date Accepted | D(0)                      |
		| BULA Addendum Who Accepted  | auto.test.mm.lc@gmail.com |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @BusinessUserLicenseAgreement @BULAOfflineUser @QA @Staging @Qase[LICENSE-569] @Cleanup
Scenario Outline: Verify_that_a_customer_with_offline_licenses_accessing_the_admin_portal_for_the_first_time_is_prompted_to_accept_the_standard_BULA
When User checks checkbox by label 'I accept the terms in the Business User License Agreement on behalf of my organization *' on 'bula-dialog' dialog
	Then checkbox by label 'I accept the terms in the Business User License Agreement on behalf of my organization *' is checked on 'bula-dialog' dialog
	Then 'Continue' button is enabled on 'bula-dialog' dialog
	When User clicks 'Continue' button in 'bula-dialog' dialog

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @CustomerAdminPortal @BusinessUserLicenseAgreement @BULAOfflineUser @QA @Staging @Qase[LICENSE-572] @Cleanup
Scenario Outline: Verify_the_functionality_of_the_cancel_button
	When User checks checkbox by label 'I accept the terms in the Business User License Agreement on behalf of my organization *' on 'bula-dialog' dialog
	Then checkbox by label 'I accept the terms in the Business User License Agreement on behalf of my organization *' is checked on 'bula-dialog' dialog
	Then 'Continue' button is enabled on 'bula-dialog' dialog
	When User clicks 'Continue' button in 'bula-dialog' dialog
	Then 'OFFLINE VERSION ADDENDUM TO BUSINESS USER LICENSE AGREEMENT' header is displayed in 'bula-addendum-dialog' dialog
	When User clicks on cancel button in 'bula-addendum-dialog' dialog
	Then User sees 'MindManager License Administration' header on Right Side panel
	Then User sees 'New Administrator?' subheader on Right Side panel
	Then 'Sign In' button is displayed
	Then 'Create Account' button is displayed
	Then 'Help' button is displayed
	
Examples:
	| customerName        |
	| Automation_testSRND |