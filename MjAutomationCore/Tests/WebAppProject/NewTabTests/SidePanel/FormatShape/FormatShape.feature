@retry(2)
Feature: FormatShape
Check functionality Format Shape on side menu

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar

@MindManager @SidePanel @FormatShape @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-875] @Health_Check @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_an_object_name
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Rectangle' Shape is displayed on Canvas
	When User clicks 'Format Shape' button of side Toolbox
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	Then 'Rectangle 1' value is displayed to 'Name' field in 'Object' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters 'Rectangle' value to 'Name' field in 'Object' section of 'PanelByName' side panel with 'Format Shape' header
	Then 'Rectangle' value is displayed to 'Name' field in 'Object' section of 'PanelByName' side panel with 'Format Shape' header

@MindManager @SidePanel @FormatShape @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-876] @Upd_Qase
Scenario: Check_Color_Line_style
	When User adds 'Four Point Star' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Four Point Star' Shape is displayed on Canvas
	When User clicks 'Format Shape' button of side Toolbox
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	Then 'rgb(68, 68, 68)' color is displayed to 'Color' field in 'Line' section of 'PanelByName' side panel with 'Format Shape' header
	When User clicks Color Picker menu button in 'Color' field in 'Line' section of 'PanelByName' side panel with 'Format Shape' header
	Then Color Picker window is displayed to User
	When User enters '#ff1d921e' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'rgb(29, 146, 30)' color is displayed to 'Color' field in 'Line' section of 'PanelByName' side panel with 'Format Shape' header
	Then 'rgb(29, 146, 30)' color is displayed to the 'Four Point Star' shape line

@MindManager @SidePanel @FormatShape @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-876] @Upd_Qase
Scenario: Check_Weight_Line_style
	When User adds 'Four Point Star' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Four Point Star' Shape is displayed on Canvas
	When User clicks 'Format Shape' button of side Toolbox
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	Then '1 pt' value is displayed in 'Weight' selectbox in 'Line' section of 'PanelByName' side panel with 'Format Shape' header
	When User clicks 'Weight' selectbox in 'Line' section of 'PanelByName' side panel with 'Format Shape' header and select '6 pt' in dropdown menu
	Then '16px' size is displayed for 'Four Point Star' shape line
	Then '6 pt' value is displayed in 'Weight' selectbox in 'Line' section of 'PanelByName' side panel with 'Format Shape' header

@MindManager @SidePanel @FormatShape @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-876] @Upd_Qase
Scenario: Check_Pattern_Line_style
	When User adds 'Four Point Star' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Four Point Star' Shape is displayed on Canvas
	When User clicks 'Format Shape' button of side Toolbox
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	When User clicks 'Pattern' selectbox in 'Line' section of 'PanelByName' side panel with 'Format Shape' header and select '12,3,3,3' in dropdown menu
	# NOTE: be aware that we are not able to check default value of the 'Pattern' dropbox option
	Then '5.33333px, 1.33333px, 1.33333px, 1.33333px' pattern line is displayed to the 'Four Point Star' shape
	Then '12,3,3,3' value is displayed in 'Pattern' selectbox in 'Line' section of 'PanelByName' side panel with 'Format Shape' header

@MindManager @SidePanel @FormatShape @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-877] @Upd_Qase
Scenario: Check_it_is_possible_to_change_fill_color_and_transparency_of_the_shape
	When User adds 'Four Point Star' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Four Point Star' Shape is displayed on Canvas
	When User clicks 'Format Shape' button of side Toolbox
	Then 'rgba(0, 0, 0, 0)' color is displayed to 'Color' field in 'Fill' section of 'PanelByName' side panel with 'Format Shape' header
	When User clicks Color Picker menu button in 'Color' field in 'Fill' section of 'PanelByName' side panel with 'Format Shape' header
	Then Color Picker window is displayed to User
	When User enters '#fff0a210' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'rgb(240, 162, 16)' fill color is displayed to the 'Four Point Star' Shape
	Then 'rgb(240, 162, 16)' color is displayed to 'Color' field in 'Fill' section of 'PanelByName' side panel with 'Format Shape' header
	Then '0%' value is displayed in 'Transparency' selectbox in 'Fill' section of 'PanelByName' side panel with 'Format Shape' header
	When User clicks 'Transparency' selectbox in 'Fill' section of 'PanelByName' side panel with 'Format Shape' header and select '60%' in dropdown menu
	Then 'rgba(240, 162, 16, 0.4)' transparency color is displayed to the 'Four Point Star' Shape
	Then '60%' value is displayed in 'Transparency' selectbox in 'Fill' section of 'PanelByName' side panel with 'Format Shape' header

