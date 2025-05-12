@retry(2)
Feature: ManipulateView
Check manipulate view functionality

Background: Pre-condition
	Given '3' User uploads following publish files via Api
		| Name          | PublishFile    |
		| auto_test_RND | Tags mode.mmap |
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_RND' published file via Api
	When User opens published file with 'auto_test_RND' name in browser via Api
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Tag' view mode

@MindManager @Tag_View @Manipulate_View @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1259] @Upd_Qase
Scenario: Check_it_is_possible_to_scroll_the_map_in_Tag_view
	When User remembers location of 'Topic' topic on Canvas
	When User scrolls the map down
	Then 'Topic' topic has changed location by Y axis on Canvas
	When User remembers location of 'Topic' topic on Canvas
	When User scrolls the map up
	Then 'Topic' topic has changed location by Y axis on Canvas

@MindManager @Tag_View @Manipulate_View @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1260] @Upd_Qase
Scenario: Check_it_is_possible_to_pan_the_map_if_all_tags_do_not_fit_to_the_screen
	When User remembers the map location on Canvas
	When User left-clicks on Canvas and hold and wait
	When User moves cursor by '-20' '0' coordinates on Canvas
	Then map has changed location by X axis on Canvas
	When User remembers the map location on Canvas
	When User moves cursor by '0' '-20' coordinates on Canvas
	Then map has changed location by Y axis on Canvas
	When User remembers the map location on Canvas
	When User moves cursor by '20' '20' coordinates on Canvas
	Then map has changed location by X axis on Canvas
	Then map has changed location by Y axis on Canvas

@MindManager @Tag_View @Manipulate_View @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1261] @Upd_Qase
Scenario: Check_it_is_possible_to_zoom_in_and_zoom_out_the_map_in_Tag_view
	When User remembers map size
	When User clicks Zoom Out button on zoom bar of side toolbox
	Then map is Zoomed out
	When User clicks Zoom In button on zoom bar of side toolbox
	When User clicks Zoom In button on zoom bar of side toolbox
	Then map is Zoomed in

@MindManager @Tag_View @Manipulate_View @App_QA @QA @App_Staging @Staging @App_Prod @Prod @Cleanup @Qase[WEB-1262] @Upd_Qase
Scenario: Check_it_is_possible_to_expand_and_collapse_the_columns
	Then title 'C - Kanban' is displayed on the Tag View page
	When User clicks 'Collapse' button at the top of the 'Doing' column
	Then 'Doing' column is collapsed
	When User clicks 'Expand' button at the top of the 'Doing' column
	Then 'Doing' column is expanded
