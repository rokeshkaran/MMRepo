@retry(2)
Feature: ChangesToAllImages
Check Modification functionality of thumbnail image via Side Panel

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath      |
		| auto_test_SRND.mmap | ImageMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar

@MindManager @Side_Toolbox @ThumbnailImage @ChangesToAllImages @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-899] @Upd_Qase
Scenario: Check_that_it_is_possible_to_size_the_image_size
	When User clicks on image in 'MTCO' topic
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	When User checks 'Apply changes to all images' radio button in 'PanelByName' side panel with 'Image' header
	Then 'Apply changes to all images' radio button is checked in 'PanelByName' side panel with 'Image' header
	When User enters '-10' value to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	When User presses the 'Enter' key on the keyboard
	Then '10.0 mm' value is displayed to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	Then image in 'MTCO' topic has approximate '57' width and approximate '37' height
	When User enters '0' value to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	When User presses the 'Enter' key on the keyboard
	Then '5.0 mm' value is displayed to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	Then image in 'MTCO' topic has approximate '28' width and approximate '18' height
	When User enters '10' value to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	When User presses the 'Enter' key on the keyboard
	Then image in 'MTCO' topic has approximate '57' width and approximate '37' height

@MindManager @Side_Toolbox @ThumbnailImage @ChangesToAllImages @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-900] @Upd_Qase @JIRA[MMCV-8933]
Scenario: Check_that_it_is_possible_to_viewer_max_size_the_image
	When User clicks on image in 'MTCO' topic
	Then 'MTCO' is outlined with a blue circuit
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	When User checks 'Apply changes to all images' radio button in 'PanelByName' side panel with 'Image' header
	Then 'Apply changes to all images' radio button is checked in 'PanelByName' side panel with 'Image' header
	When User enters '-50' value to 'Viewer Max Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	When User releases all keys on keyboard
	Then '50.0 mm' value is displayed to 'Viewer Max Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	When User enters '0' value to 'Viewer Max Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	When User releases all keys on keyboard
	Then '5.0 mm' value is displayed to 'Viewer Max Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	When User enters '300' value to 'Viewer Max Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	When User releases all keys on keyboard
	Then '300.0 mm' value is displayed to 'Viewer Max Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header

@MindManager @Side_Toolbox @ThumbnailImage @ChangesToAllImages @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-901] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_image_type
	When User clicks on image in 'MTCO' topic
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MTCO' topic on Canvas
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	Then 'Thumbnail Image' radio button is checked in 'Type' section of 'PanelByName' side panel with 'Image' header
	When User checks 'Apply changes to all images' radio button in 'PanelByName' side panel with 'Image' header
	Then 'Apply changes to all images' radio button is checked in 'PanelByName' side panel with 'Image' header
	When User checks 'Standard Image' radio button in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then 'Standard Image' radio button is checked in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then image in 'MTCO' topic is in 'Standard' type
	Then image in 'MTCO' topic has approximate '2496' width and approximate '1650' height
	When User selects images from first 'MTCO' and second 'MTSTCO' topic on Canvas
	Then 'MTCO' is outlined with a blue circuit
	Then 'MTSTCO' is outlined with a blue circuit
	When User checks 'Thumbnail Image' radio button in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then image in 'MTCO' topic is in 'Thumbnail' type
	Then image in 'MTSTCO' topic is in 'Thumbnail' type
	Then image in 'ImageTopic1' topic is in 'Thumbnail' type

@MindManager @Side_Toolbox @ThumbnailImage @ChangesToAllImages @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-902] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_image_location_via_the_side_panel
	When User clicks on image in 'MTCO' topic
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MTCO' topic on Canvas
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	When User checks 'Apply changes to all images' radio button in 'PanelByName' side panel with 'Image' header
	Then 'Apply changes to all images' radio button is checked in 'PanelByName' side panel with 'Image' header
	Then 'Location' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Left' value is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	When User remembers location of image in 'MTCO' topic
	When User remembers location of text in 'MTCO' topic
	When User clicks dropdown arrow in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then dropdown menu is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	When User selects 'Right' in dropdown menu
	Then 'Right' value is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then image in 'MTCO' topic has changed location by X axis on Canvas
	Then text in 'MTCO' topic has changed location by X axis on Canvas
	When User remembers location of image in 'MTCO' topic
	When User remembers location of text in 'MTCO' topic
	When User clicks dropdown arrow in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then dropdown menu is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	When User selects 'Top' in dropdown menu
	Then 'Top' value is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then image in 'MTCO' topic has changed location by Y axis on Canvas
	Then text in 'MTCO' topic has changed location by Y axis on Canvas
	When User remembers location of image in 'MTCO' topic
	When User remembers location of text in 'MTCO' topic
	When User clicks dropdown arrow in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then dropdown menu is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	When User selects 'Bottom' in dropdown menu
	Then 'Bottom' value is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then image in 'MTCO' topic has changed location by Y axis on Canvas
	Then text in 'MTCO' topic has changed location by Y axis on Canvas
	When User remembers location of image in 'MTCO' topic
	When User remembers location of text in 'MTCO' topic
	When User clicks dropdown arrow in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then dropdown menu is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	When User selects 'Left' in dropdown menu
	Then 'Left' value is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then image in 'MTCO' topic has changed location by X axis on Canvas
	Then text in 'MTCO' topic has changed location by X axis on Canvas
	When User clicks 'ImageTopic2' topic on Canvas
	Then 'ImageTopic2' is outlined with a blue circuit
	When User adds 'FruitsOutlineIcon.png' image via 'PanelByName' side panel with 'Image' header
	Then image is displayed in 'ImageTopic2' topiс on Canvas
	Then 'ImageTopic2' is outlined with a blue circuit
	Then 'Left' value is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header