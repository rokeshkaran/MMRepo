@retry(2)
Feature: SearchFiles

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to OneDrive cloud
	Then 'OneDrive' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	When User clicks 'Files' folder
	When User clicks 'For QA automation' folder
	When User clicks 'Search' folder

@MindManager @Cloud_Services @OneDrive @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-66] @Upd_Qase @JIRA[MMCV-10374]
Scenario:To_verify_that_the_mmap_files_can_be_searched_with_dot_in_name_from_the_browser_app _on_OneDrive
	When User enters 'search.check' value in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	Then value 'search.check' is displayed in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	When User waits for data loading
	Then following files are displayed on page to the User:
		| files        |
		| search.check |

@MindManager @Cloud_Services @OneDrive @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-66] @Upd_Qase @JIRA[MMCV-10374]
Scenario: To_verify_that_the_mmap_files_can_be_searched_with_underscore_in_name_from_the_browser_app_on_OneDrive
	When User enters '6789_9414' value in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	Then value '6789_9414' is displayed in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	When User waits for data loading
	Then following files are displayed on page to the User:
		| files     |
		| 6789_9414 |

@MindManager @Cloud_Services @OneDrive @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-66] @Upd_Qase
Scenario: To_verify_that_the_mmap_files_can_be_searched_if_map_is_not_exist_from_the_browser_app_on_OneDrive
	When User enters 'dcdsjsd' value in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	Then value 'dcdsjsd' is displayed in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	When User waits for data loading
	Then message 'No content found.' is displayed on page