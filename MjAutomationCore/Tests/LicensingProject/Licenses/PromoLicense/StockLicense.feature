@retry(2)
Feature: StockLicense
Check Stock License functionality

@Licensing @Stock_License @Support_Portal @QA @Staging @Qase[LICENSE-291] @Cleanup @JIRA[MMCV-10140,MMCV-10397,MMCV-10518]
Scenario: Verify_some_stock_licenses_are_displayed_in_support_as_one_product
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name             | Type       |
		| <customerName_1> | enterprise |
		| <customerName_2> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName     | Seats | ProductId      |
		| <customerName_1> | 1     | MMSUBSCRIPTION |
		| <customerName_2> | 1     | MMSUBSCRIPTION |
	#Admin portal
	When User is logged in to '<customerName_1>' customer on Admin portal via Api
	When admin '<customerName_1>' accepts BULA terms via API
	When User refresh page
	When '<customerName_1>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	#Admin portal
	When User is logged in to '<customerName_2>' customer on Admin portal via Api
	When admin '<customerName_2>' accepts BULA terms via API
	When User close 'bula-dialog' dialog
	When '<customerName_2>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'User Search' search option on Action panel
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	When User presses the 'Enter' key on the keyboard
	When User find '<emailAddress>' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button
	Then Rows with following values is displayed in 'license-support-user-details-subscriptions' table:
		| ColumnName     | Value                            |
		| Product        | MindManager Subscription (Stock) |
		| License Status | Active                           |
		| User Status    | Active                           |
	Then 'MindManager Subscription (Stock)' value is displayed in the 'Product' column of 'license-support-user-details-subscriptions' table
	Then '1' rows are displayed in 'license-support-user-details-subscriptions' table
	Then eye icon is displayed in 'License Key' column for 'MindManager Subscription (Stock)' value in 'Product' column of 'license-support-user-details-subscriptions' table

Examples:
	| emailAddress                         | password   | customerName_1      | customerName_2       |
	| user.SRND@mindmanager.auto.tests.com | 6j9k2!SRND | Automation_testSRND | Automation1_testSRND |

@Licensing @Stock_License @Support_Portal @QA @Staging @Qase[LICENSE-292] @Cleanup @JIRA[MMCV-10140,MMCV-10397,MMCV-10518]
Scenario: Verify_stock_licenses_correctly_displayed_in_support_portal
#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      |
		| <customerName> | 1     | MMSUBSCRIPTION |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'User Search' search option on Action panel
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	When User presses the 'Enter' key on the keyboard
	When User find '<emailAddress>' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button
	Then Rows with following values is displayed in 'license-support-user-details-subscriptions' table:
		| ColumnName     | Value                            |
		| Product        | MindManager Subscription (Stock) |
		| License Status | Active                           |
		| User Status    | Active                           |
	Then 'MindManager Subscription (Stock)' value is displayed in the 'Product' column of 'license-support-user-details-subscriptions' table

Examples:
	| emailAddress                         | password   | customerName        |
	| user.SRND@mindmanager.auto.tests.com | 6j9k2!SRND | Automation_testSRND |

@Licensing @Stock_License @Support_Portal @QA @Staging @Qase[LICENSE-293] @Cleanup @JIRA[MMCV-10140,MMCV-10397,MMCV-10518]
Scenario: Verify_that_infotip_dialog_with_a_list_of_all_stock_license_keys_contains_the_required_information
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name             | Type       |
		| <customerName_1> | enterprise |
		| <customerName_2> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName     | Seats | ProductId      |
		| <customerName_1> | 1     | MMSUBSCRIPTION |
		| <customerName_2> | 1     | MMSUBSCRIPTION |
	#Admin portal
	When User is logged in to '<customerName_1>' customer on Admin portal via Api
	When admin '<customerName_1>' accepts BULA terms via API
	When User refresh page
	When '<customerName_1>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	#Admin portal
	When User is logged in to '<customerName_2>' customer on Admin portal via Api
	When admin '<customerName_2>' accepts BULA terms via API
	When User close 'bula-dialog' dialog
	When '<customerName_2>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	#MM Accounts
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button
	When User waits for data loading
	When User selects 'User Search' search option on Action panel
	When User enters '<emailAddress>' value in the 'search-input' field on Action panel
	When User presses the 'Enter' key on the keyboard
	When User find '<emailAddress>' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button
	Then 'MindManager Subscription (Stock)' value is displayed in the 'Product' column of 'license-support-user-details-subscriptions' table
	Then eye icon is displayed in 'License Key' column for 'MindManager Subscription (Stock)' value in 'Product' column of 'license-support-user-details-subscriptions' table
	When User hover on eye icon in 'License Key' column for 'MindManager Subscription (Stock)' value in 'Product' column of 'license-support-user-details-subscriptions' table
	Then tooltip stock keys is displayed to the User in 'license-support-user-details-subscriptions' table
	Then License key details is displayed in tooltip section of 'license-support-user-details-subscriptions' table
	Then Date details is displayed in tooltip section of 'license-support-user-details-subscriptions' table
	Then license key and date details are displayed to users in 'license-support-user-details-subscriptions' table sorted by date added

Examples:
	| emailAddress                         | password   | customerName_1      | customerName_2       |
	| user.SRND@mindmanager.auto.tests.com | 6j9k2!SRND | Automation_testSRND | Automation1_testSRND |

