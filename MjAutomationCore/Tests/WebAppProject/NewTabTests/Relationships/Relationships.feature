@retry(2)
Feature: Relationships
Check the relationship functionality

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation/RuntimeDataFiles' folder of SharePoint cloud via Api
		| fileName            | FilePath             |
		| auto_test_SRND.mmap | RelationshipMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @Relationships @App_QA @App_Staging @App_Prod @Qase[WEB-276] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_choose_the_relationship_on_topic
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'Relationship label' topic on Canvas
	When User clicks 'Floating Topic' topic on Canvas
	Then '2' relationship lines are displayed on Canvas
	When User clicks on the relationship line
	Then relationship is selected on Canvas
	Then Bezier has '2' endpoint handlebars on Canvas
	Then Bezier has '2' endpoint handlebars on Topics

@MindManager @Relationships @App_QA @App_Staging @App_Prod @Qase[WEB-277] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_edit_the_relationship_location_on_topic
	When User clicks on the relationship line
	Then relationship is selected on Canvas
	Then Bezier has '2' endpoint handlebars on Canvas
	Then Bezier has '2' endpoint handlebars on Topics
	When User remembers the anchor point location of the selected relationship line
	When User moves relationship point by '2' and '0' coordinates
	Then relationship line anchor point has changes its location by X axis
	When User remembers the anchor point location of the selected relationship line
	When User moves relationship point by '0' and '2' coordinates
	Then relationship line anchor point has changes its location by Y axis

@MindManager @Relationships @App_QA @App_Staging @App_Prod @Qase[WEB-278] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_edit_the_relationship_location_to_other_topics
	When User clicks on the relationship line
	Then relationship is selected on Canvas
	Then Bezier has '2' endpoint handlebars on Canvas
	Then Bezier has '2' endpoint handlebars on Topics
	When User move the endpoint to 'Floating Topic' topic on the map
	Then relationship arrow anchor point is displayed in 'Floating Topic' topic

@MindManager @Relationships @App_QA @App_Staging @App_Prod @Qase[WEB-280] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_delete_the_relationship_using_the_delete_key
	When User clicks on the relationship line
	Then relationship is selected on Canvas
	Then Bezier has '2' endpoint handlebars on Canvas
	Then Bezier has '2' endpoint handlebars on Topics
	When User presses the 'Delete' key on the keyboard
	Then relationship is not displayed on the Canvas

@MindManager @Relationships @App_QA @App_Staging @App_Prod @Qase[WEB-280] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_delete_the_relationship_using_the_backspace_key
	When User clicks on the relationship line
	Then relationship is selected on Canvas
	Then Bezier has '2' endpoint handlebars on Canvas
	Then Bezier has '2' endpoint handlebars on Topics
	When User presses the 'Backspace' key on the keyboard
	Then relationship is not displayed on the Canvas

@MindManager @Relationships @App_QA @App_Staging @App_Prod @Qase[WEB-281] @Health_Check @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_connect_topics_to_objects_with_relationships
	When User adds 'Circle' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'Floating Topic' topic on Canvas
	When User clicks on 'Circle' shape
	Then '2' relationship lines are displayed on Canvas
	Then relationship point is displayed in 'Circle' shape

@MindManager @Relationships @App_QA @App_Staging @App_Prod @Qase[WEB-281] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_connect_objects_to_topics_with_relationships
	When User adds 'Circle' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	Then 'Circle' shape is highlighted green frame
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'Circle' shape on the Canvas
	When User clicks 'Floating Topic' topic on Canvas
	Then '2' relationship lines are displayed on Canvas
	Then relationship arrow anchor point is displayed in 'Floating Topic' topic

@MindManager @Relationships @App_QA @App_Staging @App_Prod @Qase[WEB-281] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_connect_objects_to_objects_with_relationships
	When User adds 'Circle' shape from 'toolpanel-popup' dropdown menu to '200','200' position on Canvas
	When User adds 'Rectangle' shape from 'toolpanel-popup' dropdown menu to '10','100' position on Canvas
	When User clicks on 'Circle' shape
	Then 'Circle' shape is highlighted green frame
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'Circle' shape on the Canvas
	When User clicks on 'Rectangle' shape
	Then '2' relationship lines are displayed on Canvas
	Then relationship point is displayed in 'Rectangle' shape

@MindManager @Relationships @App_QA @App_Staging @App_Prod @Qase[WEB-283] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_select_boundary
	When User selects 'Floating Topic' topic boundary body on Canvas
	Then Boundary outerline is highlighted blue color on the 'Floating Topic' topic on Canvas

@MindManager @Relationships @App_QA @App_Staging @App_Prod @Qase[WEB-283] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_select_boundaries
	When User presses and hold the 'Ctrl' key on the keyboard
	When User selects 'MT1' topic boundary body on Canvas
	When User selects 'Floating Topic' topic boundary body on Canvas
	Then Boundary outerline is highlighted blue color on the 'Floating Topic' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'MT1' topic on Canvas

@MindManager @Relationships @App_QA @App_Staging @App_Prod @Qase[WEB-284] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_delete_the_boundary_using_the_delete_key
	When User selects 'Floating Topic' topic boundary body on Canvas
	Then Boundary outerline is highlighted blue color on the 'Floating Topic' topic on Canvas
	When User presses the 'Delete' key on the keyboard
	Then 'Floating Topic' topic is not located in boundary on Canvas

@MindManager @Relationships @App_QA @App_Staging @App_Prod @Qase[WEB-284] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_delete_the_boundary_using_the_backspace_key
	When User selects 'Floating Topic' topic boundary body on Canvas
	Then Boundary outerline is highlighted blue color on the 'Floating Topic' topic on Canvas
	When User presses the 'Backspace' key on the keyboard
	Then 'Floating Topic' topic is not located in boundary on Canvas

@MindManager @Relationships @App_QA @App_Staging @App_Prod @Qase[WEB-284] @Cleanup @Upd_Qase
Scenario: Verify_that_it_is_possible_to_delete_the_boundary_using_the_Delete_button_on_toolbar
	When User selects 'Floating Topic' topic boundary body on Canvas
	Then Boundary outerline is highlighted blue color on the 'Floating Topic' topic on Canvas
	When User clicks 'Delete' button on Tools panel
	Then 'Floating Topic' topic is not located in boundary on Canvas