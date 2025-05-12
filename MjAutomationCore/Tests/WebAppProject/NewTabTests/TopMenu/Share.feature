@retry(2)
Feature: Share
Check Share functionality in Toolbar Menu

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	Then 'share' Menu is displayed to User

@MindManager @Top_Menu @Share @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1220] @JIRA[MMCV-10511] @Upd_Qase
Scenario: Check_that_the_Invite_Others_to_Edit_button_initiates_the_co_editing_flow
	When User clicks button with 'Copy Link' name in 'share' menu
	Then value is copied to the clipboard
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	Then 'auto_test_SRND' map name is displayed on Toolbar

@MindManager @Top_Menu @Share @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2249] @Upd_Qase
Scenario: Check_that_About_Publishing_info_is_displayed
	When User clicks button with 'about-publishing' name in 'share' menu
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

@MindManager @Top_Menu @Share @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2249] @Upd_Qase
Scenario: Check_Hyperlink_on_About_Publishing_info_page
	When User clicks button with 'about-publishing' name in 'share' menu
	When User switches to '1' tab
	Then page url is 'mindmanager.com/publish#aboutPublishing'
	Then User sees 'About Publishing' header on Right Side panel
	Then User sees 'Publishing FAQ' header on Right Side panel
	Then User sees 'click here' hyperlink on Right Side panel
	When User click 'click here' hyperlink on Right Side panel
	When User switches to '2' tab
	Then page url is 'download.mindjet.com/Legal/Terms_and_Conditions_for_MindManager_Account_Services'

@MindManager @Top_Menu @Share @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1221] @Health_Check @Upd_Qase
Scenario: Check_that_it_is_possible_to_publish_the_map_via_the_browser_app
	When User clicks button with 'publish' name in 'share' menu
	Then header 'Publish Complete!' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'auto_test_SRND.mmap' publish file is open to User
	Then Web Editor page is displayed to the User
	Then published file with 'auto_test_SRND.mmap' name exists via Api
	
@MindManager @Top_Menu @Share @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1222] @Health_Check @Upd_Qase
Scenario: Check_that_it_is_possible_to_publish_an_update_to_the_published_map
	When User clicks button with 'publish' name in 'share' menu
	When User clicks 'Done' button on SOME page
	Then Web Editor page is displayed to the User
	When User clicks 'MT' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	When User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 1' Icon is displayed to the 'MT' Topic
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	When User clicks button with 'publish-update' name in 'share' menu
	Then header 'Update Complete!' is displayed on page
	When User clicks 'Done' button on SOME page
	When User opens published file with 'auto_test_SRND.mmap' name in browser via Api
	Then 'auto_test_SRND.mmap' publish file is open to User
	Then Web Editor page is displayed to the User
	Then 'Priority 1' Icon is displayed to the 'MT' Topic