@Licensing @Stock_License @Support_Portal @QA @Staging @Qase[LICENSE-284] @Cleanup @JIRA[MMCV-10140]
Scenario: Verify_expiration_date_of_the_active_license_is_extended_by_the_duration_of_the_new_key
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name             | Type       |
		| <customerName_1> | enterprise |
		| <customerName_2> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName     | Seats | ProductId      |
		| <customerName_1> | 1     | MMSUBSCRIPTION |
		| <customerName_2> | 1     | MMSUBSCRIPTION |
	#Admin portal
	When User is logged in to '<customerName_1>' customer on Admin portal via Api
	When admin '<customerName_1>' accepts BULA terms via API
	When User refresh page
	When '<customerName_1>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	#Admin portal
	When User is logged in to '<customerName_2>' customer on Admin portal via Api
	When admin '<customerName_2>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#MM Accounts
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then subscription account details 'MindManager Subscription' is displayed on page in 'My Products' section on Account Details page
	Then product 'MindManager Subscription' is displayed with status 'Active' in 'My Products' section on Account Details page
	When User clicks on Toggle arrow button for product name 'MindManager Subscription' in 'My Products' section on Account Details page
	Then content row with header 'Expires' and date 'D(365)' is displayed for 'MindManager Subscription' product in 'My Products' section on the Account Details page
	When User switches to iframe
	When User clicks 'Add Product' button on the page
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User clicks 'Submit' button
	When User switches to iframe
	When User clicks 'Continue' button
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	When User clicks on Toggle arrow button for product name 'MindManager Subscription' in 'My Products' section on Account Details page
	Then content row with header 'Expires' and date 'D(730)' is displayed for 'MindManager Subscription' product in 'My Products' section on the Account Details page
	
Examples:
	| emailAddress                         | password   | customerName_1      | customerName_2       |
	| user.SRND@mindmanager.auto.tests.com | 6j9k2!SRND | Automation_testSRND | Automation1_testSRND |

@Licensing @Stock_License @Support_Portal @QA @Staging @Qase[LICENSE-285] @Cleanup @JIRA[MMCV-10140]
Scenario: Verify_expiration_date_product_is_set_to_the_duration_time_of_the_key_from_the_date_the_new_stock_license_is_added
   #MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
   #Sales portal
	When User creates new Customer on Sales portal via Api
		| Name             | Type       |
		| <customerName_1> | enterprise |
		| <customerName_2> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName     | Seats | ProductId      |
		| <customerName_1> | 1     | MMSUBSCRIPTION |
		| <customerName_2> | 1     | MMSUBSCRIPTION |
	#Admin portal
	When User is logged in to '<customerName_1>' customer on Admin portal via Api
	When admin '<customerName_1>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName_1>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User updates 'MMSUBSCRIPTION' purchase data for '<customerName_1>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	#Admin portal
	When User is logged in to '<customerName_2>' customer on Admin portal via Api
	When admin '<customerName_2>' accepts BULA terms via API
	When User refresh page
	When User find 'MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks clipboard copy button in 'License Key' column
	Then 'Copied.' text message is displayed in toast container
	Then value is copied to the clipboard
	#MM Accounts
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Subscription has expired or been cancelled.' header on Right Side panel
	When User clicks 'Enter New License Key' button
	When User switches to iframe
	When User pastes copied key into 'license_key' field
	When User clicks 'Submit' button
	Then User sees 'Success!' header on Right Side panel
	Then User sees 'Your license key was successfully added to your account.' subheader on Right Side panel
	When User clicks 'Continue' button
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then product 'MindManager Subscription' is displayed with status 'Active' in 'My Products' section on Account Details page
	When User clicks on Toggle arrow button for product name 'MindManager Subscription' in 'My Products' section on Account Details page
	Then content row with header 'Expires' and date 'D(365)' is displayed for 'MindManager Subscription' product in 'My Products' section on the Account Details page

Examples:
	| emailAddress                         | password   | customerName_1      | customerName_2       |
	| user.SRND@mindmanager.auto.tests.com | 6j9k2!SRND | Automation_testSRND | Automation1_testSRND |

@Licensing @Stock_License @Support_Portal @QA @Staging @Qase[LICENSE-286] @Cleanup @JIRA[MMCV-10140]
Scenario: Verify_that_stock_licenses_are_displayed_on_account_details_page_as_one_product
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name             | Type       |
		| <customerName_1> | enterprise |
		| <customerName_2> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName     | Seats | ProductId      |
		| <customerName_1> | 1     | MMSUBSCRIPTION |
		| <customerName_2> | 1     | MMSUBSCRIPTION |
	#Admin portal
	When User is logged in to '<customerName_1>' customer on Admin portal via Api
	When admin '<customerName_1>' accepts BULA terms via API
	When User refresh page
	When '<customerName_1>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	#Admin portal
	When User is logged in to '<customerName_2>' customer on Admin portal via Api
	When admin '<customerName_2>' accepts BULA terms via API
	When User close 'bula-dialog' dialog
	When '<customerName_2>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#MM Accounts
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then subscription account details 'MindManager Subscription' is displayed on page in 'My Products' section on Account Details page

Examples:
	| emailAddress                         | password   | customerName_1      | customerName_2       |
	| user.SRND@mindmanager.auto.tests.com | 6j9k2!SRND | Automation_testSRND | Automation1_testSRND |