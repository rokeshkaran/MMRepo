@retry(2)
Feature: UnpublishMap
Check Share functionality in Toolbar Menu for MindManager Files for Unpublished maps

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	Given User uploads following files to '/' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User waits for data loading
	When User clicks 'auto_test_SRND' file
	Then Web Editor page is displayed to the User

@MindManager @ShareMenus @Toolbar @UnpublishMap @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2234] @Upd_Qase
Scenario: Check_share_menu_buttons_on_tool_bar
	When User clicks 'Share' button on Tools panel
	Then following buttons are displayed in 'share' menu
		| items            |
		| Share            |
		| Copy Link        |
		| Publish          |
		| About Publishing |

@MindManager @ShareMenus @Toolbar @UnpublishMap @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2234,WEB-2239] @Upd_Qase
Scenario: Check_share_menu_export_on_tool_bar
	When User clicks 'Share' button on Tools panel
	Then following menu buttons are displayed in 'share' menu
		| items  |
		| Export |
	When User mouse hovers menu button with 'export' name in 'share' menu
	Then following buttons are displayed in 'export' menu
		| Button             |
		| Download as HTML 5 |
		| Download as MMAP   |

@MindManager @ShareMenus @Toolbar @UnpublishMap @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2234] @Upd_Qase
Scenario: Check_share_menu_separators_on_tool_bar
	When User clicks 'Share' button on Tools panel
	Then Custom content 'joint-horizontal-separator' is displayed at the folowing number in 'share' menu
		| number |
		| 3      |
		| 6      |

@MindManager @ShareMenus @Toolbar @UnpublishMap @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2235] @Upd_Qase
Scenario: Check_share_dialog_screen_opening_from_tool_bar
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'Share' name in 'share-contextmenu' menu
	Then 'share-file-dialog' dialog is displayed to User

@MindManager @ShareMenus @Toolbar @UnpublishMap @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2236] @Upd_Qase
Scenario: To_verify_the_link_to_MindManager_File_gets_copied_to_clipboard_after_clicking_Copy_link_option_on_share_tool_bar
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'Copy Link' name in 'share-contextmenu' menu
	Then value is copied to the clipboard
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	When User waits for data loading
	Then Web Editor page is displayed to the User
	Then 'auto_test_SRND' map name is displayed on Toolbar

@MindManager @ShareMenus @Toolbar @UnpublishMap @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2238] @Upd_Qase
Scenario: Check_that_About_Publishing_info_is_displayed
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'about-publishing' name in 'share-contextmenu' menu
	When User switches to '1' tab
	Then page url is 'mindmanager.com/publish#aboutPublishing'
	Then User sees 'About Publishing' header on Right Side panel
	Then User sees 'Publishing FAQ' header on Right Side panel
	Then User sees 'click here' hyperlink on Right Side panel
	Then User sees folowing subheaders on Right Side panel
		| Text                                                     |
		| How much does it cost?                                   |
		| How long will my file stay published online?             |
		| Where is my published file stored?                       |
		| What if I need to publish updates to my published file?  |
		| What are the terms and conditions of using this service? |
	Then User sees folowing text on Right Side panel
		| Text                                                                                                                                                                                                                                                                                                                                                |
		| Publishing is available in this version of MindManager. It allows you to publish your MindManager files online. Anyone you share your published file with will be able to view it in their browser even if they do not have MindManager installed. You control whether viewers can download your published files and can configure custom branding. |
		| The publishing service is available at no extra charge for customers who have purchased or upgraded a license in the last 16 months, or have an active MSA or UPP subscription.                                                                                                                                                                     |
		| That’s up to you! You can always view your previously published files and un-publish them at any time as long as your publishing service is still active.                                                                                                                                                                                           |
		| Published files are stored on secure Corel servers in North America for US users and in Frankfurt/Main Germany for customers in Europe and the rest of the world.                                                                                                                                                                                   |
		| Changes made to your file will not be published until you elect to do so by choosing “Publish Update” from the MindManager interface. Once you do so, the previous version of your file in the cloud is updated to the latest version while retaining the same links and embed codes. There is no need to send new links or update embed codes.     |
		| To view the current terms and conditions, please click here.                                                                                                                                                                                                                                                                                        |

@MindManager @ShareMenus @Toolbar @UnpublishMap @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2290] @Upd_Qase
Scenario: Check_that_the_Export_button_from_Share_toolbar_menu_allows_export_HTML_file
	When User clicks 'Share' button on Tools panel
	Then following menu buttons are displayed in 'share' menu
		| items  |
		| Export |
	When User mouse hovers menu button with 'export' name in 'share' menu
	Then following buttons are displayed in 'export' menu
		| Button             |
		| Download as HTML 5 |
		| Download as MMAP   |
	When User clicks button with 'export-html' name in 'export' menu
	Then User checks that file 'auto_test_SRND.html' was downloaded

@MindManager @ShareMenus @Toolbar @UnpublishMap @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2291] @Upd_Qase
Scenario: Check_that_the_Export_button_from_Share_toolbar_menu_allows_download_mmap_file
	When User clicks 'Share' button on Tools panel
	Then following menu buttons are displayed in 'share' menu
		| items  |
		| Export |
	When User mouse hovers menu button with 'export' name in 'share' menu
	Then following buttons are displayed in 'export' menu
		| Button             |
		| Download as HTML 5 |
		| Download as MMAP   |
	When User clicks button with 'export-mmap' name in 'export' menu
	Then User checks that file 'auto_test_SRND.mmap' was downloaded