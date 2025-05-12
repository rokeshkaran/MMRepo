@retry(2)
Feature: CoEditing
Check Co Editing option

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath              |
		| auto_test_SRND.mmap | CommonEmptyATMap.mmap |

@Licensing @CustomerAdminPortal @Settings @CoEditing_Option @Staging @Qase[LICENSE-47] @Cleanup @JIRA[MMCV-9396]
Scenario: Allow_coediting_STG
	#Creating an account in the MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog
	Then 'Allow Co-Editing' checkbox is checked in section with 'Co-Editing' title
	#MM app
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	When User clicks 'Invite Others to Edit' item in 'toolpanel-share-sub-menu' dropdown menu
	#Open chrome browser
	When User openes 'chrome' browser
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then User sees 'Welcome' header on Right Side panel
	When User clicks 'Sign In' button
	When User enters '<emailAddress>' in the 'email' field
	When User enters '<password>' in the 'password' field
	When User clicks 'Sign In' button
	When User login to SharePoint
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'coedit' name in 'OverlayPanelPageElement' container
	Then 'coedit' Menu is displayed to User
	Then button with 'Co-editing enabled' name is displayed in 'coedit' menu

Examples:
	| emailAddress                                  | password   | customerName        |
	| auto.test+247SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Automation_testSRND |

@Licensing @CustomerAdminPortal @Settings @CoEditing_Option @QA @Qase[LICENSE-47] @Cleanup @JIRA[MMCV-9396]
Scenario: Allow_coediting_QA
	#Creating an account in the MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog
	Then 'Allow Co-Editing' checkbox is checked in section with 'Co-Editing' title
	#MM app
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'copy-link' name in 'share-contextmenu' menu
	Then Invite others to edit link is copied to clipboard
	#Open browsers
	When User openes 'chrome' browser
	#User 1
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then User sees 'Welcome' header on Right Side panel
	When User clicks 'Sign In' button
	When User enters '<emailAddress>' in the 'email' field
	When User enters '<password>' in the 'password' field
	When User clicks 'Sign In' button
	When User clicks 'Something Else' button for use case options on Right Side panel
	When User waits for data loading
	When User login to SharePoint
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'coedit' name in 'OverlayPanelPageElement' container
	Then 'coedit' Menu is displayed to User
	Then button with 'Co-editing enabled' name is displayed in 'coedit' menu

Examples:
	| emailAddress                                  | password   | customerName        |
	| auto.test+247SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Automation_testSRND |

@Licensing @CustomerAdminPortal @Settings @CoEditing_Option @Staging @Qase[LICENSE-48] @Cleanup @JIRA[MMCV-9396]
Scenario: Do_not_allow_coediting_STG
	#Creating an account in the MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User clicks 'Settings' button
	Then 'Allow Co-Editing' checkbox is checked in section with 'Co-Editing' title
	When User unchecks 'Allow Co-Editing' checkbox in section with 'Co-Editing' title
	Then 'Allow Co-Editing' checkbox is unchecked in section with 'Co-Editing' title
	#MM App
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	When User clicks 'Invite Others to Edit' item in 'toolpanel-share-sub-menu' dropdown menu
	#Open browsers
	When User openes 'chrome' browser
	#User 1
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then User sees 'Welcome' header on Right Side panel
	When User clicks 'Sign In' button
	When User enters '<emailAddress>' in the 'email' field
	When User enters '<password>' in the 'password' field
	When User clicks 'Sign In' button
	When User login to SharePoint
	Then Web Editor page is displayed to the User
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel

Examples:
	| emailAddress                                  | password   | customerName        |
	| auto.test+248SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Automation_testSRND |

@Licensing @CustomerAdminPortal @Settings @CoEditing_Option @QA @Qase[LICENSE-48] @Cleanup @JIRA[MMCV-9396]
Scenario: Do_not_allow_coediting_QA
	#Creating an account in the MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog
	When User waits '3000' miliseconds
	Then 'Allow Co-Editing' checkbox is checked in section with 'Co-Editing' title
	When User unchecks 'Allow Co-Editing' checkbox in section with 'Co-Editing' title
	Then 'Allow Co-Editing' checkbox is unchecked in section with 'Co-Editing' title
	#MM App
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'copy-link' name in 'share-contextmenu' menu
	Then Invite others to edit link is copied to clipboard
	#Open browsers
	When User openes 'chrome' browser
	#User 1
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then User sees 'Welcome' header on Right Side panel
	When User clicks 'Sign In' button
	When User enters '<emailAddress>' in the 'email' field
	When User enters '<password>' in the 'password' field
	When User clicks 'Sign In' button
	When User clicks 'Something Else' button for use case options on Right Side panel
	When User waits for data loading
	When User login to SharePoint
	Then Web Editor page is displayed to the User
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel

