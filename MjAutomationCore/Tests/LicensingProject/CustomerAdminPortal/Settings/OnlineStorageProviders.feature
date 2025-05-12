@retry(2)
Feature: OnlineStorageProviders
Check online storage providers functionality

Background: Pre-condition
	#Creating an account in the MM app
	Given User account
		| Email                                         | Password   |
		| auto.test+245SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
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
		| ActionType | PurchaseId     | Emails                                        |
		| add        | MMSUBSCRIPTION | auto.test+245SRND@mindmanager.onmicrosoft.com |
	When User refresh page
	When User accepts Optanon cookies
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog

@Licensing @CustomerAdminPortal @Settings @OnlineStorageProviders @QA @Staging @Qase[LICENSE-75] @Cleanup @Upd_Qase
Scenario: Verify_Info_Button_Tooltip
	#Admin portal
	When User hover over 'info' button on 'Online Storage Providers' section
	Then Tooltip 'Allow users on your licenses to use cloud file storage, enabling them to open from, save to, and co-edit using these services when using MindManager apps. MindManager Files is a SOC 2 certified cloud storage service offered by MindManager. Other services available are managed by 3rd parties.' is displayed for 'info' button in 'Online Storage Providers' section

@Licensing @CustomerAdminPortal @Settings @OnlineStorageProviders @QA @Qase[LICENSE-76] @Cleanup @Upd_Qase
Scenario: Verify_Warning_Button_Tooltip
	#Admin portal
	When User hover over 'warning' button on 'Online Storage Providers' section
	Then Tooltip 'This setting applies to online versions of MindManager only.3rd party storage service controls apply to versions 22.1 or greater for the following products:MindManager WindowsMindManager MacMindManager ChromebookMindManager ChromebookMindManager WebMindManager Files controls apply to version 23.2 or greater for the following products:MindManager WindowsMindManager ChromebookMindManager WebYour organization has not verified domains for SSO so disallowing this feature will prevent users from using it, but previously stored data will not be deleted. Please inform your users they must delete their data prior to disallowing this feature. If you wish to delete data on behalf of your licensed users you must verify your email domains via the SSO setup process.' is displayed for 'warning' button in 'Online Storage Providers' section

@Licensing @CustomerAdminPortal @Settings @OnlineStorageProviders @QA @Staging @Qase[LICENSE-77] @Cleanup @Upd_Qase
Scenario: Allow_Microsoft_OneDrive
	#Admin portal
	Then 'Allow Microsoft OneDrive' checkbox is checked in section content group with 'Online Storage Providers' header
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+245SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User select 'Add Place' content item with 'Tap to Select Storage Provider' description
	Then following cloud items on content manager is displayed to the User:
		| CloudItemTitle |
		| OneDrive       |
		| SharePoint     |
		| Google         |
		| Dropbox        |
		| Box            |

@Licensing @CustomerAdminPortal @Settings @OnlineStorageProviders @QA @Staging @Qase[LICENSE-78] @Cleanup @Upd_Qase
Scenario: Do_not_allow_Microsoft_OneDrive
	#Admin portal
	Then 'Allow Microsoft OneDrive' checkbox is checked in section content group with 'Online Storage Providers' header
	When User unchecks 'Allow Microsoft OneDrive' checkbox in section content group with 'Online Storage Providers' header
	Then 'Allow Microsoft OneDrive' checkbox is unchecked in section content group with 'Online Storage Providers' header
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+245SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User select 'Add Place' content item with 'Tap to Select Storage Provider' description
	Then following cloud items on content manager is displayed to the User:
		| CloudItemTitle |
		| SharePoint     |
		| Google         |
		| Dropbox        |
		| Box            |

@Licensing @CustomerAdminPortal @Settings @OnlineStorageProviders @QA @Staging @Qase[LICENSE-79] @Cleanup @Upd_Qase
Scenario: Allow_Microsoft_SharePoint
	#Admin portal
	Then 'Allow Microsoft SharePoint' checkbox is checked in section content group with 'Online Storage Providers' header
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+245SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User select 'Add Place' content item with 'Tap to Select Storage Provider' description
	Then following cloud items on content manager is displayed to the User:
		| CloudItemTitle |
		| OneDrive       |
		| SharePoint     |
		| Google         |
		| Dropbox        |
		| Box            |

@Licensing @CustomerAdminPortal @Settings @OnlineStorageProviders @QA @Staging @Qase[LICENSE-80] @Cleanup @Upd_Qase
Scenario: Do_not_allow_Microsoft_SharePoint
	#Admin portal
	Then 'Allow Microsoft SharePoint' checkbox is checked in section content group with 'Online Storage Providers' header
	When User unchecks 'Allow Microsoft SharePoint' checkbox in section content group with 'Online Storage Providers' header
	Then 'Allow Microsoft SharePoint' checkbox is unchecked in section content group with 'Online Storage Providers' header
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+245SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User select 'Add Place' content item with 'Tap to Select Storage Provider' description
	Then following cloud items on content manager is displayed to the User:
		| CloudItemTitle |
		| OneDrive       |
		| Google         |
		| Dropbox        |
		| Box            |

