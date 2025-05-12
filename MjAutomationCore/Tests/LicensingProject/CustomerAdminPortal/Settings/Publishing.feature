@retry(2)
Feature: Publishing
Check Publishing option

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath              |
		| auto_test_SRND.mmap | CommonEmptyATMap.mmap |
	#Creating an account in the MM app
	Given User account
		| Email                                        | Password   |
		| auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName        | Seats | ProductId      | EndDate |
		| Automation_testSRND | 2     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	When admin 'Automation_testSRND' accepts BULA terms via API
	When 'Automation_testSRND' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                                       |
		| add        | MMSUBSCRIPTION | auto.test_1+SRND@mindmanager.onmicrosoft.com |
	When User refresh page
	When User accepts Optanon cookies

@Licensing @CustomerAdminPortal @Settings @Publishing @QA @Staging @Qase[LICENSE-63] @Cleanup @Upd_Qase
Scenario: Allow_publishing
	#Admin portal
	When User clicks 'Settings' button
	Then 'Allow Publishing' checkbox is checked in section with 'Publishing' title
	#MM app
	When User open new tab in browser
	Given User is logged in newly created account via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	Then 'SharePoint' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	Then 'Documents' folder with 'drive' description is exist on page
	When User clicks close button in 'upsell-dialog' dialog
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	Then following buttons are displayed in 'share-contextmenu' menu
		| items            |
		| Copy Link        |
		| Publish          |
		| About Publishing |

@Licensing @CustomerAdminPortal @Settings @Publishing @QA @Staging @Qase[LICENSE-65] @Cleanup @Upd_Qase
Scenario: Do_not_allow_publishing
	#Admin portal
	When User clicks 'Settings' button
	When User unchecks 'Allow Publishing' checkbox in section with 'Publishing' title
	Then 'Allow Publishing' checkbox is unchecked in section with 'Publishing' title
	#MM app
	When User open new tab in browser
	Given User is logged in newly created account via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	Then 'SharePoint' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	Then 'Documents' folder with 'drive' description is exist on page
	When User clicks close button in 'upsell-dialog' dialog
	When User clicks 'Documents' folder
	Then 'For QA automation' folder with 'Folder' description is exist on page
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	Then following buttons are displayed in 'share-contextmenu' menu
		| items          |
		| Copy Link      |
	Then following menu buttons are displayed in 'share-contextmenu' menu
		| items  |
		| Export |

@Licensing @CustomerAdminPortal @Settings @Publishing @QA @Staging @Qase[LICENSE-64] @Cleanup @Upd_Qase
Scenario: Multi_licensed_User
	When User clicks 'Settings' button
	Then 'Allow Publishing' checkbox is checked in section with 'Publishing' title
	#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                    | Type       |
		| Automation_test_2ndSRND | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName            | Seats | ProductId      | EndDate |
		| Automation_test_2ndSRND | 1     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to 'Automation_test_2ndSRND' customer on Admin portal via Api
	When admin 'Automation_test_2ndSRND' accepts BULA terms via API
	When 'Automation_test_2ndSRND' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                                       |
		| add        | MMSUBSCRIPTION | auto.test_1+SRND@mindmanager.onmicrosoft.com |
	When User close 'bula-dialog' dialog
	When User clicks 'Settings' button
	When User unchecks 'Allow Publishing' checkbox in section with 'Publishing' title
	Then 'Allow Publishing' checkbox is unchecked in section with 'Publishing' title
	#MM app
	When User open new tab in browser
	Given User is logged in newly created account via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	Then 'SharePoint' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	Then 'Documents' folder with 'drive' description is exist on page
	When User clicks close button in 'upsell-dialog' dialog
	When User clicks 'Documents' folder
	Then 'For QA automation' folder with 'Folder' description is exist on page
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	Then following buttons are displayed in 'share-contextmenu' menu
		| items            |
		| Copy Link        |