Examples:
	| emailAddress                                  | password   | customerName        |
	| auto.test+248SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Automation_testSRND |

@Licensing @CustomerAdminPortal @Settings @CoEditing_Option @Staging @Qase[LICENSE-49] @Cleanup @JIRA[MMCV-9396]
Scenario: Verify_coediting_disabling_during_active_session_STG
#Creating an account in the MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 5     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	#Open browsers
	When User openes 'chrome' browser
	When User switches to '1' browser
	#User A
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	When User clicks 'Invite Others to Edit' item in 'toolpanel-share-sub-menu' dropdown menu
	#Open browsers
	When User openes 'chrome' browser
	#User B
	When User switches to '2' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then User sees 'Welcome' header on Right Side panel
	When User clicks 'Sign In' button
	When User enters '<emailAddress>' in the 'email' field
	When User enters '<password>' in the 'password' field
	When User clicks 'Sign In' button
	When User login to SharePoint
	Then Web Editor page is displayed to the User
	#Switch to 0 browser
	When User switches to '0' browser
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog
	Then 'Allow Co-Editing' checkbox is checked in section with 'Co-Editing' title
	When User unchecks 'Allow Co-Editing' checkbox in section with 'Co-Editing' title
	Then 'Allow Co-Editing' checkbox is unchecked in section with 'Co-Editing' title
	#User A Actions for save
	When User switches to '2' browser
	When User switches to '1' tab
	When tutorial card is set to 'true' on navigation panel
	When User clicks on text in the 'MT1ST1' topic on Canvas
	Then 'MT1ST1' topic is highlighted with CoEditing frame on Canvas
	When User clicks 'Add callout' button on Tools panel
	Then 'Callout' callout is displayed on Canvas
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User clicks button with 'save' name in 'file' menu
	When User waits '3000' miliseconds
	Then menu button with 'save' name is displayed in 'saved' state on Overlay panel
	When User clicks Logo image on Menu toolbar
	When User clicks 'My Files' tab on file manager header page
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then 'Callout' callout is displayed on Canvas
	#User A Actions for autosave
	When User clicks 'Main Topic' topic on Canvas
	Then 'Main Topic' topic is highlighted with CoEditing frame on Canvas
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Subtopic' subtopic is displayed on Canvas
	When User waits '3000' miliseconds
	Then menu button with 'save' name is displayed in 'saved' state on Overlay panel
	When User clicks Logo image on Menu toolbar
	When User clicks 'My Files' tab on file manager header page
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then 'Subtopic' subtopic is displayed on Canvas

Examples:
	| emailAddress                                  | password   | customerName        |
	| auto.test+249SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Automation_testSRND |

@Licensing @CustomerAdminPortal @Settings @CoEditing_Option @QA @Qase[LICENSE-49] @Cleanup @JIRA[MMCV-9396]
Scenario: Verify_coediting_disabling_during_active_session_QA
#Creating an account in the MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 5     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	#Open browsers
	When User openes 'chrome' browser
	When User switches to '1' browser
	#User A
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'copy-link' name in 'share-contextmenu' menu
	Then Invite others to edit link is copied to clipboard
	#Open browsers
	When User openes 'chrome' browser
	#User B
	When User switches to '2' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then User sees 'Welcome' header on Right Side panel
	When User clicks 'Sign In' button
	When User enters '<emailAddress>' in the 'email' field
	When User enters '<password>' in the 'password' field
	When User clicks 'Sign In' button
	When User login to SharePoint
	Then Web Editor page is displayed to the User
	Then User set zoom level to '36' via the side tool bar
	When tutorial card is set to 'true' on navigation panel
	Then Overlay panel is displayed
	When User clicks on 'coedit' button on the Overlay panel
	Then 'coedit' dropdown menu is displayed to User
	Then button with 'Co-editing enabled' name is displayed in 'coedit' menu
	#Switch to 0 browser
	When User switches to '0' browser
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog
	Then 'Allow Co-Editing' checkbox is checked in section with 'Co-Editing' title
	When User unchecks 'Allow Co-Editing' checkbox in section with 'Co-Editing' title
	Then 'Allow Co-Editing' checkbox is unchecked in section with 'Co-Editing' title
	#Switch to 2 browser
	When User switches to '2' browser
	When User refresh page
	Then Web Editor page is displayed to the User
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel

Examples:
	| emailAddress                                  | password   | customerName        |
	| auto.test+249SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Automation_testSRND |

