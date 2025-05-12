@retry(2)
Feature: BackgroundImageViaSidePanel
Check functionality background image on side menu

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath      |
		| auto_test_SRND.mmap | ImageMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '50' via the side tool bar

@MindManager @Side_Toolbox @Background @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-845] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_change_the_image_size
	When User remembers 'ImageTopic3' topic model id and name
	When User clicks on image in 'ImageTopic3' topic
	Then 'ImageTopic3' topic is highlighted with 'rgb(62, 158, 255)' color in '1' opacity on Canvas
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic3' topic on Canvas
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	Then 'Size' section is displayed on 'PanelByName' side panel with 'Image' header
	When User enters '-10' value to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	When User presses the 'Enter' key on the keyboard
	Then '10.0 mm' value is displayed to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	Then image in 'ImageTopic3' topic has approximate '38' width and approximate '26' height
	When User enters '0' value to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	When User presses the 'Enter' key on the keyboard
	Then '5.0 mm' value is displayed to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	Then image in 'ImageTopic3' topic has approximate '18' width and approximate '13' height
	When User enters '50' value to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	When User presses the 'Enter' key on the keyboard
	Then '50.0 mm' value is displayed to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	Then image in 'ImageTopic3' topic has approximate '188' width and approximate '132' height
	When User enters '3' value to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	When User presses the 'Enter' key on the keyboard
	Then '5.0 mm' value is displayed to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	Then image in 'ImageTopic3' topic has approximate '18' width and approximate '13' height

@MindManager @Side_Toolbox @Background @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-846] @Upd_Qase
Scenario: Verify_that_viewer_max_size_option_is_disabled_for_standard_images
	When User remembers 'ImageTopic3' topic model id and name
	When User clicks on image in 'ImageTopic3' topic
	Then 'ImageTopic3' topic is highlighted with 'rgb(62, 158, 255)' color in '1' opacity on Canvas
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic3' topic on Canvas
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	Then 'Size' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Standard Image' radio button is checked in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then '5.0 mm' value is displayed to 'Viewer Max Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	Then 'Viewer Max Size:' input field is disabled in 'Size' section of 'PanelByName' side panel with 'Image' header

@MindManager @Side_Toolbox @Background @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-847] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_change_the_image_type
	When User remembers 'ImageTopic3' topic model id and name
	When User remembers 'ImageTopic1' topic model id and name
	When User selects images from first 'ImageTopic3' and second 'ImageTopic1' topic on Canvas
	Then 'ImageTopic3' topic is highlighted with 'rgb(62, 158, 255)' color in '0.5' opacity on Canvas
	Then 'ImageTopic1' topic is highlighted with 'rgb(62, 158, 255)' color in '1' opacity on Canvas
	Then image is highlighted in 'rgb(62, 158, 255)' color with '0.5' opacity in 'ImageTopic3' topic on Canvas
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	Then 'Viewer Max Size:' input field is disabled in 'Size' section of 'PanelByName' side panel with 'Image' header
	Then 'Type' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Standard Image' radio button is checked in 'Type' section of 'PanelByName' side panel with 'Image' header
	When User checks 'Thumbnail Image' radio button in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then 'Thumbnail Image' radio button is checked in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then image in 'ImageTopic3' topic is in 'Thumbnail' type
	Then image in 'ImageTopic1' topic is in 'Thumbnail' type
	Then '20.0 mm' value is displayed to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	Then '300.0 mm' value is displayed to 'Viewer Max Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	When User checks 'Standard Image' radio button in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then 'Standard Image' radio button is checked in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then image in 'ImageTopic3' topic is in 'Standard' type
	Then image in 'ImageTopic1' topic is in 'Standard' type

@MindManager @Side_Toolbox @Background @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-847] @JIRA[MMCV-8462] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_select_multiple_topic_images
	# Once MMCV-8462 is fixed, image size part needs to be implemented
	When User remembers 'ImageTopic3' topic model id and name
	When User remembers 'ImageTopic1' topic model id and name
	When User selects images from first 'ImageTopic3' and second 'ImageTopic1' topic on Canvas
	Then image is highlighted in 'rgb(62, 158, 255)' color with '0.5' opacity in 'ImageTopic3' topic on Canvas
	Then image is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic1' topic on Canvas

