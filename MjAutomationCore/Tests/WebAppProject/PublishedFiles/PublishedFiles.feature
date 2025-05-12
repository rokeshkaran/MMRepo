@retry(2)
Feature: PublishedFiles

@MindManager @Published_Files @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-103] @Health_Check @Upd_Qase
Scenario: Verify_that_user_is_able_to_view_published_maps
	Given '7' User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given '7' User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then Menu toolbar is displayed to Presentation mode

@MindManager @Published_Files @App_QA @App_Staging @App_Prod @Qase[WEB-104] @Cleanup @Health_Check @Upd_Qase @JIRA[MMCV-9156]
Scenario: Check_that_the_user_can_unpublish_any_map_in_their_account
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Un-Publish' item in 'file-manager' dropdown menu
	Then header 'Un-publish Complete!' is displayed on page
	When User clicks 'Done' button
	Then file manager header page is displayed to User
	Then published file with 'auto_test_SRND' name does not exist via Api

@MindManager @Published_Files @QA @Staging @Prod @Cleanup @Qase[WEB-104] @Upd_Qase
Scenario: Check_that_the_user_can_unpublish_any_map_in_their_account_cloud
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Un-Publish' item in 'file-manager' dropdown menu
	Then header 'Un-publish Complete!' is displayed on page
	Then published file with 'auto_test_SRND' name does not exist via Api

@MindManager @Published_Files @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-105] @Upd_Qase
Scenario: Check_it_is_possible_to_post_the_map_on_social_media
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User switches to iframe
	When User clicks 'facebook' icon in 'Post on Social Media' section
	When User switches to '1' tab
	Then page url is 'https://www.facebook.com/sharer'
	When User close Active tab
	When User switches to '0' tab
	When User switches to iframe
	When User clicks 'twitter' icon in 'Post on Social Media' section
	When User switches to '1' tab
	Then page url is 'https://x.com/intent/'
	When User close Active tab
	When User switches to '0' tab
	When User switches to iframe
	When User clicks 'linkedin' icon in 'Post on Social Media' section
	When User switches to '1' tab
	Then page url is 'https://www.linkedin.com/uas/login'

@MindManager @Published_Files @QA @Staging @Prod @Cleanup @Qase[WEB-105] @Upd_Qase
Scenario: Check_it_is_possible_to_post_the_map_on_social_media_cloud
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User switches to iframe
	When User clicks 'facebook' icon in 'Post on Social Media' section
	When User switches to '1' tab
	Then page url is 'https://www.facebook.com/login'
	When User close Active tab
	When User switches to '0' tab
	When User clicks 'twitter' icon in 'Post on Social Media' section
	When User switches to '1' tab
	Then page url is 'https://x.com/intent/'
	When User close Active tab
	When User switches to '0' tab
	When User clicks 'linkedin' icon in 'Post on Social Media' section
	When User switches to '1' tab
	Then page url is 'https://www.linkedin.com/uas/login'

@MindManager @Published_Files @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-106] @Upd_Qase
Scenario: Check_that_it_is_possible_to_copy_and_paste_the_shared_link
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'auto_test_SRND' publish file is open to User
	Then Menu toolbar is displayed to Presentation mode

@MindManager @Published_Files @QA @Staging @Prod @Cleanup @Qase[WEB-106] @Upd_Qase
Scenario: Check_that_it_is_possible_to_copy_and_paste_the_shared_link_cloud
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND' published file via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'Share' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then header 'Share Published' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'auto_test_SRND' publish file is open to User
	Then Menu toolbar is displayed to Presentation mode

@MindManager @Published_Files @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-108] @Upd_Qase
Scenario: Verify_that_it_possible_to_download_map_to_user_pc
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Download Map' item in 'file-manager' dropdown menu
	Then User checks that file 'auto_test_SRND' was downloaded

@MindManager @Published_Files @QA @Staging @Prod @Cleanup @Qase[WEB-108] @Upd_Qase
Scenario: Verify_that_it_possible_to_download_map_to_user_pc_cloud
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	When User clicks 'Download Map' item in 'file-manager' dropdown menu
	Then User checks that file 'auto_test_SRND' was downloaded

@MindManager @Published_Files @App_QA @App_Staging @App_Prod @Cleanup
Scenario: Сheck_other_actions_dropdown_App
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	Then following items is displayed in 'view-map-other-actions' dropdown menu
		| item             |
		| Advanced Options |
		| Download Map     |
		| Un-Publish       |

