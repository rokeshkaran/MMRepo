@retry(2)
Feature: LearnTheBasics
Check functionality for Learn The Basics Banner

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'New' tab on file manager header page
	Then cloud templates page is displayed to User
	When interactive tour is set to 'enabled' on the cloud template page
	When User refresh page
	Then interactive tour banner is displayed on the cloud template page

@MindManager @Templates @App_QA @App_Staging @App_Prod @Qase[WEB-1120,WEB-1121,WEB-1122] @Upd_Qase
Scenario: Verify_that_learn_the_basics_button_is_highlighted_when_hovering_over
	When User hovers on the 'tour-link' element of the interactive banner on cloud template page
	Then 'tour-link' element in the interactive tour banner is highlighted in 'rgb(62, 83, 159)' rgba background color
	When User hovers on the 'close' element of the interactive banner on cloud template page
	Then 'close' element in the interactive tour banner is highlighted in 'rgb(62, 83, 159)' rgba background color
	When User clicks on the 'tour-link' element of the interactive banner on cloud template page
	Then Web Editor page is displayed to the User

@MindManager @Templates @App_QA @App_Staging @App_Prod @Qase[WEB-1123,WEB-1124] @Upd_Qase
Scenario: Verify_that_New_to_MindManager_disappear_when_clicking_x_button
	When User remembers location of 'Mind Mapping' template group card on cloud template page
	When User clicks on the 'close' element of the interactive banner on cloud template page
	Then 'Mind Mapping' template group card has changed location by X axis on cloud template page
	Then 'info-tooltip-type' dialog is displayed to User
	When User clicks 'GOT IT' button in 'info-tooltip-type' dialog
	Then 'info-tooltip-type' dialog is not displayed to User
	When User refresh page
	Then interactive tour banner is not displayed on the cloud template page