@retry(2)
Feature: FormatPainter
Check Format painter functionality via Toolbar

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @Toolbar @Shapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1193] @Upd_Qase
Scenario: Check_that_Format_Painter_cannot_be_applied_to_more_than_one_topic
	When User clicks 'CT' topic on Canvas
	Then 'Format painter' button is displayed as enabled on the Tools panel
	When User clicks 'MTCO' topic on Canvas
	Then 'Format painter' button is displayed as enabled on the Tools panel
	When User clicks 'FT' topic on Canvas
	Then 'Format painter' button is displayed as enabled on the Tools panel
	When User presses Left_CTRL key on keyboard
	When User clicks 'CT' topic on Canvas
	Then 'Format painter' button is displayed as disabled on the Tools panel

@MindManager @Toolbar @Shapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1193] @Upd_Qase
Scenario: Copy_topic_style
	When User clicks 'Format' topic on Canvas
	When User clicks 'Format painter' button on Tools panel
	Then 'format painter' icon is displayed beside cursor
	When User clicks 'FT' topic on Canvas
	Then 'format painter' icon is not displayed beside cursor
	Then 'FT' topic text is displayed  '"Segoe UI Variable Display Semib", "Source Sans Pro"' in font
	Then 'FT' topic text has '32' size
	Then 'FT' topic text is displayed 'bold underline line-through' style
	Then 'FT' topic text has 'rgba(106, 110, 235, 1)' color on Canvas
	Then 'FT' topic is assigned 'diamond' shape on Canvas

@MindManager @Toolbar @Shapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1194] @Upd_Qase
Scenario: Check_Copy_style_to_multiple_topics
	When User clicks 'Format' topic on Canvas
	When User clicks 'Format painter' button on Tools panel
	Then 'format painter' icon is displayed beside cursor
	When User clicks 'MTSTCO' topic on Canvas
	Then 'MTSTCO' topic text is displayed  '"Segoe UI Variable Display Semib", "Source Sans Pro"' in font
	Then 'MTSTCO' topic text has '32' size
	Then 'MTSTCO' topic text is displayed 'bold underline line-through' style
	Then 'MTSTCO' topic text has 'rgba(106, 110, 235, 1)' color on Canvas
	Then 'MTSTCO' topic is assigned 'diamond' shape on Canvas
	Then 'format painter' icon is not displayed beside cursor
	When User clicks 'Format' topic on Canvas
	When User clicks 'Format painter' button on Tools panel
	Then 'format painter' icon is displayed beside cursor
	When User presses Left_CTRL key on keyboard
	When User clicks 'FT' topic on Canvas
	Then 'FT' topic text is displayed  '"Segoe UI Variable Display Semib", "Source Sans Pro"' in font
	Then 'FT' topic text has '32' size
	Then 'FT' topic text is displayed 'bold underline line-through' style
	Then 'FT' topic text has 'rgba(106, 110, 235, 1)' color on Canvas
	Then 'FT' topic is assigned 'diamond' shape on Canvas
	Then 'format painter' icon is displayed beside cursor
	When User releases Left_CTRL key on keyboard
	When User clicks 'MTCO' topic on Canvas
	Then 'MTCO' topic text is displayed  '"Segoe UI Variable Display Semib", "Source Sans Pro"' in font
	Then 'MTCO' topic text has '32' size
	Then 'MTCO' topic text is displayed 'bold underline line-through' style
	Then 'MTCO' topic text has 'rgba(106, 110, 235, 1)' color on Canvas
	Then 'MTCO' topic is assigned 'diamond' shape on Canvas
	Then 'format painter' icon is not displayed beside cursor