@Licensing @CustomerAdminPortal @Settings @OnlineStorageProviders @QA @Staging @Qase[LICENSE-81] @Cleanup @Upd_Qase
Scenario: Allow_Google_Drive
	#Admin portal
	Then 'Allow Google Drive' checkbox is checked in section content group with 'Online Storage Providers' header
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+245SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User select 'Add Place' content item with 'Tap to Select Storage Provider' description
	Then following cloud items on content manager is displayed to the User:
		| CloudItemTitle |
		| OneDrive       |
		| SharePoint     |
		| Google         |
		| Dropbox        |
		| Box            |

@Licensing @CustomerAdminPortal @Settings @OnlineStorageProviders @QA @Staging @Qase[LICENSE-82] @Cleanup @Upd_Qase
Scenario: Do_not_allow_Google_Drive
	#Admin portal
	Then 'Allow Google Drive' checkbox is checked in section content group with 'Online Storage Providers' header
	When User unchecks 'Allow Google Drive' checkbox in section content group with 'Online Storage Providers' header
	Then 'Allow Google Drive' checkbox is unchecked in section content group with 'Online Storage Providers' header
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+245SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User select 'Add Place' content item with 'Tap to Select Storage Provider' description
	Then following cloud items on content manager is displayed to the User:
		| CloudItemTitle |
		| OneDrive       |
		| SharePoint     |
		| Dropbox        |
		| Box            |

@Licensing @CustomerAdminPortal @Settings @OnlineStorageProviders @QA @Staging @Qase[LICENSE-83] @Cleanup @Upd_Qase
Scenario: Allow_Dropbox
	#Admin portal
	Then 'Allow Dropbox' checkbox is checked in section content group with 'Online Storage Providers' header
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+245SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User select 'Add Place' content item with 'Tap to Select Storage Provider' description
	Then following cloud items on content manager is displayed to the User:
		| CloudItemTitle |
		| OneDrive       |
		| SharePoint     |
		| Google         |
		| Dropbox        |
		| Box            |

@Licensing @CustomerAdminPortal @Settings @OnlineStorageProviders @QA @Staging @Qase[LICENSE-84] @Cleanup @Upd_Qase
Scenario: Do_not_allow_Dropbox
	#Admin portal
	Then 'Allow Dropbox' checkbox is checked in section content group with 'Online Storage Providers' header
	When User unchecks 'Allow Dropbox' checkbox in section content group with 'Online Storage Providers' header
	Then 'Allow Dropbox' checkbox is unchecked in section content group with 'Online Storage Providers' header
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+245SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User select 'Add Place' content item with 'Tap to Select Storage Provider' description
	Then following cloud items on content manager is displayed to the User:
		| CloudItemTitle |
		| OneDrive       |
		| SharePoint     |
		| Google         |
		| Box            |

@Licensing @CustomerAdminPortal @Settings @OnlineStorageProviders @QA @Staging @Qase[LICENSE-85] @Cleanup @Upd_Qase
Scenario: Allow Box
	#Admin portal
	Then 'Allow Box' checkbox is checked in section content group with 'Online Storage Providers' header
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+245SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User select 'Add Place' content item with 'Tap to Select Storage Provider' description
	Then following cloud items on content manager is displayed to the User:
		| CloudItemTitle |
		| OneDrive       |
		| SharePoint     |
		| Google         |
		| Dropbox        |
		| Box            |

@Licensing @CustomerAdminPortal @Settings @OnlineStorageProviders @QA @Staging @Qase[LICENSE-86] @Cleanup @Upd_Qase
Scenario: Do_not_allow_Box
	#Admin portal
	Then 'Allow Box' checkbox is checked in section content group with 'Online Storage Providers' header
	When User unchecks 'Allow Box' checkbox in section content group with 'Online Storage Providers' header
	Then 'Allow Box' checkbox is unchecked in section content group with 'Online Storage Providers' header
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+245SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User select 'Add Place' content item with 'Tap to Select Storage Provider' description
	Then following cloud items on content manager is displayed to the User:
		| CloudItemTitle |
		| OneDrive       |
		| SharePoint     |
		| Google         |
		| Dropbox        |

@Licensing @CustomerAdminPortal @Settings @OnlineStorageProviders @QA @Staging @Qase[LICENSE-594] @Cleanup @Upd_Qase
Scenario: Do_not_allow_mindManager_files
	#Admin portal
	Then 'Allow MindManager Files' checkbox is checked in section content group with 'Online Storage Providers' header
	When User unchecks 'Allow MindManager Files' checkbox in section content group with 'Online Storage Providers' header
	Then 'Users will lose access to any existing MindManager Files that were created before disabling.' header is displayed in 'dialog-mmcloud-uncheck-confirm-disable' dialog
	Then 'Type DISABLE below to continue.' text is displayed in 'dialog-mmcloud-uncheck-confirm-disable' dialog
	When User enters 'DISABLE' value in the 'confirm-input' field in 'dialog-mmcloud-uncheck-confirm-disable' dialog
	When User clicks 'Continue' button in 'dialog-mmcloud-uncheck-confirm-disable' dialog
	Then 'Allow MindManager Files' checkbox is unchecked in section content group with 'Online Storage Providers' header
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+245SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	Then 'MindManager Files' content item is not displayed on content manager page

@Licensing @CustomerAdminPortal @Settings @OnlineStorageProviders @QA @Staging @Qase[LICENSE-595] @Cleanup @Upd_Qase
Scenario: To_verify_mindManager_files_cloud_is_available_by_default
	#Admin portal
	Then 'Allow MindManager Files' checkbox is checked in section content group with 'Online Storage Providers' header
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+245SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	Then 'MindManager Files' content item is displayed on content manager page