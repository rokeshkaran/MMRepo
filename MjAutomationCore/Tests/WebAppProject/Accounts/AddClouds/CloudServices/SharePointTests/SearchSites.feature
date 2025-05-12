@retry(2)
Feature: SearchSites
	Check Shrepoint sites search

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud with all sites
	Then 'service-search-input' input filed is displayed in 'ContentManagerNavigationPanelElement' container

@MindManager @Cloud_Services @SharePoint @SitesSearch @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2228] @Upd_Qase
Scenario: To_verify_that_the_sites_can_be_found_at_the_beginning_of_the_site_name_on_SharePoint
	When User enters 'la' value in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	Then value 'la' is displayed in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	When User waits for data loading
	Then following sites are displayed on page to the User:
		| sites        |
		| Lavender Row |
	Then following sites are not displayed on page to the User:
		| sites                 |
		| Auburn Route          |
		| Attachment Test       |
		| Mill                  |
		| Beachside Boulevard84 |
		| Germany               |

@MindManager @Cloud_Services @SharePoint @SitesSearch @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2229] @Upd_Qase
Scenario: To_verify_that_the_sites_can_be_found_at_the_middle_of_the_site_name_on_SharePoint
	When User enters 'ro' value in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	Then value 'ro' is displayed in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	When User waits for data loading
	Then following sites are displayed on page to the User:
		| sites        |
		| Lavender Row |
		| Auburn Route |
	Then following sites are not displayed on page to the User:
		| sites                 |
		| App Catalog           |
		| Attachment Test       |
		| Beachside Boulevard84 |
		| Enterprise site       |
		| Germany               |
		| Milan                 |
		| Sub_Milan             |

@MindManager @Cloud_Services @SharePoint @SitesSearch @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2229] @Upd_Qase
Scenario: To_verify_that_the_sites_can_be_found_at_the_middle_of_the_site_name_with_additional_characters_on_SharePoint
	When User enters 'ro' value in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	Then value 'ro' is displayed in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	When User waits for data loading
	Then following sites are displayed on page to the User:
		| sites        |
		| Lavender Row |
		| Auburn Route |
	Then following sites are not displayed on page to the User:
		| sites                 |
		| App Catalog           |
		| Attachment Test       |
		| Beachside Boulevard84 |
		| Enterprise site       |
		| Germany               |
		| Milan                 |
		| Sub_Milan             |
		| #Walnut&%             |
	When User presses the 'u' key on the keyboard
	Then value 'rou' is displayed in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	When User waits for data loading
	Then following sites are displayed on page to the User:
		| sites        |
		| Auburn Route |
	Then following sites are not displayed on page to the User:
		| sites                 |
		| Lavender Row          |
		| App Catalog           |
		| Attachment Test       |
		| Demo Team             |
		| Enterprise site       |
		| Germany               |
		| Milan                 |
		| Beachside Boulevard84 |
		| #Walnut&%             |

@MindManager @Cloud_Services @SharePoint @SitesSearch @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2230] @Upd_Qase
Scenario: To_verify_that_the_sites_can_be_found_at_whole_site_name_on_SharePoint
	When User enters 'Mill' value in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	Then value 'Mill' is displayed in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	When User waits for data loading
	Then following sites are displayed on page to the User:
		| sites |
		| Mill  |
	Then following sites are not displayed on page to the User:
		| sites           |
		| App Catalog     |
		| Attachment Test |
		| Demo Team       |
		| Milan           |
		| Sub_Milan       |
		| Auburn Route    |

@MindManager @Cloud_Services @SharePoint @SitesSearch @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2231] @Upd_Qase
Scenario: To_verify_that_the_sites_can_be_found_on_SharePoint_when_search_query_contains_only_numbers
	When User enters '84' value in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	Then value '84' is displayed in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	When User waits for data loading
	Then following sites are displayed on page to the User:
		| sites                 |
		| Beachside Boulevard84 |
	Then following sites are not displayed on page to the User:
		| sites           |
		| App Catalog     |
		| Attachment Test |
		| Demo Team       |
		| Mill            |
		| Milan           |
		| Sub_Milan       |
		| Auburn Route    |
		| #Walnut&%       |

