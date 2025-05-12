@retry(2)
Feature: CardModePublishedFile

Background: Pre-condition
	Given User uploads following publish files via Api
		| Name           | PublishFile                  |
		| auto_test_SRND | CardModeDefaultBehavior.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	Then file manager header page is displayed to User
	When User clicks 'View' button in row with 'auto_test_SRND' file name of Published Files table
	When User switches to '1' tab
	Then Web Editor page is displayed to the User
	Then Menu toolbar is displayed to Presentation mode
	
@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2102] @Upd_Qase
Scenario: Verify_that_topics_in_Card_Mode_are_displayed_correctly_on_published_map
	Then 'topic_info_icon_image.svg' Image Icon is displayed to the 'Floating Topic' Topic infobox
	Then 'Priority 2' Icon is displayed to the 'Floating Topic' Topic infobox
	Then Only topic name is displayed in 'Floating Topic' topic on Canvas
	Then 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Floating Topic' Topic infobox with Y value '0'
	Then 'percentageDone05.svg' Icon with value '50% done' is displayed to the 'Floating Topic' Topic infobox with Y value '0'
	Then 'arrow-right.svg' Icon with value 'Right' is displayed to the 'Floating Topic' Topic infobox with Y value '0'
	