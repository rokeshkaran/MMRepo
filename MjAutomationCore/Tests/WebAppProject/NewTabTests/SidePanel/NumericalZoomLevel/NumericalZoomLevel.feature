@retry(2)
Feature: NumericalZoomLevel

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath             |
		| auto_test_SRND.mmap | RelationshipMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @NumericalZoomLevel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1478] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_edit_numerical_zoom_level
	Then User set zoom level to '250' via the side tool bar
	Then map zoom is '250%' on the side tool box

@MindManager @NumericalZoomLevel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1479] @Upd_Qase
Scenario: To_verify_that_it_is_NOT_possible_to_enter_negative_value_to_numerical_zoom_level
	Then User set zoom level to '-10' via the side tool bar
	Then map zoom is '10%' on the side tool box

@MindManager @NumericalZoomLevel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1480] @Upd_Qase
Scenario: To_verify_that_it_is_NOT_possible_to_enter_incorrect_value_to_numerical_zoom_level
	Then User set zoom level to 'hello' via the side tool bar
	Then map zoom is '10%' on the side tool box

@MindManager @NumericalZoomLevel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1482] @Upd_Qase
Scenario: To_verify_that_it_is_NOT_possible_to_enter_beyond_min_value_to_numerical_zoom_level
	Then User set zoom level to '100' via the side tool bar
	Then User set zoom level to '5' via the side tool bar
	Then map zoom is '10%' on the side tool box

@MindManager @NumericalZoomLevel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1482] @Upd_Qase
Scenario: To_verify_that_it_is_NOT_possible_to_enter_beyond_max_value_to_numerical_zoom_level
	Then User set zoom level to '100' via the side tool bar
	Then User set zoom level to '500' via the side tool bar
	Then map zoom is '400%' on the side tool box