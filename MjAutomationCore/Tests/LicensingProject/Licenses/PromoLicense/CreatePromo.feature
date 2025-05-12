@retry(2)
Feature: CreatePromo
Check Promo License functionality

Background: Pre-condition
	Given User is on the Mindmanager Sales portal website
	Then Right Side panel is displayed
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	When User clicks 'Sign In' button
	When User provides the Password from company account and clicks on Sign In button

@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-442] @JIRA[MMCV-10397,MMCV-10518] @Cleanup
Scenario: Verify_it_is_possible_to_add_MindManager_Essentials_Promo_license
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Promo Purchase on Sales portal via Api
		| CustomerName   | ProductId    | PurchaseType | Seats | Duration | ProductLabel                      | EndDate |
		| <customerName> | MMESSENTIALS | promo        | 5     | 5        | Promo test MindManager Essentials | D(10)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User find 'Promo test MindManager Essentials' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName      | Value |
		| Duration (Days) | 5     |
		| Expires         | D(10) |

Examples:
	| customerName        |
	| Automation_testSRND |

@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-243] @JIRA[MMCV-10397,MMCV-10518] @Cleanup
Scenario: Verify_it_is_possible_to_add_MindManager_Subscription_Promo_license
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Promo Purchase on Sales portal via Api
		| CustomerName   | ProductId      | PurchaseType | Seats | Duration | ProductLabel                        | EndDate |
		| <customerName> | MMSUBSCRIPTION | promo        | 5     | 5        | Promo test MindManager Subscription | D(20)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User find 'Promo test MindManager Subscription' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName      | Value |
		| Duration (Days) | 5     |
		| Expires         | D(20) |

Examples:
	| customerName        |
	| Automation_testSRND |
	 
@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-246] @JIRA[MMCV-10397,MMCV-10518] @Cleanup
Scenario: Verify_duration_promo_license_starts_from_the_day_when_the_license_is_first_applied
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Promo Purchase on Sales portal via Api
		| CustomerName   | ProductId      | PurchaseType | Seats | Duration | ProductLabel                        | EndDate |
		| <customerName> | MMSUBSCRIPTION | promo        | 5     | 5        | Promo test MindManager Subscription | D(20)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	Then header 'My Products' is displayed on page
	Then product 'Promo test MindManager Subscription' is displayed with status 'Active' in 'My Products' section on Account Details page
	When User clicks on Toggle arrow button for product name 'Promo test MindManager Subscription' in 'My Products' section on Account Details page
	#Promo license expires X days after it has been started, where X is the duration of the promo
	Then content row with header 'Expires' and date 'D(5)' is displayed for 'Promo test MindManager Subscription' product in 'My Products' section on the Account Details page

Examples:
	| emailAddress                                 | password   | customerName        |
	| auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Automation_testSRND |

@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-247] @JIRA[MMCV-10397,MMCV-10518] @Cleanup
Scenario: Verify_the_entry_of_redemption_expiration_date
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User clicks 'Add New Purchase' button
	When User selects 'Automation_testSRND' value in the 'Customer' selectbox field of 'purchase' dialog
	When User selects 'Promo' option in the 'Purchase Type' selectbox field of 'purchase' dialog
	Then 'D(365)' value is displayed to the 'end_date' field of 'purchase' dialog
	When User enter 'D(-1)' value in the 'end_date' field of 'purchase' dialog
	Then 'D(-1)' value is displayed to the 'end_date' field of 'purchase' dialog
	When User clicks 'Add' button in 'purchase-dialog' dialog
	Then text 'Error: error. End date of the purchase cannot be in the past.' is displayed in dialog popup
	Then dialog popup is displayed to User
	When User clicks Ok button in dialog popup
	Then dialog popup is not displayed to User
	When User clicks 'Add New Purchase' button
	When User selects 'Automation_testSRND' value in the 'Customer' selectbox field of 'purchase' dialog
	When User selects 'Promo' option in the 'Purchase Type' selectbox field of 'purchase' dialog
	When User clicks 'duration' field and presses the 'ArrowUp' key on the keyboard of 'purchase' dialog
	Then '1' value is displayed to the 'duration' field of 'purchase' dialog
	When User enter 'Promo test' value in the 'product_label' field of 'purchase' dialog
	When User enter 'D(5)' value in the 'end_date' field of 'purchase' dialog
	Then 'D(5)' value is displayed to the 'end_date' field of 'purchase' dialog

