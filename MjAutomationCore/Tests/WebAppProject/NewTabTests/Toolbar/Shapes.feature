@retry(2)
Feature: Shapes
Check Shapes functionality via Toolbar

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
	Then User set zoom level to '32' via the side tool bar

@MindManager @Toolbar @Shapes @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1191] @Upd_Qase
Scenario: Check_that_the_Shapes_can_be_added_to_the_map
	When User clicks 'Insert Shape' button on Tools panel
	Then following items is displayed in 'toolpanel' dropdown menu
		| items                |
		| Rectangle            |
		| Rounded Rectangle    |
		| Trapezoid            |
		| Parallelogram        |
		| Isosceles Triangle   |
		| Right Angle Triangle |
		| Circle               |
		| Right Arrow          |
		| Block Arrow          |
		| Chevron              |
		| Text Bubble          |
		| Explosion            |
		| Four Point Star      |
		| Five Point Star      |
		| Horizontal Divider   |
		| Vertical Divider     |
		| Left Curly Bracket   |
		| Right Curly Bracket  |
	When User clicks 'Isosceles Triangle' item in 'toolpanel' dropdown menu
	Then 'isosceles-triangle' icon is displayed beside cursor
	When User adds 'Isosceles Triangle' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Isosceles Triangle' Shape is displayed on Canvas
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','210' position on Canvas
	Then 'Rectangle' Shape is displayed on Canvas
	When User adds 'Rounded Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','220' position on Canvas
	Then 'Rounded Rectangle' Shape is displayed on Canvas
	When User adds 'Trapezoid' shape from 'toolpanel-popup' dropdown menu to '200','230' position on Canvas
	Then 'Trapezoid' Shape is displayed on Canvas
	When User adds 'Parallelogram' shape from 'toolpanel-popup' dropdown menu to '200','240' position on Canvas
	Then 'Parallelogram' Shape is displayed on Canvas
	When User adds 'Right Angle Triangle' shape from 'toolpanel-popup' dropdown menu to '200','250' position on Canvas
	Then 'Right Angle Triangle' Shape is displayed on Canvas
	When User adds 'Circle' shape from 'toolpanel-popup' dropdown menu to '220','200' position on Canvas
	Then 'Circle' Shape is displayed on Canvas
	When User adds 'Right Arrow' shape from 'toolpanel-popup' dropdown menu to '230','200' position on Canvas
	Then 'Right Arrow' Shape is displayed on Canvas
	When User adds 'Block Arrow' shape from 'toolpanel-popup' dropdown menu to '240','200' position on Canvas
	Then 'Block Arrow' Shape is displayed on Canvas
	When User adds 'Chevron' shape from 'toolpanel-popup' dropdown menu to '250','200' position on Canvas
	Then 'Chevron' Shape is displayed on Canvas
	When User adds 'Text Bubble' shape from 'toolpanel-popup' dropdown menu to '260','200' position on Canvas
	Then 'Text Bubble' Shape is displayed on Canvas
	When User adds 'Explosion' shape from 'toolpanel-popup' dropdown menu to '270','200' position on Canvas
	Then 'Explosion' Shape is displayed on Canvas
	When User adds 'Four Point Star' shape from 'toolpanel-popup' dropdown menu to '280','200' position on Canvas
	Then 'Four Point Star' Shape is displayed on Canvas
	When User adds 'Five Point Star' shape from 'toolpanel-popup' dropdown menu to '250','180' position on Canvas
	Then 'Five Point Star' Shape is displayed on Canvas
	When User adds 'Horizontal Divider' shape from 'toolpanel-popup' dropdown menu to '260','180' position on Canvas
	Then 'Horizontal Divider' Shape is displayed on Canvas
	When User adds 'Vertical Divider' shape from 'toolpanel-popup' dropdown menu to '270','180' position on Canvas
	Then 'Vertical Divider' Shape is displayed on Canvas
	When User adds 'Left Curly Bracket' shape from 'toolpanel-popup' dropdown menu to '200','170' position on Canvas
	Then 'Left Curly Bracket' Shape is displayed on Canvas

@MindManager @Toolbar @Shapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1192] @Upd_Qase
Scenario: Delete_shape_from_the_toolbar
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Rectangle' Shape is displayed on Canvas
	Then border for 'Rectangle' shape is highlighted green color
	When User clicks 'Delete' button on Tools panel
	Then 'Rectangle' Shape is not displayed on Canvas

@MindManager @Toolbar @Shapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1192] @Upd_Qase
Scenario: Delete_Multiple_Shapes_via_the_Delete_button_on_the_keyboard
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Rectangle' Shape is displayed on Canvas
	When User adds 'Circle' shape from 'toolpanel-popup' dropdown menu to '100','270' position on Canvas
	Then 'Circle' Shape is displayed on Canvas
	When User selects first 'Rectangle' shape and second 'Circle' shape on Canvas
	When User presses the 'Delete' key on the keyboard
	Then 'Rectangle' Shape is not displayed on Canvas
	Then 'Circle' Shape is not displayed on Canvas

@MindManager @Toolbar @Shapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1192] @Upd_Qase
Scenario: Delete_Multiple_Shapes_via_the_Backspace_button_on_the_keyboard
	When User adds 'Five Point Star' shape from 'toolpanel-popup' dropdown menu to '250','200' position on Canvas
	Then 'Five Point Star' Shape is displayed on Canvas
	When User adds 'Circle' shape from 'toolpanel-popup' dropdown menu to '100','270' position on Canvas
	Then 'Circle' Shape is displayed on Canvas
	When User selects first 'Five Point Star' shape and second 'Circle' shape on Canvas
	When User presses the 'Backspace' key on the keyboard
	Then 'Five Point Star' Shape is not displayed on Canvas
	Then 'Circle' Shape is not displayed on Canvas

@MindManager @Toolbar @Shapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1192] @Upd_Qase
Scenario: Delete_Shape_via_the_context_menu
	When User adds 'Chevron' shape from 'toolpanel-popup' dropdown menu to '200','250' position on Canvas
	Then 'Chevron' Shape is displayed on Canvas
	When User right clicks on 'Chevron' shape
	When User clicks button with 'delete' name in 'background-object-contextmenu' menu
	Then 'Chevron' Shape is not displayed on Canvas