@MindManager @Cloud_Services @SharePoint @SitesSearch @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2232] @Upd_Qase
Scenario: To_verify_that_the_sites_can_be_found_on_SharePoint_when_search_query_contains_special_symbols
	When User enters '#Walnut&%' value in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	Then value '#Walnut&%' is displayed in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	When User waits for data loading
	Then following sites are displayed on page to the User:
		| sites     |
		| #Walnut&% |
	Then following sites are not displayed on page to the User:
		| sites                 |
		| App Catalog           |
		| Attachment Test       |
		| Beachside Boulevard84 |
		| Mill                  |
		| Milan                 |
		| Sub_Milan             |
		| UniversityТест        |
		| Auburn Route          |

@MindManager @Cloud_Services @SharePoint @SitesSearch @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2233] @Upd_Qase
Scenario: To_verify_that_the_sites_can_be_found_on_SharePoint_when_search_query_contains_non_latin_letters
	When User enters 'Тест' value in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	Then value 'Тест' is displayed in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	When User waits for data loading
	Then following sites are displayed on page to the User:
		| sites          |
		| UniversityТест |
	Then following sites are not displayed on page to the User:
		| sites                 |
		| App Catalog           |
		| Attachment Test       |
		| Beachside Boulevard84 |
		| Mill                  |
		| Milan                 |
		| Sub_Milan             |
		| Auburn Route          |
		| #Walnut&%             |

@MindManager @Cloud_Services @SharePoint @SitesSearch @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2255] @Upd_Qase
Scenario: To_verify_that_the_emptying_the_search_will_reset_search_results_by_removed_search_query
	When User enters 'Lavender Row' value in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	Then value 'Lavender Row' is displayed in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	When User waits for data loading
	Then following sites are displayed on page to the User:
		| sites        |
		| Lavender Row |
	Then following sites are not displayed on page to the User:
		| sites                 |
		| App Catalog           |
		| Attachment Test       |
		| Beachside Boulevard84 |
		| Milan                 |
		| Mill                  |
		| Sub_Milan             |
		| Auburn Route          |
	When User presses the Ctrl_A combination key on the keyboard
	When User presses the 'Backspase' key on the keyboard
	When User waits for data loading
	Then following sites are displayed on page to the User:
		| sites                 |
		| Lavender Row          |
		| App Catalog           |
		| Attachment Test       |
		| Beachside Boulevard84 |
		| Milan                 |
		| Mill                  |
		| Sub_Milan             |
		| Auburn Route          |
		| #Walnut&%             |

@MindManager @Cloud_Services @SharePoint @SitesSearch @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2256] @Upd_Qase
Scenario: To_verify_that_the_emptying_the_search_will_reset_search_results_by_clicking_X_button
	When User enters 'Lavender Row' value in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	Then value 'Lavender Row' is displayed in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	When User waits for data loading
	Then following sites are displayed on page to the User:
		| sites        |
		| Lavender Row |
	Then following sites are not displayed on page to the User:
		| sites                 |
		| App Catalog           |
		| Attachment Test       |
		| Beachside Boulevard84 |
		| Milan                 |
		| Mill                  |
		| Sub_Milan             |
		| Auburn Route          |
		| UniversityТест        |
	When User clicks Clear button in search field on navigation panel
	When User waits for data loading
	Then following sites are displayed on page to the User:
		| sites                 |
		| Lavender Row          |
		| App Catalog           |
		| Attachment Test       |
		| Beachside Boulevard84 |
		| Milan                 |
		| Mill                  |
		| Sub_Milan             |
		| Auburn Route          |
		| UniversityТест        |
		| #Walnut&%             |

@MindManager @Cloud_Services @SharePoint @SitesSearch @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2385] @Upd_Qase
Scenario: To_verify_that_the_info_message_is_displayed_when_site_is_not_found
	When User enters 'Site_Name_SRND' value in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	Then value 'Site_Name_SRND' is displayed in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	When User waits for data loading
	Then message 'No content found.' is displayed on page
	Then following sites are not displayed on page to the User:
		| sites                 |
		| Lavender Row          |
		| App Catalog           |
		| Attachment Test       |
		| Beachside Boulevard84 |
		| Milan                 |
		| Mill                  |
		| Sub_Milan             |
		| Auburn Route          |
		| UniversityТест        |