@MindManager @Side_Toolbox @Background @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-848] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_change_the_image_location
	When User remembers 'ImageTopic1' topic model id and name
	When User clicks on image in 'ImageTopic1' topic
	Then 'ImageTopic1' topic is highlighted with 'rgb(62, 158, 255)' color in '1' opacity on Canvas
	Then image is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic1' topic on Canvas
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	Then 'Location' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Left' value is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	When User remembers location of image in 'ImageTopic1' topic
	When User remembers location of text in 'ImageTopic1' topic
	When User clicks dropdown arrow in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then 'joint-select-box-options' dropdown menu is displayed to User
	Then following options are displayed in 'joint-select-box-options' selectbox dropdown menu
		| options |
		| Left    |
		| Right   |
		| Top     |
		| Bottom  |
	When User selects 'Right' in dropdown menu
	Then image in 'ImageTopic1' topic has changed location by X axis on Canvas
	Then image in 'ImageTopic1' topic has not changed location by Y axis on Canvas
	Then text in 'ImageTopic1' topic has changed location by X axis on Canvas
	Then text in 'ImageTopic1' topic has not changed location by Y axis on Canvas
	When User remembers location of image in 'ImageTopic1' topic
	When User remembers location of text in 'ImageTopic1' topic
	When User clicks on the selectbox in 'Location' section of 'PanelByName' side panel with 'Image' header and select 'Top' in dropdown menu
	Then image in 'ImageTopic1' topic has changed location by X axis on Canvas
	Then image in 'ImageTopic1' topic has changed location by Y axis on Canvas
	Then text in 'ImageTopic1' topic has changed location by X axis on Canvas
	Then text in 'ImageTopic1' topic has changed location by Y axis on Canvas
	When User remembers location of image in 'ImageTopic1' topic
	When User remembers location of text in 'ImageTopic1' topic
	When User clicks on the selectbox in 'Location' section of 'PanelByName' side panel with 'Image' header and select 'Bottom' in dropdown menu
	Then image in 'ImageTopic1' topic has not changed location by X axis on Canvas
	Then image in 'ImageTopic1' topic has changed location by Y axis on Canvas
	Then text in 'ImageTopic1' topic has not changed location by X axis on Canvas
	Then text in 'ImageTopic1' topic has changed location by Y axis on Canvas
	When User remembers location of image in 'ImageTopic1' topic
	When User remembers location of text in 'ImageTopic1' topic
	When User clicks on the selectbox in 'Location' section of 'PanelByName' side panel with 'Image' header and select 'Left' in dropdown menu
	Then image in 'ImageTopic1' topic has changed location by X axis on Canvas
	Then text in 'ImageTopic1' topic has changed location by X axis on Canvas
	Then text in 'ImageTopic1' topic has changed location by Y axis on Canvas
	Then image in 'ImageTopic1' topic has not changed location by Y axis on Canvas

