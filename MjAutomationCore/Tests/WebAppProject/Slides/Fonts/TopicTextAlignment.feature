@retry(2)
Feature: TopicTextAlignment
Verify text style alignment

Background: Pre-condition
	Given User is logged into MindManager web app via Api

@MindManager @MindManagerCloud @TopicTextAlignment @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-994] @Upd_Qase
Scenario: Verify_that_topic_formatting_text_style_left_align
	Given User uploads following publish files via Api
		| Name                 | PublishFile         |
		| auto_test_SRND.mdeck | LeftTextAlign.mdeck |
	And Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND.mdeck' published file via Api
	And User clicks 'Published Files' tab on file manager header page
	And User clicks 'View' button in row with 'auto_test_SRND.mdeck' file name of Published Files table
	And User switches to '1' tab
	Then Web Editor page is displayed to the User
	And Topic with text 'Winter Wonderland:' is aligned 'left' on Canvas
	And Topic with text 'Hit the slopes for skiing or snowboarding in destinations like Aspen, Whistler, or the Swiss Alps.' is aligned 'left' on Canvas
	And Topic with text 'Island Paradise:Stay in overwater bungalows or beachfront villas with stunning ocean views.' is aligned 'left' on Canvas
	And Topic with text 'Stay in overwater bungalows or beachfront villas with stunning ocean views.' is aligned 'left' on Canvas

@MindManager @MindManagerCloud @TopicTextAlignment @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-995] @Upd_Qase
Scenario: Verify_that_topic_formatting_text_style_center_align
	Given User uploads following publish files via Api
		| Name                 | PublishFile       |
		| auto_test_SRND.mdeck | CenterAlign.mdeck |
	And Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND.mdeck' published file via Api
	And User clicks 'Published Files' tab on file manager header page
	And User clicks 'View' button in row with 'auto_test_SRND.mdeck' file name of Published Files table
	And User switches to '1' tab
	Then Web Editor page is displayed to the User
	And Topic with text 'this is a test' is aligned 'center' on Canvas
	And Topic with text 'the weather is fine outside' is aligned 'center' on Canvas
	And Topic with text 'Let's go to beach and swim' is aligned 'center' on Canvas

@MindManager @MindManagerCloud @TopicTextAlignment @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-996] @Upd_Qase
Scenario: Verify_that_topic_formatting_text_style_right_align
	Given User uploads following publish files via Api
		| Name                 | PublishFile      |
		| auto_test_SRND.mdeck | RightAlign.mdeck |
	And Add options to publish update request
		| Mode         |
		| presentation |
	When User performs publish update request for 'auto_test_SRND.mdeck' published file via Api
	And User clicks 'Published Files' tab on file manager header page
	And User clicks 'View' button in row with 'auto_test_SRND.mdeck' file name of Published Files table
	And User switches to '1' tab
	Then Web Editor page is displayed to the User
	And Topic with text 'this is a test' is aligned 'right' on Canvas
	And Topic with text 'the weather is fine outside' is aligned 'right' on Canvas
	And Topic with text 'Let's go to beach and swim' is aligned 'right' on Canvas