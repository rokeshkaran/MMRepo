@retry(2)
Feature: BackgroundTransparency
Check functionality background transparency on side menu

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar

@MindManager @Side_Toolbox @Background @BackgroundTransparency @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-857] @Upd_Qase
Scenario: Verify_that_User_can_change_background_transparency
	When User clicks 'Design' button of side Toolbox
	Then 'Background' section is displayed on 'PanelByName' side panel with 'Design' header
	When User uploads 'FruitsOutlineIcon.png' file through 'background-image-file-input' input
	Then background preview Image is displayed
	Then image is displayed on the Canvas background
	Then 'Transparency:' subsection is displayed in the 'Background' section with 'Design' header
	Then 'Tile Options:' subsection is displayed in the 'Background' section with 'Design' header
	When User enters '25' value to 'Transparency' field in 'Background' section of 'PanelByName' side panel with 'Design' header via slider
	When User clicks by coordinates '50' and '50' on Canvas
	Then background image transparency is '0.75'
	When User enters '50' value to 'Transparency' field in 'Background' section of 'PanelByName' side panel with 'Design' header
	When User clicks by coordinates '50' and '50' on Canvas
	Then background image transparency is '0.5'