@Licensing @CustomerAdminPortal @Settings @CoEditing_Option @Staging @Qase[LICENSE-50] @Cleanup @JIRA[MMCV-9396]
Scenario: Verify_opening_locked_map_if_admin_disabled_co-editing_STG
#Creating an account in the MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User clicks 'Settings' button
	Then 'Allow Co-Editing' checkbox is checked in section with 'Co-Editing' title
	When User unchecks 'Allow Co-Editing' checkbox in section with 'Co-Editing' title
	Then 'Allow Co-Editing' checkbox is unchecked in section with 'Co-Editing' title
	#User A
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	When User clicks 'Invite Others to Edit' item in 'toolpanel-share-sub-menu' dropdown menu
	#Open browsers
	When User openes 'chrome' browser
	#User B
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then User sees 'Welcome' header on Right Side panel
	When User clicks 'Sign In' button
	When User enters '<emailAddress>' in the 'email' field
	When User enters '<password>' in the 'password' field
	When User clicks 'Sign In' button
	When User login to SharePoint
	Then Web Editor page is displayed to the User
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel
	When User clicks on 'file' button on the Overlay panel
	Then button with 'read-only' name is displayed in 'file' menu
	Then text 'Read-onlyYour MindManager administrator has disabled co-editingOpened from SharePoint' is displayed in button menu with 'read-only' name in 'file' menu
	When User clicks on 'coedit' button on the Overlay panel
	Then 'coedit' dropdown menu is displayed to User
	Then button with 'Co-editing enabled' name is displayed in 'coedit' menu

Examples:
	| emailAddress                                  | password   | customerName        |
	| auto.test+250SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Automation_testSRND |

@Licensing @CustomerAdminPortal @Settings @CoEditing_Option @QA @Qase[LICENSE-50] @Cleanup @JIRA[MMCV-9396]
Scenario: Verify_opening_locked_map_if_admin_disabled_co-editing_QA
#Creating an account in the MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User clicks 'Settings' button
	Then 'Allow Co-Editing' checkbox is checked in section with 'Co-Editing' title
	When User unchecks 'Allow Co-Editing' checkbox in section with 'Co-Editing' title
	Then 'Allow Co-Editing' checkbox is unchecked in section with 'Co-Editing' title
	#User A
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'copy-link' name in 'share-contextmenu' menu
	Then Invite others to edit link is copied to clipboard
	When User openes 'chrome' browser
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then User sees 'Welcome' header on Right Side panel
	When User clicks 'Sign In' button
	When User enters '<emailAddress>' in the 'email' field
	When User enters '<password>' in the 'password' field
	When User clicks 'Sign In' button
	When User login to SharePoint
	Then Web Editor page is displayed to the User
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel
	When User clicks on 'file' button on the Overlay panel
	Then button with 'read-only' name is displayed in 'file' menu
	Then text 'Read-onlyYour MindManager administrator has disabled co-editingOpened from SharePoint' is displayed in button menu with 'read-only' name in 'file' menu
	When User clicks on 'coedit' button on the Overlay panel
	Then 'coedit' dropdown menu is displayed to User
	Then button with 'Co-editing enabled' name is displayed in 'coedit' menu

Examples:
	| emailAddress                                  | password   | customerName        |
	| auto.test+250SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Automation_testSRND |

@Licensing @CustomerAdminPortal @Settings @CoEditing_Option @QA @Staging @Qase[LICENSE-51] @Cleanup
Scenario: Verify_allow_coediting_tooltip
#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog
	Then 'Allow Co-Editing' checkbox is checked in section with 'Co-Editing' title
	When User hover over 'info' button on 'Allow Co-Editing' label for 'Co-Editing' section
	Then Tooltip 'Allow users on your licenses to co-edit files stored in your allowed online storage locations.' is displayed for 'info' button on 'Allow Co-Editing' label for 'Co-Editing' section

Examples:
	| emailAddress                                  | password   | customerName        |
	| auto.test+251SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Automation_testSRND |

@Licensing @CustomerAdminPortal @Settings @CoEditing_Option @QA @Staging @Qase[LICENSE-52] @Cleanup
Scenario: Verify_allow_coediting_warning_message
#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog
	Then 'Allow Co-Editing' checkbox is checked in section with 'Co-Editing' title
	When User hover over 'warning' button on 'Allow Co-Editing' label for 'Co-Editing' section
	Then Tooltip 'This setting applies to version 22.1 or greater for the following products:MindManager WindowsMindManager MacMindManager for MS TeamsMindManager ChromebookMindManager Web' is displayed for 'warning' button on 'Allow Co-Editing' label for 'Co-Editing' section

