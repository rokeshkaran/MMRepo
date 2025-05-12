@retry(2)
Feature: SearchMultipleStorageProviders
	Check Multiple storage providers search

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page

@MindManager @SearchMultipleStorageProviders @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2556] @Upd_Qase
#Steps for Uploads maps directly to OneDrive should should be added after implementation instead of pre-prepared maps on the cloud
Scenario: To_verify_that_the_maps_can_be_found_on_Onedrive
	When User '2' login to OneDrive cloud
	When User clicks Back button on content navigation panel
	When User enters 'Autotestmap' value in 'file-search' field of 'FileManagerHeaderBasePage' container
	When User waits for data loading
	When User clicks 'OneDrive' tab on content page
	When User waits for data loading
	Then 'OneDrive' tab is active on content page
	Then following files are displayed on page to the User:
		| files       |
		| Autotestmap |
	Then the files are sorted by most recent
	Then The found files are located in the following clouds:
		| clouds   |
		| OneDrive |

@MindManager @SearchMultipleStorageProviders @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2557] @Upd_Qase
Scenario: To_verify_that_the_maps_can_be_found_on_SharePoint
	When User login to SharePoint cloud
	When User clicks Back button on content navigation panel
	When User enters 'TestSearch' value in 'file-search' field of 'FileManagerHeaderBasePage' container
	When User clicks 'Sharepoint' tab on content page
	Then 'Sharepoint' tab is active on content page
	When User waits for data loading
	Then following files are displayed on page to the User:
		| files       |
		| TestSearch1 |
		| TestSearch2 |
		| TestSearch3 |
	Then the files are sorted by most recent

@MindManager @SearchMultipleStorageProviders @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2569] @Upd_Qase
Scenario: To_verify_that_the_maps_can_be_found_on_MindManagerFiles
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName              | ItemPath       |
		| a_auto_test_SRND.mmap | SimpleMap.mmap |
		| f_auto_test_SRND.mmap | SimpleMap.mmap |
		| k_auto_test_SRND.mmap | SimpleMap.mmap |
		| z_auto_test_SRND.mmap | SimpleMap.mmap |
		| n_auto_test_SRND.mmap | SimpleMap.mmap |
	Then content page is displayed to User
	When User enters 'auto_test_SRND' value in 'file-search' field of 'FileManagerHeaderBasePage' container
	When User waits for data loading
	When User clicks 'MindManager Files' tab on content page
	When User waits for data loading
	Then 'MindManager Files' tab is active on content page
	Then Search result count '5' is displayed on content page
	Then following files are displayed on page to the User:
		| files            |
		| a_auto_test_SRND |
		| f_auto_test_SRND |
		| k_auto_test_SRND |
		| z_auto_test_SRND |
		| n_auto_test_SRND |
	Then the files are sorted by most recent
	Then The found files are located in the following clouds:
		| clouds            |
		| MindManager Files |

@MindManager @SearchMultipleStorageProviders @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2556,WEB-2557,WEB-2558] @Upd_Qase
Scenario: To_verify_that_the_search_field_is_highlighted_when_cursor_is_inserted
	When User clicks on 'file-search' field of 'FileManagerHeaderBasePage' container
	Then 'file-search' input field is highlighted in 'rgb(44, 41, 254)' color in 'FileManagerHeaderBasePage' container

@MindManager @SearchMultipleStorageProviders @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2562] @Upd_Qase
Scenario: To_verify_global_search_if_searched_part_contains_letters_only
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName              | ItemPath       |
		| regularlyCloudMM.mmap | SimpleMap.mmap |
	When User '2' login to OneDrive cloud
	When User clicks Back button on content navigation panel
	When User login to SharePoint cloud
	When User clicks Back button on content navigation panel
	When User enters 'regularlyCloud' value in 'file-search' field of 'FileManagerHeaderBasePage' container
	When User waits until search result loading icon is not displayed on content page
	Then following files are displayed on page to the User:
		| files                    |
		| regularlyCloudSharePoint |
		| regularlyCloudMM         |
		| regularlyCloudOneDrive   |
	Then The found files are located in the following clouds:
		| clouds            |
		| OneDrive          |
		| MindManager Files |
		| SharePoint        |

