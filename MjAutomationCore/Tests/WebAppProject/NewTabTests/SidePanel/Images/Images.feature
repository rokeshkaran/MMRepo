@retry(2)
Feature: Images
Check functionality of images from side panel

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath      |
		| auto_test_SRND.mmap | ImageMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '70' via the side tool bar

@MindManager @Side_Toolbox @Images @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-887] @Health_Check @Upd_Qase
Scenario: Check_that_user_can_add_a_topic_image_via_side_panel
	When User clicks 'ImageTopic2' topic on Canvas
	Then 'ImageTopic2' is outlined with a blue circuit
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	When User adds 'FruitsOutlineIcon.png' image via 'PanelByName' side panel with 'Image' header
	Then image is displayed in 'ImageTopic2' topiс on Canvas
	Then 'ImageTopic2' is outlined with a blue circuit
	Then 'Size' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Type' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Location' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Apply changes to selected images' radio button is checked in 'PanelByName' side panel with 'Image' header

@MindManager @Side_Toolbox @Images @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-888] @Upd_Qase
Scenario Outline: Check_that_user_can_add_a_topic_image_via_side_panel_to_deselected_image
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	When User adds 'FruitsOutlineIcon.png' image via 'PanelByName' side panel with 'Image' header
	When User hovers cursor the 'ImageTopic2' topic
	When User drops image on the <section> side of 'ImageTopic2' topic by '<X>' and '<Y>' coordinates on Canvas
	Then 'ImageTopic2' is outlined with a blue circuit
	Then image is displayed in 'ImageTopic2' topiс on Canvas
	Then 'Size' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Type' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Location' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Apply changes to selected images' radio button is checked in 'PanelByName' side panel with 'Image' header
Examples:
	| section | X  | Y  |
	| top     | 0  | 0  |
	| bottom  | 0  | 10 |
	| right   | -5 | 0  |
	| left    | 5  | 0  |

@MindManager @Side_Toolbox @Images @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-889] @Upd_Qase
#To add identifiers to the 'selection' class, such as an ID for background objects (https://mindjet.atlassian.net/browse/MMCV-9200)
Scenario: Check_that_image_can_be_added_as_background_object
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	When User adds 'FruitsOutlineIcon.png' image via 'PanelByName' side panel with 'Image' header
	When User mouses over clickable area by '-20' and '0' coordinates  on Canvas
	Then 'assets-image' icon is displayed beside cursor
	When User releases all keys on keyboard
	When User remembers 'FruitsOutlineIcon.png' image on Canvas
	Then 'FruitsOutlineIcon.png' image is displayed on Canvas
	Then 'FruitsOutlineIcon.png' image is highlighted in green frame on Canvas

@MindManager @Side_Toolbox @Images @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-890] @Upd_Qase
Scenario: Check_that_image_location_can_be_changed
	When User clicks on image in 'ImageTopic1' topic
	Then Topic Border is highlight blue color in 'ImageTopic1' topic on Canvas
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	When User remembers location of image in 'ImageTopic1' topic
	Then 'Location' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Left' value is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	When User clicks dropdown arrow in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then dropdown menu is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	When User selects 'Right' in dropdown menu
	Then 'Right' value is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then image in 'ImageTopic1' topic has changed location by X axis on Canvas
	When User remembers location of image in 'ImageTopic1' topic
	When User clicks dropdown arrow in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then dropdown menu is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	When User selects 'Top' in dropdown menu
	Then 'Top' value is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then image in 'ImageTopic1' topic has changed location by Y axis on Canvas
	When User remembers location of image in 'ImageTopic1' topic
	When User clicks dropdown arrow in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then dropdown menu is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	When User selects 'Bottom' in dropdown menu
	Then 'Bottom' value is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then image in 'ImageTopic1' topic has changed location by Y axis on Canvas
	When User remembers location of image in 'ImageTopic1' topic
	When User clicks dropdown arrow in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then dropdown menu is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	When User selects 'Left' in dropdown menu
	Then 'Left' value is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header
	Then image in 'ImageTopic1' topic has changed location by X axis on Canvas

@MindManager @Side_Toolbox @Images @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-891] @Upd_Qase
Scenario: Check_that_user_can_open_image_menu_on_the_side_panel
	When User clicks on image in 'ImageTopic1' topic
	Then Topic Border is highlight blue color in 'ImageTopic1' topic on Canvas
	When User mouse over on 'Image' button of side toolbox
	Then 'Image' tooltip is displayed to the User
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	Then 'Replace' button is displayed
	Then 'Size' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Type' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Location' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Apply changes to selected images' radio button is checked in 'PanelByName' side panel with 'Image' header
	Then 'Apply changes to all images' radio button is unchecked in 'PanelByName' side panel with 'Image' header

@MindManager @Side_Toolbox @Images @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-892] @Upd_Qase
Scenario: Check_that_side_panel_shows_current_format_options_for_selected_image
	When User clicks on image in 'MTCO' topic
	Then Topic Border is highlight blue color in 'ImageTopic1' topic on Canvas
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	Then 'Size' section is displayed on 'PanelByName' side panel with 'Image' header
	Then '20.0 mm' value is displayed to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	Then '300.0 mm' value is displayed to 'Viewer Max Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	Then 'Type' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Thumbnail Image' radio button is checked in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then 'Standard Image' radio button is unchecked in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then 'Location' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Left' value is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header

@MindManager @Side_Toolbox @Images @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-893] @Upd_Qase
Scenario: Check_that_side_panel_shows_current_format_options_for_multiple_selected_images
	When User selects images from first 'MTCO' and second 'MTSTCO' topic on Canvas
	Then Topic Border is highlight blue color in 'MTCO' topic on Canvas
	Then Topic Border is highlight blue color in 'MTSTCO' topic on Canvas
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	Then 'Size' section is displayed on 'PanelByName' side panel with 'Image' header
	Then '20.0 mm' value is displayed to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	Then '300.0 mm' value is displayed to 'Viewer Max Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	Then 'Type' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Thumbnail Image' radio button is checked in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then 'Standard Image' radio button is unchecked in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then 'Location' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Left' value is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header

@MindManager @Side_Toolbox @Images @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-894] @Upd_Qase
Scenario: Check_that_side_panel_shows_blank_fields_when_multiple_images_are_selected_that_have_conflicting_values
	When User selects images from first 'MTCO' and second 'ImageTopic1' topic on Canvas
	Then Topic Border is highlight blue color in 'MTCO' topic on Canvas
	Then Topic Border is highlight blue color in 'ImageTopic1' topic on Canvas
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	Then 'Size' section is displayed on 'PanelByName' side panel with 'Image' header
	Then '' value is displayed to 'Image Size:' field in 'Size' section of 'PanelByName' side panel with 'Image' header
	Then 'Viewer Max Size:' input field is disabled in 'Size' section of 'PanelByName' side panel with 'Image' header
	Then 'Type' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Thumbnail Image' radio button is unchecked in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then 'Standard Image' radio button is unchecked in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then 'Location' section is displayed on 'PanelByName' side panel with 'Image' header
	Then 'Left' value is displayed in 'Location' section of 'PanelByName' side panel with 'Image' header