@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-248] @JIRA[MMCV-10397,MMCV-10518] @Cleanup
Scenario: Verify_the_seats_field
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User clicks 'Add New Purchase' button
	When User selects 'Automation_testSRND' value in the 'Customer' selectbox field of 'purchase' dialog
	When User selects 'Promo' option in the 'Purchase Type' selectbox field of 'purchase' dialog
	When User enter '-83' value in the 'seats' field of 'purchase' dialog
	Then '-83' value is displayed to the 'seats' field of 'purchase' dialog
	When User clicks 'Add' button in 'purchase-dialog' dialog
	Then text 'Error: error. Negative seats number.' is displayed in dialog popup
	When User clicks Ok button in dialog popup
	Then 'purchase' dialog is not displayed to User
	When User clicks 'Add New Purchase' button
	When User selects 'Automation_testSRND' value in the 'Customer' selectbox field of 'purchase' dialog
	Then 'Automation_testSRND' value is displayed in 'Customer' selectbox field of 'purchase' dialog
	When User enter '10' value in the 'seats' field of 'purchase' dialog
	Then '10' value is displayed to the 'seats' field of 'purchase' dialog
	When User clicks 'Add' button in 'purchase-dialog' dialog
	Then 'purchase' dialog is not displayed to User
	Then following information about 'COEDIT' purchase for customer 'Automation_testSRND' is displayed in Sales portal via Api
		| UsedSeats | Seats |
		| 0         | 10    |

@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-248] @JIRA[MMCV-10397,MMCV-10518] @Cleanup
Scenario: Check_it_is_possible_to_increase_the_number_of_seats_using_the_keyboard
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User clicks 'Add New Purchase' button
	When User selects 'Automation_testSRND' value in the 'Customer' selectbox field of 'purchase' dialog
	When User selects 'Promo' option in the 'Purchase Type' selectbox field of 'purchase' dialog
	When User clicks 'seats' field and presses the 'ArrowUp' key on the keyboard of 'purchase' dialog
	When User clicks 'seats' field and presses the 'ArrowUp' key on the keyboard of 'purchase' dialog
	Then '2' value is displayed to the 'seats' field of 'purchase' dialog
	When User clicks 'seats' field and presses the 'ArrowDown' key on the keyboard of 'purchase' dialog
	Then '1' value is displayed to the 'seats' field of 'purchase' dialog

@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-249] @JIRA[MMCV-10397,MMCV-10518] @Cleanup
Scenario: Verify_Promo_Duration_field
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User clicks 'Add New Purchase' button
	When User selects 'Automation_testSRND' value in the 'Customer' selectbox field of 'purchase' dialog
	When User selects 'Promo' option in the 'Purchase Type' selectbox field of 'purchase' dialog
	When User enter '10' value in the 'duration' field of 'purchase' dialog
	Then '10' value is displayed to the 'duration' field of 'purchase' dialog
	When User clicks 'Add' button in 'purchase-dialog' dialog
	Then 'purchase' dialog is not displayed to User

@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-249] @JIRA[MMCV-10397,MMCV-10518] @Cleanup
Scenario: Check_it_is_possible_to_increase_promo_duration_using_the_keyboard
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User clicks 'Add New Purchase' button
	When User selects 'Automation_testSRND' value in the 'Customer' selectbox field of 'purchase' dialog
	When User selects 'Promo' option in the 'Purchase Type' selectbox field of 'purchase' dialog
	When User clicks 'duration' field and presses the 'ArrowUp' key on the keyboard of 'purchase' dialog
	When User clicks 'duration' field and presses the 'ArrowUp' key on the keyboard of 'purchase' dialog
	Then '2' value is displayed to the 'duration' field of 'purchase' dialog
	When User clicks 'duration' field and presses the 'ArrowDown' key on the keyboard of 'purchase' dialog
	Then '1' value is displayed to the 'duration' field of 'purchase' dialog

@Licensing @Promo_License @CreatePromo @QA @Staging @Qase[LICENSE-250] @Cleanup @JIRA[MMCV-9243,MMCV-10518]
Scenario: Verify_that_expiration_message_is_displayed_correctly
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	#Portal app
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Promo Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId    | PurchaseType | Duration | ProductLabel | EndDate |
		| <customerName> | 5     | MMESSENTIALS | promo        | 5        | Promo Test   | D(11)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId   | Emails         |
		| add        | MMESSENTIALS | <emailAddress> |
	#MM app
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'My Files' tab on file manager header page
	When User login to Box cloud
	Then on the page exist 'Box' content item with 'auto.test@mindmanagercloudqa.com' description
	When User select 'Box' content item with 'auto.test@mindmanagercloudqa.com' description
	Then 'Box' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	Then 'For QA automation' item with 'Folder' description is exist on page
	When User clicks 'For QA automation' folder
	Then 'Properties_for_check.mmap' file is exist on page
	When User clicks 'Properties_for_check.mmap' file
	Then 'Your Promotional License Expires in 4 days' message is displayed at the bottom of Canvas
	Then 'View Pricing' subscribe link is displayed at the bottom of Canvas

Examples:
	| emailAddress                                 | password   | customerName        |
	| auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Automation_testSRND |