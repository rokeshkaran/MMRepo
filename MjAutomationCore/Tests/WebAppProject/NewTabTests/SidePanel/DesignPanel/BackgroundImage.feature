@retry(2)
Feature: BackgroundImage
Check functionality background image on side menu

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar

@MindManager @Side_Toolbox @Background @BackgroundImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-854] @Upd_Qase
Scenario: Check_that_user_can_add_image_to_background
	When User clicks 'Design' button of side Toolbox
	Then 'Background' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Image:' subsection is displayed in the 'Background' section with 'Design' header
	When User uploads 'FruitsOutlineIcon.png' file through 'background-image-file-input' input
	Then background preview Image is displayed
	Then image is displayed on the Canvas background

@MindManager @Side_Toolbox @Background @BackgroundImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-855] @Upd_Qase
Scenario: Check_that_user_can_not_add_image_over_10mb
	When User clicks 'Design' button of side Toolbox
	Then 'Background' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Image:' subsection is displayed in the 'Background' section with 'Design' header
	When User uploads '10mbImage.jpg' file through 'background-image-file-input' input
	Then background preview Image is not displayed
	Then image is not displayed on the Canvas background
	Then 'File size is too large, the max file upload size is 10MB' error message is displayed in 'upload-background-fs' dialog

@MindManager @Side_Toolbox @Background @BackgroundImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-856] @Upd_Qase
Scenario: Check_that_user_can_remove_background_image
	When User clicks 'Design' button of side Toolbox
	Then 'Background' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Image:' subsection is displayed in the 'Background' section with 'Design' header
	When User uploads 'FruitsOutlineIcon.png' file through 'background-image-file-input' input
	Then background preview Image is displayed
	Then image is displayed on the Canvas background
	When User remove the background image
	Then background preview Image is not displayed
	Then image is not displayed on the Canvas background