@MindManager @Published_Files @QA @Staging @Prod @Cleanup
Scenario: Сheck_other_actions_dropdown
	Given User uploads following publish files via Api
		| Name           | PublishFile             |
		| auto_test_SRND | Map_For_Automation.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User clicks down arrow in row with 'auto_test_SRND' file name of Published Files table
	Then following items is displayed in 'view-map-other-actions' dropdown menu
		| item             |
		| Advanced Options |
		| Download Map     |
		| Un-Publish       |

@MindManager @Published_Files @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-109] @Upd_Qase
Scenario: Check_that_it_is_possible_to_mark_the_map_as_favourite
	Given '2' User uploads following publish files via Api
		| Name                    | PublishFile             |
		| auto_test_SRND          | Map_For_Automation.mmap |
		| auto_test_favorite_SRND | Map_For_Automation.mmap |
	Given '2' User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	Then following files are displayed in Published Files table
		| File                    |
		| auto_test_SRND          |
		| auto_test_favorite_SRND |
	When User clicks 'Favorite' button icon in row with 'auto_test_favorite_SRND' file name of Published Files table
	When User clicks 'filter-options' button icon on maps toolbar
	Then 'file-manager-filter-options' dropdown menu is displayed to User
	When User clicks switch by label name 'Show Favorites only' in 'file-manager-filter-options' dropdown menu
	Then following files are displayed in Published Files table
		| File                    |
		| auto_test_favorite_SRND |

@MindManager @Published_Files @QA @Staging @Prod @Cleanup @Qase[WEB-109] @Upd_Qase
Scenario: Check_that_it_is_possible_to_mark_the_map_as_favourite_cloud
	Given '2' User uploads following publish files via Api
		| Name                    | PublishFile             |
		| auto_test_SRND          | Map_For_Automation.mmap |
		| auto_test_favorite_SRND | Map_For_Automation.mmap |
	Given '2' User is logged into MindManager web app via Api
	Then following files are displayed in Published Files table
		| File                    |
		| auto_test_SRND          |
		| auto_test_favorite_SRND |
	When User clicks 'Favorite' button icon in row with 'auto_test_favorite_SRND' file name of Published Files table
	When User clicks 'filter-options' button icon on maps toolbar
	Then 'file-manager-filter-options' dropdown menu is displayed to User
	When User clicks switch by label name 'Show Favorites only' in 'file-manager-filter-options' dropdown menu
	Then following files are displayed in Published Files table
		| File                    |
		| auto_test_favorite_SRND |

@MindManager @Published_Files @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-110] @Upd_Qase
Scenario: Check_that_the_user_can_search_the_maps_via_the_map_list
	Given '2' User uploads following publish files via Api
		| Name                  | PublishFile             |
		| auto_test_SRND        | Map_For_Automation.mmap |
		| 5328_RND              | Map_For_Automation.mmap |
		| AUTOMATION_test_SVRND | Map_For_Automation.mmap |
	Given '2' User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	When User enters 'auto_test_SRND' value in 'file-search' field of 'FileManagerHeaderBasePage' container
	When User waits for data loading
	Then following files are displayed in Published Files table
		| File           |
		| auto_test_SRND |
	When User enters '5328_RND' value in 'file-search' field of 'FileManagerHeaderBasePage' container
	When User waits for data loading
	Then 'Published Files' tab is active on file manager header page
	Then following files are displayed in Published Files table
		| File     |
		| 5328_RND |
	When User enters 'kl8dhy' value in 'file-search' field of 'FileManagerHeaderBasePage' container
	When User waits for data loading
	Then 'There are no matching files found.' message is displayed to User

@MindManager @Published_Files @QA @Staging @Prod @Cleanup @Qase[WEB-110] @Upd_Qase
Scenario: Check_that_the_user_can_search_the_maps_via_the_map_list_cloud
	Given '2' User uploads following publish files via Api
		| Name                  | PublishFile             |
		| auto_test_SRND        | Map_For_Automation.mmap |
		| 5328_RND              | Map_For_Automation.mmap |
		| AUTOMATION_test_SVRND | Map_For_Automation.mmap |
	Given '2' User is logged into MindManager web app via Api
	When User enters 'auto_test_SRND' value in 'file-search' field of 'FileManagerHeaderBasePage' container
	When User waits for data loading
	Then following files are displayed in Published Files table
		| File           |
		| auto_test_SRND |
	When User enters '5328_RND' value in 'file-search' field of 'FileManagerHeaderBasePage' container
	When User waits for data loading
	Then following files are displayed in Published Files table
		| File     |
		| 5328_RND |
	When User enters 'kl8dhy' value in 'file-search' field of 'FileManagerHeaderBasePage' container
	When User waits for data loading
	Then 'There are no matching files found.' message is displayed to User

