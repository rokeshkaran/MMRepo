@retry(2)
Feature: StandardImages
Check functionality of standard image

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath      |
		| auto_test_SRND.mmap | ImageMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And User set zoom level to '32' via the side tool bar

@MindManager @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-426] @Upd_Qase
Scenario: Check_that_user_can_select_image_in_topic
	When User hovers on image in 'ImageTopic1' topic on Canvas
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '0.5' opacity in 'ImageTopic1' topic on Canvas
	When User clicks on image in 'ImageTopic1' topic
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic1' topic on Canvas

@MindManager @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-427] @Upd_Qase @JIRA[MMCV-8462]
Scenario: Check_that_user_can_select_multiple_image
	When User clicks on image in 'ImageTopic1' topic
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic1' topic on Canvas
	When User presses Left_CTRL key on keyboard
	And User clicks on image in 'ImageTopic3' topic
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic3' topic on Canvas
	And image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic1' topic on Canvas
	And Topic Border is highlight blue color in 'ImageTopic1' topic on Canvas
	And Topic Border is highlight blue color in 'ImageTopic3' topic on Canvas