@MindManager @SidePanel @FormatShape @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-878] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_a_shape_width
	When User adds 'Four Point Star' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Four Point Star' Shape is displayed on Canvas
	When User clicks 'Format Shape' button of side Toolbox
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	Then '30.0 mm' value is displayed to 'Width' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '4.2' value to 'Width' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	Then '4.2 mm' value is displayed to 'Width' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '~!-@<>?.#$jd%w+_9^/' value to 'Width' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	Then '0.9 mm' value is displayed to 'Width' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '0' value to 'Width' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	When User presses the 'Enter' key on the keyboard
	Then '4.0 mm' value is displayed to 'Width' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '-8.5' value to 'Height' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	Then '8.5 mm' value is displayed to 'Height' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header

@MindManager @SidePanel @FormatShape @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-878] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_a_shape_height
	When User adds 'Four Point Star' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Four Point Star' Shape is displayed on Canvas
	When User clicks 'Format Shape' button of side Toolbox
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	Then '30.0 mm' value is displayed to 'Height' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '1 00.0' value to 'Height' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	Then '100.0 mm' value is displayed to 'Height' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '~!-@<>?#$jd%1w+_6^/me.8' value to 'Height' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	Then '16.8 mm' value is displayed to 'Height' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '-8.5' value to 'Height' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	Then '8.5 mm' value is displayed to 'Height' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '66,1' value to 'Height' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	Then '661.0 mm' value is displayed to 'Height' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header

@MindManager @SidePanel @FormatShape @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-879] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_an_angle_of_shape_rotation
	When User adds 'Right Angle Triangle' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Right Angle Triangle' Shape is displayed on Canvas
	When User clicks 'Format Shape' button of side Toolbox
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	Then '0' value is displayed to 'Angle' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '-90' value to 'Angle' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User presses the 'Enter' key on the keyboard
	Then 'rotate -90' angle is applied to the 'Right Angle Triangle' shape
	Then '-90' value is displayed to 'Angle' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters 'Mm@+_12#"*' value to 'Angle' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User presses the 'Enter' key on the keyboard
	Then 'rotate 12' angle is applied to the 'Right Angle Triangle' shape
	Then '12' value is displayed to 'Angle' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '99.0' value to 'Angle' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User checks checkbox to 'Show' field in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then 'rotate 0' angle is applied to the 'Right Angle Triangle' shape
	Then '360' value is displayed to 'Angle' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '1 00' value to 'Angle' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User presses the 'Enter' key on the keyboard
	Then 'rotate 100' angle is applied to the 'Right Angle Triangle' shape
	Then '100' value is displayed to 'Angle' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header

@MindManager @SidePanel @FormatShape @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-880] @Upd_Qase
Scenario: Check_corner_radius
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Rectangle' Shape is displayed on Canvas
	When User clicks 'Format Shape' button of side Toolbox
	When User enters '6.0' value to 'Corner Radius' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	When User presses the 'Enter' key on the keyboard
	Then corner radius rx '22.6', ry'22.6' is displayed in 'Rectangle' shape
	Then '6.0 mm' value is displayed to 'Corner Radius' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters 'Mm@+_2#"*' value to 'Corner Radius' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	When User presses the 'Enter' key on the keyboard
	Then corner radius rx '7.5', ry'7.5' is displayed in 'Rectangle' shape
	Then '2.0 mm' value is displayed to 'Corner Radius' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '-5.5' value to 'Corner Radius' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	When User presses the 'Enter' key on the keyboard
	Then corner radius rx '20.7', ry'20.7' is displayed in 'Rectangle' shape
	Then '5.5 mm' value is displayed to 'Corner Radius' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header

