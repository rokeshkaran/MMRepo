@retry(2)
Feature: InteractionWithSnapTeam
	Check interaction with Snap Team

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @SnapTeamCleanup @Qase[MSNAP-114] @Upd_Qase @JIRA[MMCV-4553]
Scenario: To_verify_interacting_with_items_in_the_Team_Queue
	Given '1' User is logged into MindManager web app via Api
	When '1' User creates teams in Snap Queue via Api
		| Name                      |
		| Automation_test_team_SRND |
	When '1' User upload capture item to 'Automation_test_team_SRND' team via Api
		| Type    | Source           | Text                       | Link | Note | Item | File                       |
		| mappart | MindManager Snap | automation_mappart_1#_SRND |      |      |      | Business profile info.mmap |
		| mappart | MindManager Snap | automation_mappart_2#_SRND |      |      |      | Business profile info.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then 'There's nothing here yet' message title is displayed on Snap panel
	Then 'Photos, notes, and more appear here when you using Snap. Send from mobile, browser or desktop companion app.' content text is displayed on Snap panel
	Then 'My Snap Queue' menu button is displayed in Snap Panel
	When User clicks 'My Snap Queue' menu button on Snap panel
	When User clicks 'Automation_test_team_SRND' item in 'mm-capture-queue-popup-item' menu in 'mm-capture-queue-selector-view' container on Snap Panel
	Then following capture items are displayed in Snap panel:
		| captureItemTitle           |
		| automation_mappart_1#_SRND |
		| automation_mappart_2#_SRND |
	When User moves Side panel resizable handle by '-20' '0' coordinates
	When User clicks 'Options' button on Snap panel
	Then 'Snap' side panel with 'Options' header is displayed to the User
	When User clicks 'Back' button on Snap panel
	Then 'Automation_test_team_SRND' menu button is displayed in Snap Panel
	When User drags and drops 'automation_mappart_2#_SRND' capture item from Snap panel in 'ImageTopic2' topic
	Then 'profile info' topic is displayed on Canvas
	Then 'Appropriate standards' subtopic is displayed on Canvas
	Then 'Benchmark' subtopic is displayed on Canvas
	Then following capture items are displayed in Snap panel:
		| captureItemTitle           |
		| automation_mappart_1#_SRND |
		| automation_mappart_2#_SRND |
	When User clicks capture item with 'automation_mappart_1#_SRND' title on Snap panel
	Then capture item with 'automation_mappart_1#_SRND' title is selected
	Then capture item with 'automation_mappart_1#_SRND' title is highlighted border color 'rgb(84, 156, 248)' on Snap panel
	When User presses the 'Delete' key on the keyboard
	Then following capture items are displayed in Snap panel:
		| captureItemTitle           |
		| automation_mappart_2#_SRND |
	Then '1' number of 'trash' items is displayed on 'Open Trash' button in capture queue buttons dropdown
	When User clicks 'Open Trash' button on Snap panel
	Then 'Snap' side panel with 'Trash' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle           |
		| automation_mappart_1#_SRND |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @SnapTeamCleanup @Qase[MSNAP-115] @Upd_Qase
