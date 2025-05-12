@retry(2)
Feature: CustomerWithBothOnlineAndOfflineLicenses

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

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineANDOfflineLicenses @QA @Staging @Qase[LICENSE-483] @Cleanup
Scenario Outline: To_verify_download_sections_for_customer_with_both_onlineANDoffline_licenses
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

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineANDOfflineLicenses @Staging @Qase[LICENSE-466] @Cleanup @Build_24.0.110
Scenario Outline: To_verify_Offline_licenses_UI_in_Admin_panel_with_both_onlineANDoffline_licenses_STG
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value                    |
		| Product          | MindManager Subscription |
		| License Status   | Active                   |
		| Expires          | D(1)                     |
		| Seats Used/Total | 0/1                      |
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value                          |
		| Product          | MindManager Windows 23 Offline |
		| License Status   | Active                         |
		| Expires          | D(1)                           |
		| Seats Used/Total | 1                              |

@Licensing @CustomerAdminPortal @DownloadsANDDocumentation @OnlineANDOfflineLicenses @QA @Qase[LICENSE-466] @Cleanup @Build_24.0.110
Scenario Outline: To_verify_Offline_licenses_UI_in_Admin_panel_with_both_onlineANDoffline_licenses_QA
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value                    |
		| Product          | MindManager Subscription |
		| License Status   | Active                   |
		| Expires          | D(1)                     |
		| Seats Used/Total | 0/1                      |
	Then Rows with following values is displayed in 'admin-home-purchases' table:
		| ColumnName       | Value                          |
		| Product          | MindManager Windows 23 Offline |
		| License Status   | Perpetual                      |
		| Expires          | N/A                            |
		| Seats Used/Total | 1                              |
