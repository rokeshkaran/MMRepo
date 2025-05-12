@retry(2)
Feature: InteractionWithIndividualUsers
Check adding individual users to share files with them

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-104] @Upd_Qase
Scenario: To_verify_that_user_cannot_use_or_see_the_features_created_for_user_without_the_full_subscription
	Given '21' User is logged into MindManager web app via Api
	When '21' User upload capture item via Api
		| Type    | Source           | Text       | Link | Note | File                       |
		| mappart | MindManager Snap | Test2_SRND |      |      | Business profile info.mmap |
		| mappart | MindManager Snap | Test3_SRND |      |      | Business profile info.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle |
		| Test2_SRND       |
		| Test3_SRND       |
	When User Right clicks capture item with 'Test2_SRND' title of Snap panel
	Then Snap context menu is displayed
	Then following items are displayed in Snap Context Menu:
		| ItemTitle     |
		| Quick View    |
		| Send to Trash |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-110] @Upd_Qase
Scenario: To_verify_that_user_without_a_full_subscription_has_basic_Snap_Queue_features_in_the_web_app
	Given '21' User is logged into MindManager web app via Api
	When '21' User upload capture item via Api
		| Type    | Source           | Text       | Link | Note | File                       |
		| mappart | MindManager Snap | Test2_SRND |      |      | Business profile info.mmap |
		| mappart | MindManager Snap | Test3_SRND |      |      | Business profile info.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle |
		| Test2_SRND       |
		| Test3_SRND       |
	When User Right clicks capture item with 'Test2_SRND' title of Snap panel
	Then Snap context menu is displayed
	Then following items are displayed in Snap Context Menu:
		| ItemTitle     |
		| Quick View    |
		| Send to Trash |
	When User clicks by coordinates '100' and '100' on Canvas
	When User drags and drops 'Test2_SRND' capture item from Snap panel in 'ImageTopic2' topic
	Then 'profile info' topic is displayed on Canvas
	Then 'Appropriate standards' subtopic is displayed on Canvas
	Then 'Benchmark' subtopic is displayed on Canvas

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-111] @Upd_Qase
Scenario: To_verify_that_User_can_view_Snap_Queue_in_the_web_app
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then Snap button is displayed on Side menu panel
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then 'There's nothing here yet' message title is displayed on Snap panel
	Then 'Photos, notes, and more appear here when you using Snap. Send from mobile, browser or desktop companion app.' content text is displayed on Snap panel
	Then 'Filter' button is displayed on Snap panel
	Then 'Open Search' button is displayed on Snap panel
	Then 'Refresh' button is displayed on Snap panel
	Then 'Options' button is displayed on Snap panel