Scenario: To_verify_the_ability_to_add_and_remove_member_to_a_new_team
 #Create User B
	Given User is on the Mindmanager website
	When User accepts Optanon cookies
	Then Right Side panel is displayed
	Then 'Create Account' button is displayed
	When User clicks 'Create Account' button
	When User fills account creation fields for new UI
		| Email          | FullName   | Password   |
		| <emailAddress> | <userName> | <password> |
	When User clicks 'Create Account' button
	When User waits for data loading
	When User waits '1000' miliseconds
	Then User sees 'Verify your account to continue' header on Right Side panel
	Then User sees 'An email was just sent to <emailAddress>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
	When User switches to '0' tab
	When User waits for data loading
	When User clicks 'Something Else' button for use case options on Right Side panel
  #User A
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '15' User is logged into MindManager web app via Api
	When User accepts Optanon cookies
	When '15' User creates teams in Snap Queue via Api
		| Name                      |
		| Automation_test_team_SRND |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then 'There's nothing here yet' message title is displayed on Snap panel
	Then 'Photos, notes, and more appear here when you using Snap. Send from mobile, browser or desktop companion app.' content text is displayed on Snap panel
	Then 'My Snap Queue' menu button is displayed in Snap Panel
	When User clicks 'My Snap Queue' menu button on Snap panel
	When User clicks 'Add/Manage Teams' item in 'open-manage' menu in 'mm-capture-queue-selector-view' container on Snap Panel
	Then 'Add / Manage Teams' header is displayed on panel
	When User clicks 'Automation_test_team_SRND' item in 'display-name' menu in 'teams-container' container on Snap Panel
	Then Participant menu is displayed on Snap panel
	When User clicks 'Add Member' footer button on Snap panel
	Then Add Member entry field is displayed on Snap Panel
	When User enter 'auto.test+SRND@mindmanager.onmicrosoft.com' email in add member entry field on Snap Panel
	When User clicks 'Add Member(s)' footer button on Snap panel
	Then User '<userName>' with email '<emailAddress>' is in 'Pending' status is displayed in 'Add / Manage Team' queue title on Snap panel
	When User switches to '0' browser
	When User with 'auto.test@mindmanager.onmicrosoft.com' email address accept invite from user '15' for 'Automation_test_team_SRND' snap team with email "invited you to the MindManager Snap Team" header and success message 'The request was successfully accepted.'
	When User switches to '1' browser
	When User click back button on 'Add / Manage Team' Title on Snap Panel
	Then 'Add / Manage Teams' header is displayed on panel
	When User clicks 'Automation_test_team_SRND' item in 'display-name' menu in 'teams-container' container on Snap Panel
	Then Participant menu is displayed on Snap panel
	Then User '<userName>' with email '<emailAddress>' is in 'Member' status is displayed in 'Add / Manage Team' queue title on Snap panel
	When User clicks on close button on user '<userName>' displayed in 'Add / Manage Team' queue title on Snap panel
	Then User '<userName>' is not displayed in 'Add / Manage Team' queue title on Snap panel

Examples:
	| userName            | emailAddress                               | password   |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @SnapTeamCleanup @Qase[MSNAP-116] @Upd_Qase
Scenario: To_verify_Share_command_in_the_Context_menu
	Given '1' User is logged into MindManager web app via Api
	When '1' User creates teams in Snap Queue via Api
		| Name                      |
		| Automation_test_team_SRND |
	When '1' User upload capture item via Api
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
		| Share         |
		| Send to Trash |
	When User clicks 'Share' item in context menu
	When User clicks 'Automation_test_team_SRND' item in 'display-name' menu in 'teams-wrapper' container on Snap Panel
	Then 'Shared!' overlay is displayed on 'Test2_SRND' capture item on Snap panel
	When User clicks 'My Snap Queue' menu button on Snap panel
	When User clicks 'Automation_test_team_SRND' item in 'mm-capture-queue-popup-item' menu in 'mm-capture-queue-selector-view' container on Snap Panel
	Then following capture items are displayed in Snap panel:
		| captureItemTitle |
		| Test2_SRND       |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-118] @Upd_Qase
Scenario: To_verify_My_Queue_start_page
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then 'There's nothing here yet' message title is displayed on Snap panel
	Then 'Photos, notes, and more appear here when you using Snap. Send from mobile, browser or desktop companion app.' content text is displayed on Snap panel
	Then 'My Snap Queue' menu button is displayed in Snap Panel
	Then 'Get Snap for mobile and more' footer message is displayed on Snap panel
	Then 'Learn the basics of Snap' footer message is displayed on Snap panel

@Snap @App_QA @App_Staging @Cleanup @Snap_Cleanup @Qase[MSNAP-119] @Upd_Qase
Scenario: To_verify_that_user_cannot_use_or_see_the_features_created_for_user_with_the_full_subscription
#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name       | Type       |
		| <userName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName | Seats | ProductId    | EndDate |
		| <userName>   | 3     | MMESSENTIALS | D(2)    |
#Admin portal
	When User is logged in to '<userName>' customer on Admin portal via Api
	When admin '<userName>' accepts BULA terms via API
	When User close 'bula-dialog' dialog
	When User accepts Optanon cookies
	When User find 'MindManager Essentials' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Essentials' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value                  |
		| Version          | MindManager Essentials |
		| Expires          | D(2)                   |
		| Seats Used/Total | 1/3                    |
	#User
	Given User is on the Mindmanager website
	When User accepts Optanon cookies
	Then Right Side panel is displayed
	Then 'Create Account' button is displayed
	When User clicks 'Create Account' button
	When User fills account creation fields for new UI
		| Email          | FullName   | Password   |
		| <emailAddress> | <userName> | <password> |
	When User clicks 'Create Account' button
	When User waits for data loading
	Then User sees 'Verify your account to continue' header on Right Side panel
	Then User sees 'An email was just sent to <emailAddress>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
	When User switches to '0' tab
	When User clicks 'Something Else' button for use case options on Right Side panel
	When User waits for data loading
	Then file manager header page is displayed to User
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User open new tab in browser
	Given User with '<emailAddress>' email and '<password>' password is logged into MindManager web app via Api
	When User refresh page
	When User with '<emailAddress>' email and '<password>' password upload capture item via Api
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