Examples:
	| emailAddress                                  | password   | customerName        |
	| auto.test+252SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Automation_testSRND |

@Licensing @CustomerAdminPortal @Settings @CoEditing_Option @Staging @Qase[LICENSE-53] @Cleanup @JIRA[MMCV-9396]
Scenario: Verify_user_cannot_do_coediting_if_user_has_multiple_licenses_with_different_settings_STG
	#Creating an account in the MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(2)    |
	When User creates new Customer on Sales portal via Api
		| Name            | Type       |
		| <customerName2> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName    | Seats | ProductId      | EndDate |
		| <customerName2> | 2     | MMSUBSCRIPTION | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User clicks 'Settings' button
	Then 'Allow Co-Editing' checkbox is checked in section with 'Co-Editing' title
	When User unchecks 'Allow Co-Editing' checkbox in section with 'Co-Editing' title
	Then 'Allow Co-Editing' checkbox is unchecked in section with 'Co-Editing' title
	#Admin portal
	When User is logged in to '<customerName2>' customer on Admin portal via Api
	When admin '<customerName2>' accepts BULA terms via API
	When User close 'bula-dialog' dialog
	When '<customerName2>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User clicks 'Settings' button
	Then 'Allow Co-Editing' checkbox is checked in section with 'Co-Editing' title
	#Open browsers
	When User openes 'chrome' browser
	#User 1
	When User switches to '1' browser
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	When User clicks 'Invite Others to Edit' item in 'toolpanel-share-sub-menu' dropdown menu
	#Open browsers
	When User openes 'chrome' browser
	#User 2
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then User sees 'Welcome' header on Right Side panel
	When User clicks 'Sign In' button
	When User enters '<emailAddress>' in the 'email' field
	When User enters '<password>' in the 'password' field
	When User clicks 'Sign In' button
	When User login to SharePoint
	Then Web Editor page is displayed to the User
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel
	When User clicks on 'file' button on the Overlay panel
	Then button with 'read-only' name is displayed in 'file' menu
	Then text 'Read-onlyYour MindManager administrator has disabled co-editingOpened from SharePoint' is displayed in button menu with 'read-only' name in 'file' menu

Examples:
	| emailAddress                                  | password   | customerName        | customerName2        |
	| auto.test+253SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Automation_testSRND | Automation_test1SRND |

@Licensing @CustomerAdminPortal @Settings @CoEditing_Option @QA @Qase[LICENSE-53] @Cleanup @JIRA[MMCV-9396]
Scenario: Verify_user_cannot_do_coediting_if_user_has_multiple_licenses_with_different_settings_QA
	#Creating an account in the MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 2     | MMSUBSCRIPTION | D(2)    |
	When User creates new Customer on Sales portal via Api
		| Name            | Type       |
		| <customerName2> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName    | Seats | ProductId      | EndDate |
		| <customerName2> | 2     | MMSUBSCRIPTION | D(2)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User refresh page
	When User accepts Optanon cookies
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User clicks 'Settings' button
	Then 'Allow Co-Editing' checkbox is checked in section with 'Co-Editing' title
	When User unchecks 'Allow Co-Editing' checkbox in section with 'Co-Editing' title
	Then 'Allow Co-Editing' checkbox is unchecked in section with 'Co-Editing' title
	#Admin portal
	When User is logged in to '<customerName2>' customer on Admin portal via Api
	When admin '<customerName2>' accepts BULA terms via API
	When User close 'bula-dialog' dialog
	When '<customerName2>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	When User clicks 'Settings' button
	Then 'Allow Co-Editing' checkbox is checked in section with 'Co-Editing' title
	#Open browsers
	When User openes 'chrome' browser
	#User 1
	When User switches to '1' browser
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'copy-link' name in 'share-contextmenu' menu
	Then Invite others to edit link is copied to clipboard
	When User openes 'chrome' browser
	When User switches to '2' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then User sees 'Welcome' header on Right Side panel
	When User clicks 'Sign In' button
	When User enters '<emailAddress>' in the 'email' field
	When User enters '<password>' in the 'password' field
	When User clicks 'Sign In' button
	When User login to SharePoint
	Then Web Editor page is displayed to the User
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel
	When User clicks on 'file' button on the Overlay panel
	Then button with 'read-only' name is displayed in 'file' menu
	Then text 'Read-onlyYour MindManager administrator has disabled co-editingOpened from SharePoint' is displayed in button menu with 'read-only' name in 'file' menu

Examples:
	| emailAddress                                  | password   | customerName        | customerName2        |
	| auto.test+253SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Automation_testSRND | Automation_test1SRND |