@MindManager @Published_Files @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-111] @Upd_Qase
Scenario: Check_that_it_is_possible_to_filter_the_map_list
	Given '2' User uploads following publish files via Api
		| Name                      | PublishFile             |
		| auto_test_SRND            | Map_For_Automation.mmap |
		| auto_test_second_map_SRND | Map_For_Automation.mmap |
		| auto_test_third_map_SRND  | Map_For_Automation.mmap |
	Given '2' User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	Then file manager header page is displayed to User
	When User clicks 'Favorite' button icon in row with 'auto_test_second_map_SRND' file name of Published Files table
	When User clicks 'Favorite' button icon in row with 'auto_test_third_map_SRND' file name of Published Files table
	When User clicks 'filter-options' button icon on maps toolbar
	When User clicks switch by label name 'Show Favorites only' in 'file-manager-filter-options' dropdown menu
	Then following files are displayed in Published Files table
		| File                      |
		| auto_test_second_map_SRND |
		| auto_test_third_map_SRND  |

@MindManager @Published_Files @QA @Staging @Prod @Cleanup @Qase[WEB-111] @Upd_Qase
Scenario: Check_that_it_is_possible_to_filter_the_map_list_cloud
	Given '2' User uploads following publish files via Api
		| Name                      | PublishFile             |
		| auto_test_SRND            | Map_For_Automation.mmap |
		| auto_test_second_map_SRND | Map_For_Automation.mmap |
		| auto_test_third_map_SRND  | Map_For_Automation.mmap |
	Given '2' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Favorite' button icon in row with 'auto_test_second_map_SRND' file name of Published Files table
	When User clicks 'Favorite' button icon in row with 'auto_test_third_map_SRND' file name of Published Files table
	When User clicks 'filter-options' button icon on maps toolbar
	When User clicks switch by label name 'Show Favorites only' in 'file-manager-filter-options' dropdown menu
	Then following files are displayed in Published Files table
		| File                      |
		| auto_test_second_map_SRND |
		| auto_test_third_map_SRND  |

@MindManager @Published_Files @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-112] @Upd_Qase
Scenario: Check_that_it_is_possible_to_sort_the_maps_By_Title_and_By_Last_Modified
	Given '2' User uploads following publish files via Api
		| Name                      | PublishFile             |
		| auto_test_SRND            | Map_For_Automation.mmap |
		| auto_test_second_map_SRND | Map_For_Automation.mmap |
		| auto_test_third_map_SRND  | Map_For_Automation.mmap |
	Given '2' User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	Then file manager header page is displayed to User
	When User clicks 'sort' button icon on maps toolbar
	Then 'file-manager-sort-options' dropdown menu is displayed to User
	When User clicks 'By Last Modified' item in 'file-manager-sort-options' dropdown menu
	Then following files are displayed in Published Files table
		| File                      |
		| auto_test_third_map_SRND  |
		| auto_test_second_map_SRND |
		| auto_test_SRND            |
	When User clicks 'sort' button icon on maps toolbar
	Then 'file-manager-sort-options' dropdown menu is displayed to User
	When User clicks 'By Title' item in 'file-manager-sort-options' dropdown menu
	Then following files are displayed in Published Files table
		| File                      |
		| auto_test_SRND            |
		| auto_test_second_map_SRND |
		| auto_test_third_map_SRND  |

@MindManager @Published_Files @QA @Staging @Prod @Cleanup @Qase[WEB-112] @Upd_Qase
Scenario: Check_that_it_is_possible_to_sort_the_maps_By_Title_and_By_Last_Modified_cloud
	Given '2' User uploads following publish files via Api
		| Name                      | PublishFile             |
		| auto_test_SRND            | Map_For_Automation.mmap |
		| auto_test_second_map_SRND | Map_For_Automation.mmap |
		| auto_test_third_map_SRND  | Map_For_Automation.mmap |
	Given '2' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'sort' button icon on maps toolbar
	Then 'file-manager-sort-options' dropdown menu is displayed to User
	When User clicks 'By Last Modified' item in 'file-manager-sort-options' dropdown menu
	Then following files are displayed in Published Files table
		| File                      |
		| auto_test_third_map_SRND  |
		| auto_test_second_map_SRND |
		| auto_test_SRND            |
	When User clicks 'sort' button icon on maps toolbar
	Then 'file-manager-sort-options' dropdown menu is displayed to User
	When User clicks 'By Title' item in 'file-manager-sort-options' dropdown menu
	Then following files are displayed in Published Files table
		| File                      |
		| auto_test_SRND            |
		| auto_test_second_map_SRND |
		| auto_test_third_map_SRND  |

