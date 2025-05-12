@retry(2)
Feature: TopicAuthorDetails
A short summary of the Author Detail

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath               |
		| auto_test_SRND.mmap | TopicAuthorDetail.mmap |
	Given User with 'authordetail@gmail.com' email and 'authordetail_08' password is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @NewTopicInfoboxUI @TopicAuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2507] @Upd_Qase
Scenario: To_verify_that_Author_Details_options_are_available_in_General_settings
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	Then 'Author Details' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Creator' checkbox is disable in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Creator' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Created Date & Time' checkbox is disable in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Created Date & Time' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modifier' checkbox is disable in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modifier' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modified Date & Time' checkbox is disable in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modified Date & Time' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen

@MindManager @NewTopicInfoboxUI @TopicAuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2515] @Upd_Qase
Scenario: To_verify_that_Author_Details_attributes_is_always_append_at_the_end_of_other_topic_attributes_in_the_topic_info_box
	When User clicks 'Test' topic on Canvas
	Then 'Test' is outlined with a blue circuit
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	When User checks 'Author Details' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Author Details' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Creator' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Created Date & Time' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modifier' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modified Date & Time' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then Web Editor page is displayed to the User
	Then 'Kreshen Amourdon, 2/14/2025' author details is with icon 'topic_info_icon_creator.svg' is displayed in 'Test' topic infobox
	Then 'creator' author details is displayed in 'Test' topic infobox
	Then 'Kreshen Amourdon, 2/14/2025' author details is with icon 'topic_info_icon_modificator.svg' is displayed in 'Test' topic infobox
	Then 'modificator' author details is displayed in 'Test' topic infobox
	Then 'Kreshen Amourdon, 2/14/2025' author details is with icon 'topic_info_icon_creator.svg' is displayed in 'Central Topic' topic infobox
	Then 'Kreshen Amourdon, 2/14/2025' author details is with icon 'topic_info_icon_creator.svg' is displayed in 'Main Topic' topic infobox
	Then 'Kreshen Amourdon, 2/14/2025' author details is with icon 'topic_info_icon_creator.svg' is displayed in 'Subtopic' topic infobox

@MindManager @NewTopicInfoboxUI @TopicAuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2518] @Upd_Qase
Scenario: To_verify_that_last_modifier_name_is_displayed_in_Topic_info_box_when_Author_Details_Last_Modifier_is_checked_in_the_General_settings
	When User clicks 'Test' topic on Canvas
	Then 'Test' is outlined with a blue circuit
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	When User checks 'Author Details' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Author Details' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Creator' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Created Date & Time' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modifier' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modified Date & Time' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User unchecks 'Creator' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	When User unchecks 'Created Date & Time' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	When User unchecks 'Last Modified Date & Time' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modifier' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then Web Editor page is displayed to the User
	Then 'Kreshen Amourdon' author details is with icon 'topic_info_icon_modificator.svg' is displayed in 'Test' topic infobox
	Then 'modificator' author details is displayed in 'Test' topic infobox
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	When User unchecks 'Last Modifier' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modifier' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then Web Editor page is displayed to the User
	Then 'modificator' author details is not displayed in 'Test' topic infobox

@MindManager @NewTopicInfoboxUI @TopicAuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2519] @Upd_Qase
Scenario: To_verify_that_last_modifier_name_is_displayed_in_Topic_info_box_when_Author_Details_Last_Modifier_is_checked_in_the_General_settings_email
	When User clicks 'OnlyEmail' topic on Canvas
	Then 'OnlyEmail' is outlined with a blue circuit
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	When User checks 'Author Details' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Author Details' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Creator' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Created Date & Time' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modifier' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modified Date & Time' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User unchecks 'Creator' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	When User unchecks 'Created Date & Time' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	When User unchecks 'Last Modified Date & Time' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modifier' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then Web Editor page is displayed to the User
	Then 'authordetail@gmail.com' author details is with icon 'topic_info_icon_modificator.svg' is displayed in 'OnlyEmail' topic infobox
	Then 'modificator' author details is displayed in 'OnlyEmail' topic infobox
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	When User unchecks 'Last Modifier' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modifier' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then Web Editor page is displayed to the User
	Then 'modificator' author details is not displayed in 'OnlyEmail' topic infobox

@MindManager @NewTopicInfoboxUI @TopicAuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2522] @Upd_Qase
Scenario: To_verify_that_creator_name_is_displayed_in_Topic_info_box_when_Author_Details_Creator_is_checked_in_the_General_settings_email
	When User clicks 'OnlyEmail' topic on Canvas
	Then 'OnlyEmail' is outlined with a blue circuit
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	When User checks 'Author Details' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Author Details' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Creator' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Created Date & Time' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modifier' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modified Date & Time' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User unchecks 'Created Date & Time' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	When User unchecks 'Last Modifier' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	When User unchecks 'Last Modified Date & Time' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Creator' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then Web Editor page is displayed to the User
	Then 'authordetail@gmail.com' author details is with icon 'topic_info_icon_creator.svg' is displayed in 'OnlyEmail' topic infobox
	Then 'creator' author details is displayed in 'OnlyEmail' topic infobox
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	When User unchecks 'Creator' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Creator' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then Web Editor page is displayed to the User
	Then 'creator' author details is not displayed in 'OnlyEmail' topic infobox

@MindManager @NewTopicInfoboxUI @TopicAuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2523] @Upd_Qase
Scenario: To_verify_that_creator_name_is_displayed_in_Topic_info_box_when_Author_Details_Creator_is_checked_in_the_General_settings
	When User clicks 'Test' topic on Canvas
	Then 'Test' is outlined with a blue circuit
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	When User checks 'Author Details' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Author Details' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Creator' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Created Date & Time' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modifier' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modified Date & Time' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User unchecks 'Created Date & Time' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	When User unchecks 'Last Modifier' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	When User unchecks 'Last Modified Date & Time' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Creator' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then Web Editor page is displayed to the User
	Then 'Kreshen Amourdon' author details is with icon 'topic_info_icon_creator.svg' is displayed in 'Test' topic infobox
	Then 'creator' author details is displayed in 'Test' topic infobox
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	When User unchecks 'Creator' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Creator' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then Web Editor page is displayed to the User
	Then 'creator' author details is not displayed in 'Test' topic infobox

@MindManager @NewTopicInfoboxUI @TopicAuthorDetails @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2524] @Upd_Qase
Scenario: To_verify_that_Author_Details_can_be_enabled_or_disabled_in_the_General_settings
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	Then 'Author Details' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Creator' checkbox is disable in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Creator' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Created Date & Time' checkbox is disable in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Created Date & Time' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modifier' checkbox is disable in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modifier' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modified Date & Time' checkbox is disable in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modified Date & Time' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User checks 'Author Details' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Author Details' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Creator' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Created Date & Time' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modifier' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modified Date & Time' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User unchecks 'Author Details' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Creator' checkbox is disable in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Creator' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Created Date & Time' checkbox is disable in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Created Date & Time' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modifier' checkbox is disable in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modifier' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modified Date & Time' checkbox is disable in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Last Modified Date & Time' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen