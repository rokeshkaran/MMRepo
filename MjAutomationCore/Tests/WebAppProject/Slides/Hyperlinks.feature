@retry(2)
Feature: Hyperlinks
Check Hyperlinks functionality in Slides mode

Background: Pre-condition
	Given '1' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Published Files' tab on file manager header page

@MindManager @Slides @Hyperlinks @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-979] @Upd_Qase @Cleanup
Scenario: Hover_over_the_topic_with_two_or_more_hyperlinks
	When User clicks 'View' button in the 'Hyperlink.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	Then 'Google' Link title is displayed to the 'MultipleLinkTopic' topic infobox
	Then 'Facebook' Link title is displayed to the 'MultipleLinkTopic' topic infobox
	Then 'Youtube' Link title is displayed to the 'MultipleLinkTopic' topic infobox
	When User hovers cursor the 'MultipleLinkTopic' topic
	Then tooltip is not displayed to the User

@MindManager @Slides @Hyperlinks @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-979] @Upd_Qase @Cleanup @JIRA[MMCV-10472]
Scenario: Click_on_topic_with_two_or_more_hyperlinks
	When User clicks 'View' button in the 'Hyperlink.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	Then 'Google' Link title is displayed to the 'MultipleLinkTopic' topic infobox
	Then 'Facebook' Link title is displayed to the 'MultipleLinkTopic' topic infobox
	Then 'Youtube' Link title is displayed to the 'MultipleLinkTopic' topic infobox
	When User clicks 'MultipleLinkTopic' topic on Canvas
	Then 'MultipleLinkTopic' is outlined with a blue circuit
	Then 'PanelPublished' side panel with 'Attachments & Links' header is displayed to the User
	Then 'Google' item is displayed in 'Links' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'Facebook' item is displayed in 'Links' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'Youtube' item is displayed in 'Links' section of 'PanelPublished' side panel with 'Attachments & Links' header

@MindManager @Slides @Hyperlinks @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-979] @Upd_Qase @Cleanup @JIRA[MMCV-10472]
Scenario: Hover_over_the_links_in_side_menu
	When User clicks 'View' button in the 'Hyperlink.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When User clicks 'MultipleLinkTopic' topic on Canvas
	Then 'MultipleLinkTopic' is outlined with a blue circuit
	Then 'PanelPublished' side panel with 'Attachments & Links' header is displayed to the User
	When User mouses over 'Google' item in 'Links' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'http://www.google.com' tooltip is displayed to the User

@MindManager @Slides @Hyperlinks @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-979] @Upd_Qase @Cleanup @JIRA[MMCV-10472]
Scenario: Click_on_one_of_the_links_in_side_menu
	When User clicks 'View' button in the 'Hyperlink.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When User clicks 'MultipleLinkTopic' topic on Canvas
	Then 'MultipleLinkTopic' is outlined with a blue circuit
	Then 'PanelPublished' side panel with 'Attachments & Links' header is displayed to the User
	When User clicks 'Facebook' item in 'Links' section of 'PanelPublished' side panel with 'Attachments & Links' header
	When User switches to '2' tab
	Then page url is 'https://www.facebook.com/'

@MindManager @Slides @Hyperlinks @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-980] @Upd_Qase @Cleanup
Scenario: Observe_topic_with_one_hyperlink
	When User clicks 'View' button in the 'hyperlinkstopics.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	Then 'icon-hyperlinks-topic-link' link icon with 'Test' link title is displayed to the 'Topic 1' topic infobox

@MindManager @Slides @Hyperlinks @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-980] @Upd_Qase @Cleanup
Scenario: Click_on_relationship_topic_icon_with_one_hyperlink
	When User clicks 'View' button in the 'hyperlinkstopics.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	Then 'Test' Link title is displayed to the 'Topic 1' topic infobox
	When User clicks Hyperlinks icon in 'Topic 1' topic infobox
	Then 'Test' is outlined with a blue circuit
	Then 'PanelPublished' side panel with 'Attachments & Links' header is displayed to the User

