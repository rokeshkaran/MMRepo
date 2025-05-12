@retry(2)
Feature: Conditions Availability of SSO Setup

@Licensing @CustomerAdminPortal @SSOSetup @ConditionalAvailability @QA @Qase[LICENSE-554,LICENSE-555] @Cleanup
Scenario: To_verify_that_recently_created_admin_portal_does_not_match_the_requirements_has_SSO_setup_feature_disabled_by_default
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId    | EndDate |
		| <customerName> | 4     | MMD-W21-M14  | D(2)    |
		| <customerName> | 4     | MMESSENTIALS | D(2)    |
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