Examples:
	| userName            | emailAddress                               | password   |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-122] @Upd_Qase @JIRA[MMCV-9093,MMCV-10252] @Not_Run
Scenario: To_verify_Quick_View_command_from_the_Snap_Context_menu
	Given '1' User is logged into MindManager web app via Api
	When '1' User upload capture item via Api
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
		| Share         |
		| Send to Trash |
	When User clicks 'Quick View' item in context menu
	#Then topic is displayed image format 
	When User click back button on 'Quick View' Title on Snap Panel
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle |
		| Test3_SRND       |
		| Test2_SRND       |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-123] @Upd_Qase
Scenario: To_verify_Search_UI
	Given '1' User is logged into MindManager web app via Api
	When '1' User upload capture item via Api
		| Type    | Source           | Text       | Link                    | Note | File                       |
		| mappart | MindManager Snap | Test2_SRND | https://www.google.com/ |      |                            |
		| mappart | MindManager Snap | Test3_SRND |                         |      | Business profile info.mmap |
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
	When User clicks 'Open Search' button on Snap panel
	Then 'mm-capture-queue-search-input' input filed is displayed in 'CaptureQueueHeaderElement' container
	When User clicks on 'mm-capture-queue-search-input' field of 'CaptureQueueHeaderElement' container
	Then search icon is not displayed in Search field on Span panel
	When User enters 'Test2_SRND' value in 'mm-capture-queue-search-input' field of 'CaptureQueueHeaderElement' container
	When User presses the 'Enter' key on the keyboard
	Then following capture items are displayed in Snap panel:
		| captureItemTitle |
		| Test2_SRND       |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-124] @Upd_Qase
Scenario: Applying_Send_to_Trash_command_from_context_menu
	Given '1' User is logged into MindManager web app via Api
	When '1' User upload capture item via Api
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
		| Share         |
		| Send to Trash |
	When User clicks 'Send to Trash' item in context menu
	Then '1' number of 'trash' items is displayed on 'Open Trash' button in capture queue buttons dropdown
	When User clicks 'Open Trash' button on Snap panel
	Then 'Snap' side panel with 'Trash' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle |
		| Test2_SRND       |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-125] @Upd_Qase
Scenario: To_verify_that_user_with_a_full_subscription_has_extended_Snap_Queue_features_in_web_app
	Given '1' User is logged into MindManager web app via Api
	When '1' User upload capture item via Api
		| Type    | Source           | Text       | Link                    | Note | File                       |
		| mappart | MindManager Snap | Test2_SRND |                         |      | Business profile info.mmap |
		| mappart | MindManager Snap | Test3_SRND |                         |      | Business profile info.mmap |
		| link    | MindManager Snap | Test4_SRND | https://www.google.com/ |      |                            |
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
		| Test4_SRND       |
	When User clicks 'My Snap Queue' menu button on Snap panel
	Then 'Add/Manage Teams' item in 'open-manage' menu in 'mm-capture-queue-selector-view' container is displayed on Snap panel
	When User clicks by coordinates '100' and '100' on Canvas
	When User Right clicks capture item with 'Test4_SRND' title of Snap panel
	Then Snap context menu is displayed
	Then following items are displayed in Snap Context Menu:
		| ItemTitle              |
		| Quick View             |
		| Share                  |
		| Send to Trash          |
	When User clicks by coordinates '200' and '200' on Canvas
	When User clicks capture item with 'Test3_SRND' title on Snap panel
	Then capture item with 'Test3_SRND' title is selected
	Then capture item with 'Test3_SRND' title is highlighted border color 'rgb(84, 156, 248)' on Snap panel
	When User drags and drops 'Test3_SRND' capture item from Snap panel in 'ImageTopic2' topic
	Then 'profile info' topic is displayed on Canvas
	Then 'Appropriate standards' subtopic is displayed on Canvas
	Then 'Benchmark' subtopic is displayed on Canvas