@MindManager @SidePanel @FormatShape @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-881] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_shape_title_orientation_settings
	When User adds 'Text Bubble' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Text Bubble' Shape is displayed on Canvas
	When User clicks 'Format Shape' button of side Toolbox
	Then checkbox is unchecked to 'Show' field in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then 'Top' value is displayed in 'Location' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then 'Center' value is displayed in 'Alignment' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then 'Horizontal' value is displayed in 'Orientation' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	When User checks checkbox to 'Show' field in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then checkbox is checked to 'Show' field in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then 'Text Bubble 1' title is displayed of the 'Text Bubble' shape
	When User clicks 'Orientation' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header and select 'Vertical' in dropdown menu
	Then 'Text Bubble 1' title is displayed on 'rotate(-90)' orientation of the 'Text Bubble' shape
	Then 'Vertical' value is displayed in 'Orientation' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	When User clicks 'Orientation' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header and select 'Horizontal' in dropdown menu
	Then 'Horizontal' value is displayed in 'Orientation' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	When User checks uncheckbox to 'Show' field in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then checkbox is unchecked to 'Show' field in 'Title' section of 'PanelByName' side panel with 'Format Shape' header

@MindManager @SidePanel @FormatShape @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-881] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_shape_title_alignment_settings
	When User adds 'Text Bubble' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Text Bubble' Shape is displayed on Canvas
	When User clicks 'Format Shape' button of side Toolbox
	Then checkbox is unchecked to 'Show' field in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then 'Top' value is displayed in 'Location' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then 'Center' value is displayed in 'Alignment' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then 'Horizontal' value is displayed in 'Orientation' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	When User checks checkbox to 'Show' field in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then checkbox is checked to 'Show' field in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then 'Text Bubble 1' title is displayed of the 'Text Bubble' shape
	When User clicks 'Alignment' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header and select 'Left' in dropdown menu
	Then 'Text Bubble 1' title is alignment to 'start' in the 'Text Bubble' shape
	Then 'Left' value is displayed in 'Alignment' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	When User clicks 'Alignment' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header and select 'Right' in dropdown menu
	Then 'Text Bubble 1' title is alignment to 'end' in the 'Text Bubble' shape
	Then 'Right' value is displayed in 'Alignment' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	When User clicks 'Alignment' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header and select 'Center' in dropdown menu
	Then 'Text Bubble 1' title is alignment to 'middle' in the 'Text Bubble' shape
	Then 'Center' value is displayed in 'Alignment' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	When User checks uncheckbox to 'Show' field in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then checkbox is unchecked to 'Show' field in 'Title' section of 'PanelByName' side panel with 'Format Shape' header

@MindManager @SidePanel @FormatShape @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-881] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_shape_title_location_settings
	When User adds 'Text Bubble' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Text Bubble' Shape is displayed on Canvas
	When User clicks 'Format Shape' button of side Toolbox
	Then checkbox is unchecked to 'Show' field in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then 'Top' value is displayed in 'Location' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then 'Center' value is displayed in 'Alignment' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then 'Horizontal' value is displayed in 'Orientation' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	When User checks checkbox to 'Show' field in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then checkbox is checked to 'Show' field in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then 'Text Bubble 1' title is displayed of the 'Text Bubble' shape
	When User clicks 'Location' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header and select 'Bottom' in dropdown menu
	Then 'Bottom' value is displayed in 'Location' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	When User clicks 'Location' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header and select 'Left' in dropdown menu
	Then 'Left' value is displayed in 'Location' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	When User clicks 'Location' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header and select 'Right' in dropdown menu
	Then 'Right' value is displayed in 'Location' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	When User clicks 'Location' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header and select 'Top' in dropdown menu
	Then 'Top' value is displayed in 'Location' selectbox in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	When User checks uncheckbox to 'Show' field in 'Title' section of 'PanelByName' side panel with 'Format Shape' header
	Then checkbox is unchecked to 'Show' field in 'Title' section of 'PanelByName' side panel with 'Format Shape' header