@retry(2)
Feature: Administrate
Check Administrate functionality

@Licensing @Admin_Portal @Admin_Panel @Add_Append @Administrate @QA @Staging @Qase[LICENSE-12] @Cleanup @LC_Upd @Build_24.0.110
Scenario: Check_Deploy_button_on_License_Admin_screen
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 3     | COEDIT    | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'Co-editing' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'Co-editing' value in 'Version' column of 'admin-license-purchases' table and clicks 'Deploy' button
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

@Licensing @Admin_Portal @Admin_Panel @Add_Append @Administrate @QA @Staging @Qase[LICENSE-13] @Cleanup @LC_Upd
Scenario: Check_that_the_Export_button_downloads_the_list_of_users_added_to_a_license
	#Creating an account in the MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                          |
		| add        | MMSUBSCRIPTION | <emailAddress>                  |
		| add        | MMSUBSCRIPTION | <emailAddressUserNeverSignedIn> |
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Subscription' value in 'Version' column of 'admin-license-purchases' table and clicks 'Export' button
	Then User checks that file 'user-list' was downloaded
	Then User verifies '1' rows in 'user-list' downloaded file
		| user_email                      | status | last_login | scim_group |
		| <emailAddressUserNeverSignedIn> | Active | N/A        |            |
		| <emailAddress>                  | Active | D(0)       |            |

Examples:
	| customerName        | emailAddress                                  | emailAddressUserNeverSignedIn                         |
	| Automation_testSRND | auto.test+209SRND@mindmanager.onmicrosoft.com | auto.test+never_signed_in@mindmanager.onmicrosoft.com |