@Licensing @CustomerAdminPortal @Settings @Publishing @PublishDisabled @QA @Staging @Qase[LICENSE-71] @Cleanup
Scenario: Verify_publish_option_is_disabled_from_Share_in_top_menu
	#Admin portal
	When User clicks 'Settings' button
	When User unchecks 'Allow Publishing' checkbox in section with 'Publishing' title
	Then 'Allow Publishing' checkbox is unchecked in section with 'Publishing' title
	#MM app
	When User open new tab in browser
	Given User is logged in newly created account via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	Then 'SharePoint' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	Then 'Documents' folder with 'drive' description is exist on page
	When User clicks close button in 'upsell-dialog' dialog
	When User clicks 'Documents' folder
	Then 'For QA automation' folder with 'Folder' description is exist on page
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'Share' name in 'ToolbarPageElement' container
	Then following buttons are displayed in 'share' menu
		| Button    |
		| Copy Link |

@Licensing @CustomerAdminPortal @Settings @Publishing @PublishDisabled @QA @Staging @Qase[LICENSE-72] @Cleanup
Scenario: Verify_publish_option_is_not_displayed_Share_button_menu_on_toolbar
	#Admin portalsha	
	When User clicks 'Settings' button
	When User unchecks 'Allow Publishing' checkbox in section with 'Publishing' title
	Then 'Allow Publishing' checkbox is unchecked in section with 'Publishing' title
	#MM app
	When User open new tab in browser
	Given User is logged in newly created account via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	Then 'SharePoint' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	Then 'Documents' folder with 'drive' description is exist on page
	When User clicks close button in 'upsell-dialog' dialog
	When User clicks 'Documents' folder
	Then 'For QA automation' folder with 'Folder' description is exist on page
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'Share' name in 'ToolbarPageElement' container
	Then following buttons are displayed in 'share' menu
		| Button    |
		| Copy Link |

@Licensing @CustomerAdminPortal @Settings @Publishing @PublishDisabled @QA @Staging @Qase[LICENSE-73] @Cleanup
Scenario: Verify_publish_files_tab_is_hidden_on_homepage_if_allow_publish_checkbox_is_disabled_in_the_admin_portal
	#Admin portal
	When User clicks 'Settings' button
	When User unchecks 'Allow Publishing' checkbox in section with 'Publishing' title
	Then 'Allow Publishing' checkbox is unchecked in section with 'Publishing' title
	#MM app
	When User open new tab in browser
	Given User is logged in newly created account via Api
	Then 'Published Files' tab is not displayed on file manager header page

@Licensing @CustomerAdminPortal @Settings @Publishing @PublishDisabled @QA @Staging @Qase[LICENSE-74] @Cleanup
Scenario: Verify_disabling_publishing_by_at_least_one_tenant_blocks_publishing_for_licenses_from_other_tenants_for_same_MM_account
	When User clicks 'Settings' button
	Then 'Allow Publishing' checkbox is checked in section with 'Publishing' title
	#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                    | Type       |
		| Automation_test_2ndSRND | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName            | Seats | ProductId      | EndDate |
		| Automation_test_2ndSRND | 1     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to 'Automation_test_2ndSRND' customer on Admin portal via Api
	When admin 'Automation_test_2ndSRND' accepts BULA terms via API
	When 'Automation_test_2ndSRND' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                                       |
		| add        | MMSUBSCRIPTION | auto.test_1+SRND@mindmanager.onmicrosoft.com |
	When User close 'bula-dialog' dialog
	When User clicks 'Settings' button
	When User unchecks 'Allow Publishing' checkbox in section with 'Publishing' title
	Then 'Allow Publishing' checkbox is unchecked in section with 'Publishing' title
	#MM app
	When User open new tab in browser
	Given User is logged in newly created account via Api
	Then 'Published Files' tab is not displayed on file manager header page
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	Then 'SharePoint' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	Then 'Documents' folder with 'drive' description is exist on page
	When User clicks close button in 'upsell-dialog' dialog
	When User clicks 'Documents' folder
	Then 'For QA automation' folder with 'Folder' description is exist on page
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'Share' name in 'ToolbarPageElement' container
	Then following buttons are displayed in 'share' menu
		| Button    |
		| Copy Link |