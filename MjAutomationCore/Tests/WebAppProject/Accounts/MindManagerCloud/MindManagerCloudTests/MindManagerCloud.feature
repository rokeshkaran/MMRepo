@retry(2)
Feature: MindManagerCloud
Check the MM account UI

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Qase[WEB-1917] @Health_Check @Cleanup @Upd_Qase
Scenario: Verify_the_UI_of_MindManager_account
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User waits for data loading
	When User clicks 'MindManager Files' content item
	When User waits for data loading
	Then 'For QA Automation' item with 'Folder' description is displayed on content manager page
	Then 'service-search-input' input filed is displayed in 'ContentManagerNavigationPanelElement' container
	Then 'button btn-back' button is displayed on navigation panel
	Then 'button btn-new-folder' button is displayed on navigation panel
	Then 'filter-owner' filter is displayed on navigation panel
	Then 'filter-date-name' filter is displayed on navigation panel