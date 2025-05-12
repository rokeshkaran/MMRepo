@retry(2)
Feature: DragAndDropTopicLinks
Check the functionality of drag and drop links from topic infobox

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

@MindManager @NewTopicInfoboxUI @DragAndDropTopicLinks @App_QA @App_Staging @App_Prod @Cleanup @Upd_Qase @JIRA[MMCV-6739]
Scenario: Drag_and_drop_link_from_topic_with_multiple_links
	Then 'www.facebook.com' link icon with 'Facebook' link title is displayed to the 'MultiLinks' topic infobox
	Then 'www.youtube.com' link icon with 'YouTube' link title is displayed to the 'MultiLinks' topic infobox
	Then 'www.google.com' link icon with 'Google' link title is displayed to the 'MultiLinks' topic infobox
	When User drag 'www.facebook.com' link icon with 'Facebook' link title from 'MultiLinks' topic on 'ImageTopic2' topic
	Then 'www.facebook.com' link icon with 'Facebook' link title is displayed to the 'ImageTopic2' topic infobox
	Then 'www.youtube.com' link icon with 'YouTube' link title is not displayed to the 'ImageTopic2' topic infobox
	Then 'www.google.com' link icon with 'Google' link title is not displayed to the 'ImageTopic2' topic infobox