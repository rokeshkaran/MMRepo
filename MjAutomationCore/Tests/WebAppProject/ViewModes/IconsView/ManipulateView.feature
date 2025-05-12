@retry(2)
Feature: ManipulateView
Check manipulate view functionality

Background: Pre-condition
	Given User uploads following publish files via Api
		| Name          | PublishFile     |
		| auto_test_RND | Icons mode.mmap |
	Given Add options to publish update request
		| Mode      |
		| published |
	When User performs publish update request for 'auto_test_RND' published file via Api
	When User opens published file with 'auto_test_RND' name in browser via Api
	Then map is displayed in 'Icon' view mode

@MindManager @Icons_View @Manipulate_View @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1279] @Upd_Qase
Scenario: Check_it_is_possible_to_scroll_map_in_icons_view
	When User remembers location of 'Agenda' topic on Canvas
	When User scrolls the map down
	Then 'Agenda' topic has changed location by Y axis on Canvas
	When User remembers location of 'Agenda' topic on Canvas
	When User scrolls the map up
	Then 'Agenda' topic has changed location by Y axis on Canvas

@MindManager @Icons_View @Manipulate_View @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1280] @Upd_Qase
Scenario: Check_it_is_possible_to_pan_the_map_if_all_icons_do_not_fit_to_the_screen
	When User remembers the map location on Canvas
	When User left-clicks on Canvas and hold and wait
	When User moves cursor by '-20' '0' coordinates on Canvas
	Then map has changed location by X axis on Canvas
	When User remembers the map location on Canvas
	When User moves cursor by '0' '-20' coordinates on Canvas
	Then map has changed location by Y axis on Canvas
	When User remembers the map location on Canvas
	When User moves cursor by '8' '8' coordinates on Canvas
	Then map has changed location by X axis on Canvas
	Then map has changed location by Y axis on Canvas

@MindManager @Icons_View @Manipulate_View @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1281] @Upd_Qase
Scenario: Check_it_is_possible_to_zoom_in_and_zoom_out_the_map_in_Icon_view
	When User remembers map size
	When User clicks Zoom Out button on zoom bar of side toolbox
	Then map is Zoomed out
	When User clicks Zoom In button on zoom bar of side toolbox
	When User clicks Zoom In button on zoom bar of side toolbox
	Then map is Zoomed in