@MindManager @Published_Files @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-113] @Upd_Qase
Scenario: Verify_that_it_possible_to_mark_files_as_favourites_via_select_all_button
	Given '6' User uploads following publish files via Api
		| Name                      | PublishFile             |
		| auto_test_SRND            | Map_For_Automation.mmap |
		| auto_test_second_map_SRND | Map_For_Automation.mmap |
		| auto_test_third_map_SRND  | Map_For_Automation.mmap |
	Given '6' User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	Then file manager header page is displayed to User
	When User clicks Select All button
	Then All files are selected
	Then 'delete' button is enabled in the Published Files tab
	Then 'favourite' button is enabled in the Published Files tab
	When User clicks Select All button
	Then 'delete' button is disabled in the Published Files tab
	Then 'favourite' button is disabled in the Published Files tab
	When User checks checkbox in 'auto_test_SRND' row of Published Files table
	Then checkbox is checked in row 'auto_test_SRND' of Published Files table
	Then '1 Selected' is displayed in the Published Files tab
	Then 'delete' button is enabled in the Published Files tab
	Then 'favourite' button is enabled in the Published Files tab
	When User clicks 'Favorite' button icon in row with 'auto_test_SRND' file name of Published Files table
	Then 'Favorite' button icon in row with 'auto_test_SRND' file name of Published Files table is displayed as marked

@MindManager @Published_Files @QA @Staging @Prod @Cleanup @Qase[WEB-113] @Upd_Qase
Scenario: Verify_that_it_possible_to_mark_files_as_favourites_via_select_all_button_cloud
	Given '6' User uploads following publish files via Api
		| Name                      | PublishFile             |
		| auto_test_SRND            | Map_For_Automation.mmap |
		| auto_test_second_map_SRND | Map_For_Automation.mmap |
		| auto_test_third_map_SRND  | Map_For_Automation.mmap |
	Given '6' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks Select All button
	Then All files are selected
	Then 'delete' button is enabled in the Published Files tab
	Then 'favourite' button is enabled in the Published Files tab
	When User clicks published files delete button
	When User waits for data loading
	When User switches to iframe
	Then following files are displayed in the Unpublished file list
		| File                      |
		| auto_test_SRND            |
		| auto_test_second_map_SRND |
		| auto_test_third_map_SRND  |
	When User clicks 'Done' button
	Then File manager content is displayed to User
	Then no file is displayed on Published Files table

@MindManager @Published_Files @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-114] @Health_Check @Upd_Qase
Scenario: Verify_that_it_possible_to_delete_files_via_select_all_button
	Given '7' User uploads following publish files via Api
		| Name                      | PublishFile             |
		| auto_test_SRND            | Map_For_Automation.mmap |
		| auto_test_second_map_SRND | Map_For_Automation.mmap |
		| auto_test_third_map_SRND  | Map_For_Automation.mmap |
	Given '7' User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	Then file manager header page is displayed to User
	When User clicks Select All button
	Then All files are selected
	Then 'delete' button is enabled in the Published Files tab
	Then 'favourite' button is enabled in the Published Files tab
	When User clicks published files delete button
	When User waits for data loading
	When User waits '1000' miliseconds
	When User switches to iframe
	When User waits for data loading
	Then following files are displayed in the Unpublished file list
		| File                      |
		| auto_test_SRND            |
		| auto_test_second_map_SRND |
		| auto_test_third_map_SRND  |
	When User clicks 'Done' button
	Then File manager content is displayed to User
	Then no file is displayed on Published Files table

@MindManager @Published_Files @QA @Staging @Prod @Cleanup @Qase[WEB-114] @Upd_Qase
Scenario: Verify_that_it_possible_to_delete_files_via_select_all_button_cloud
	Given '6' User uploads following publish files via Api
		| Name                      | PublishFile             |
		| auto_test_SRND            | Map_For_Automation.mmap |
		| auto_test_second_map_SRND | Map_For_Automation.mmap |
		| auto_test_third_map_SRND  | Map_For_Automation.mmap |
	Given '6' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks Select All button
	Then All files are selected
	Then 'delete' button is enabled in the Published Files tab
	Then 'favourite' button is enabled in the Published Files tab
	When User clicks published files delete button
	When User waits for data loading
	When User switches to iframe
	Then following files are displayed in the Unpublished file list
		| File                      |
		| auto_test_SRND            |
		| auto_test_second_map_SRND |
		| auto_test_third_map_SRND  |
	When User clicks 'Done' button
	Then File manager content is displayed to User
	Then no file is displayed on Published Files table