@MindManager @Side_Toolbox @Background @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-848] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_change_the_multiple_images_location
	When User remembers 'ImageTopic1' topic model id and name
	When User remembers 'ImageTopic3' topic model id and name
	When User selects images from first 'ImageTopic1' and second 'ImageTopic3' topic on Canvas
	Then 'ImageTopic3' topic is highlighted with 'rgb(62, 158, 255)' color in '1' opacity on Canvas
	Then 'ImageTopic1' topic is highlighted with 'rgb(62, 158, 255)' color in '0.5' opacity on Canvas
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	Then 'Location' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Left' value is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	When User remembers location of image in 'ImageTopic1' topic
	When User remembers location of text in 'ImageTopic1' topic
	When User remembers location of image in 'ImageTopic3' topic
	When User remembers location of text in 'ImageTopic3' topic
	When User clicks dropdown arrow in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then 'joint-select-box-options' dropdown menu is displayed to User
	Then following options are displayed in 'joint-select-box-options' selectbox dropdown menu
		| options |
		| Left    |
		| Right   |
		| Top     |
		| Bottom  |
	When User selects 'Right' in dropdown menu
	Then image in 'ImageTopic1' topic has changed location by X axis on Canvas
	Then image in 'ImageTopic1' topic has not changed location by Y axis on Canvas
	Then text in 'ImageTopic1' topic has changed location by X axis on Canvas
	Then text in 'ImageTopic1' topic has not changed location by Y axis on Canvas
	Then image in 'ImageTopic3' topic has changed location by X axis on Canvas
	Then image in 'ImageTopic3' topic has not changed location by Y axis on Canvas
	Then text in 'ImageTopic3' topic has changed location by X axis on Canvas
	Then text in 'ImageTopic3' topic has not changed location by Y axis on Canvas
	When User remembers location of image in 'ImageTopic1' topic
	When User remembers location of text in 'ImageTopic1' topic
	When User remembers location of image in 'ImageTopic3' topic
	When User remembers location of text in 'ImageTopic3' topic
	When User clicks on the selectbox in 'Location' section of 'PanelByName' side panel with 'Image' header and select 'Top' in dropdown menu
	Then image in 'ImageTopic1' topic has changed location by X axis on Canvas
	Then image in 'ImageTopic1' topic has changed location by Y axis on Canvas
	Then text in 'ImageTopic1' topic has changed location by X axis on Canvas
	Then text in 'ImageTopic1' topic has changed location by Y axis on Canvas
	Then image in 'ImageTopic3' topic has changed location by X axis on Canvas
	Then image in 'ImageTopic3' topic has changed location by Y axis on Canvas
	Then text in 'ImageTopic3' topic has changed location by X axis on Canvas
	Then text in 'ImageTopic3' topic has changed location by Y axis on Canvas
	When User remembers location of image in 'ImageTopic1' topic
	When User remembers location of text in 'ImageTopic1' topic
	When User remembers location of image in 'ImageTopic3' topic
	When User remembers location of text in 'ImageTopic3' topic
	When User clicks on the selectbox in 'Location' section of 'PanelByName' side panel with 'Image' header and select 'Bottom' in dropdown menu
	Then image in 'ImageTopic1' topic has not changed location by X axis on Canvas
	Then image in 'ImageTopic1' topic has changed location by Y axis on Canvas
	Then text in 'ImageTopic1' topic has not changed location by X axis on Canvas
	Then text in 'ImageTopic1' topic has changed location by Y axis on Canvas
	Then image in 'ImageTopic3' topic has not changed location by X axis on Canvas
	Then image in 'ImageTopic3' topic has changed location by Y axis on Canvas
	Then text in 'ImageTopic3' topic has not changed location by X axis on Canvas
	Then text in 'ImageTopic3' topic has changed location by Y axis on Canvas
	When User remembers location of image in 'ImageTopic1' topic
	When User remembers location of text in 'ImageTopic1' topic
	When User remembers location of image in 'ImageTopic3' topic
	When User remembers location of text in 'ImageTopic3' topic
	When User clicks on the selectbox in 'Location' section of 'PanelByName' side panel with 'Image' header and select 'Left' in dropdown menu
	Then image in 'ImageTopic1' topic has changed location by X axis on Canvas
	Then image in 'ImageTopic1' topic has not changed location by Y axis on Canvas
	Then text in 'ImageTopic1' topic has changed location by X axis on Canvas
	Then text in 'ImageTopic1' topic has changed location by Y axis on Canvas
	Then image in 'ImageTopic3' topic has changed location by X axis on Canvas
	Then image in 'ImageTopic3' topic has not changed location by Y axis on Canvas
	Then text in 'ImageTopic3' topic has changed location by X axis on Canvas
	Then text in 'ImageTopic3' topic has changed location by Y axis on Canvas