@MindManager @Slides @Hyperlinks @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-980] @Upd_Qase @Cleanup
Scenario: Observe_topic_with_two_hyperlink
	When User clicks 'View' button in the 'hyperlinkstopics.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	Then 'Topic 4' Link title is displayed to the 'Topic 2' topic infobox
	Then 'Subtopic  M4' Link title is displayed to the 'Topic 2' topic infobox

@MindManager @Slides @Hyperlinks @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-980] @Upd_Qase @Cleanup
Scenario: Click_on_topic_with_two_hyperlinks_to_different_topics
	When User clicks 'View' button in the 'hyperlinkstopics.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When User clicks 'Topic 2' topic on Canvas
	Then 'Topic 2' is outlined with a blue circuit
	Then 'PanelPublished' side panel with 'Attachments & Links' header is displayed to the User
	Then 'Topic 4' item is displayed in 'Related Topics' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'Subtopic M4' item is displayed in 'Related Topics' section of 'PanelPublished' side panel with 'Attachments & Links' header

@MindManager @Slides @Hyperlinks @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-980] @Upd_Qase @Cleanup @JIRA[MMCV-10472]
Scenario: Click_on_any_linked_topic_on_the_list_on_the_side_panel
	When User clicks 'View' button in the 'hyperlinkstopics.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When User clicks 'Topic 2' topic on Canvas
	Then 'Topic 2' is outlined with a blue circuit
	Then 'PanelPublished' side panel with 'Attachments & Links' header is displayed to the User
	Then 'Topic 4' item is displayed in 'Related Topics' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'Subtopic M4' item is displayed in 'Related Topics' section of 'PanelPublished' side panel with 'Attachments & Links' header
	When User clicks 'Subtopic M4' item in 'Related Topics' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'Subtopic M4' is outlined with a blue circuit

@MindManager @Slides @Hyperlinks @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-980] @Upd_Qase @Cleanup
Scenario: Observe_topic_with_URLhyperlink_and_hyperlink_to_topic
	When User clicks 'View' button in the 'hyperlinkstopics.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When User waits '500' miliseconds
	Then 'favicon' link icon with 'Visualize with MindManager' link title is displayed to the 'Combined Hyperlinks' topic infobox
	Then 'icon-hyperlinks-topic-link' link icon with 'Topic 2' link title is displayed to the 'Combined Hyperlinks' topic infobox

@MindManager @Slides @Hyperlinks @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-980] @Upd_Qase @Cleanup @JIRA[MMCV-10472]
Scenario: Click_on_topic_with_URLhyperlink_and_hyperlink_to_topic
	When User clicks 'View' button in the 'hyperlinkstopics.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When User clicks 'Combined Hyperlinks' topic on Canvas
	Then 'Combined Hyperlinks' is outlined with a blue circuit
	Then 'PanelPublished' side panel with 'Attachments & Links' header is displayed to the User
	Then 'Visualize with MindManager' item is displayed in 'Links' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'Topic 2' item is displayed in 'Related Topics' section of 'PanelPublished' side panel with 'Attachments & Links' header

@MindManager @Slides @Hyperlinks @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-980] @Upd_Qase @Cleanup @JIRA[MMCV-10472]
Scenario: Click_on_the_Linked_topic_button_on_the_side_panel
	When User clicks 'View' button in the 'hyperlinkstopics.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When User clicks 'Combined Hyperlinks' topic on Canvas
	Then 'Combined Hyperlinks' is outlined with a blue circuit
	Then 'PanelPublished' side panel with 'Attachments & Links' header is displayed to the User
	Then 'Visualize with MindManager' item is displayed in 'Links' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'Topic 2' item is displayed in 'Related Topics' section of 'PanelPublished' side panel with 'Attachments & Links' header
	When User clicks 'Topic 2' item in 'Related Topics' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'Topic 2' is outlined with a blue circuit
	Then 'PanelPublished' side panel with 'Attachments & Links' header is displayed to the User
	Then 'Topic 4' item is displayed in 'Related Topics' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'Subtopic M4' item is displayed in 'Related Topics' section of 'PanelPublished' side panel with 'Attachments & Links' header