@MindManager @SearchMultipleStorageProviders @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2563,WEB-2561] @Upd_Qase
Scenario: To_verify_global_search_if_searched_part_contains_digits_only
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName                 | ItemPath       |
		| auto_test_6789_SRND.mmap | SimpleMap.mmap |
	When User '2' login to OneDrive cloud
	When User clicks Back button on content navigation panel
	When User login to SharePoint cloud
	When User clicks Back button on content navigation panel
	When User enters '6789' value in 'file-search' field of 'FileManagerHeaderBasePage' container
	When User waits until search result loading icon is not displayed on content page
	Then following files are displayed on page to the User:
		| files               |
		| auto_test_6789_SRND |
		| 6789_9414           |
		| b_auto_test_6789    |
		| c_auto_test_6789    |
	Then The found files are located in the following clouds:
		| clouds            |
		| OneDrive          |
		| MindManager Files |
		| SharePoint        |

@MindManager @SearchMultipleStorageProviders @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2564] @Upd_Qase
Scenario: To_verify_global_search_if_searched_part_contains_special_symbols
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName                         | ItemPath       |
		| spe$i@l `sy^^bo$CloudMMSRND.mmap | SimpleMap.mmap |
	When User '2' login to OneDrive cloud
	When User clicks Back button on content navigation panel
	When User login to SharePoint cloud
	When User clicks Back button on content navigation panel
	When User enters 'spe$i@l `sy^^bo' value in 'file-search' field of 'FileManagerHeaderBasePage' container
	When User waits until search result loading icon is not displayed on content page
	Then following files are displayed on page to the User:
		| files                               |
		| spe$i@l `sy^^bo$CloudSharePoint |
		| spe$i@l `sy^^bo$CloudMMSRND         |
		| spe$i@l `sy^^bo$CloudOneDrive       |
	Then The found files are located in the following clouds:
		| clouds            |
		| OneDrive          |
		| MindManager Files |
		| SharePoint        |

@MindManager @SearchMultipleStorageProviders @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2565] @Upd_Qase
Scenario: To_verify_global_search_if_searched_part_contains_non_latin_letters
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName                   | ItemPath       |
		| ПоискКартаCloudMMSRND.mmap | SimpleMap.mmap |
	When User '2' login to OneDrive cloud
	When User clicks Back button on content navigation panel
	When User login to SharePoint cloud
	When User clicks Back button on content navigation panel
	When User enters 'ПоискКарта' value in 'file-search' field of 'FileManagerHeaderBasePage' container
	When User waits until search result loading icon is not displayed on content page
	Then following files are displayed on page to the User:
		| files                         |
		| ПоискКартаCloudSharePoint |
		| ПоискКартаCloudMMSRND         |
		| ПоискКартаCloudOneDrive       |
	Then The found files are located in the following clouds:
		| clouds            |
		| OneDrive          |
		| MindManager Files |
		| SharePoint        |

@MindManager @SearchMultipleStorageProviders @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2566] @Upd_Qase
Scenario: To_verify_that_emptying_the_search_will_reset_search_results
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User enters 'Testmap' value in 'file-search' field of 'FileManagerHeaderBasePage' container
	When User waits until search result loading icon is not displayed on content page
	When User presses the Ctrl_A combination key on the keyboard
	When User presses the 'Backspace' key on the keyboard
	Then content page is displayed to User
	Then Recent Files Banner is displayed on Content Manager Page
	Then on the page exist 'Add Place' content item with 'Tap to Select Storage Provider' description

@MindManager @SearchMultipleStorageProviders @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2568] @JIRA[MMCV-10358] @Upd_Qase
Scenario: To_verify_that_empty_search_result_is_displayed_correctly
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User enters 'SRND' value in 'file-search' field of 'FileManagerHeaderBasePage' container
	When User waits until search result loading icon is not displayed on content page
	Then Search result count 'No content found.' is displayed on content page
	Then No search result icon is displayed in color on content page
		| color   |
		| #DBDDE3 |
		| #B2D6F2 |
		| white   |
	Then No search result title 'No matching results found' is displayed on content page
	Then No search result message 'please try another search.' is displayed on content page