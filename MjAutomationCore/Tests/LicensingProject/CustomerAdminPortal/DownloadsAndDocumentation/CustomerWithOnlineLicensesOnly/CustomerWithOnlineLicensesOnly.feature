@retry(2)
Feature: CustomerWithOnlineLicensesOnly

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineLicense @QA @Staging @Qase[LICENSE-494] @Cleanup
Scenario Outline: To_verify_download_sections_for_customer_with_online_licenses_only
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
	Then User sees '<customerName> Admin Home / Downloads' page header
	Then following download sections are displayed on the Downloads page:
		| SectionTitle        |
		| For Windows         |
		| For Mac             |
		| For Microsoft Teams |
		| For Chromebook      |
		| For MindManager Web |
	Then logo '/images/windows-icon.svg' is displayed in the 'For Windows' section title
	Then logo '/images/apple-icon.svg' is displayed in the 'For Mac' section title
	Then logo '/images/microsoft-teams-icon.svg' is displayed in the 'For Microsoft Teams' section title
	Then logo '/images/google-play-icon.svg' is displayed in the 'For Chromebook' section title

Examples:
	| customerName        |
	| Automation_testSRND |
