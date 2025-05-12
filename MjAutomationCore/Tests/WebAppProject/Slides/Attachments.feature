@retry(2)
Feature: Attachments
Verify Attachment in topic infobox

Background: Pre-condition
	Given '1' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Published Files' tab on file manager header page

@MindManager @Slides @Attachments @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-981] @Upd_Qase @Cleanup @JIRA[MMCV-4111]
Scenario: To_verify_the_image_attachments_interaction_and_UI
	When User clicks 'View' button in the 'imageattachments.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When User clicks 'Topic with multiple attachments' topic on Canvas
	Then 'Topic with multiple attachments' is outlined with a blue circuit
	Then 'Image1.bmp' attachment filename is displayed to the 'Topic with multiple attachments' topic infobox
	Then 'Image2.emf' attachment filename is displayed to the 'Topic with multiple attachments' topic infobox
	Then 'Image3.wmf' attachment filename is displayed to the 'Topic with multiple attachments' topic infobox
	Then 'Image4.gif' attachment filename is displayed to the 'Topic with multiple attachments' topic infobox
	Then 'Image5.jpeg' attachment filename is displayed to the 'Topic with multiple attachments' topic infobox
	Then 'Image6.jpg' attachment filename is displayed to the 'Topic with multiple attachments' topic infobox
	Then 'Image7.pcx' attachment filename is displayed to the 'Topic with multiple attachments' topic infobox
	Then 'Image8.png' attachment filename is displayed to the 'Topic with multiple attachments' topic infobox
	When tutorial card is set to 'false' on navigation panel
	When User clicks on 'Image2.emf' attachment filename on 'Topic with multiple attachments' topic infobox
	Then 'Image2.emf' titlebar header is displayed in 'lightbox' dialog
	When User clicks 'btn-download' button in 'lightbox' dialog
	Then User checks that file 'Image2.emf' was downloaded

@MindManager @Slides @Attachments @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-982] @Upd_Qase @Cleanup @JIRA[MMCV-10100,MMCV-10472,MMCV-10582]
Scenario: To_verify_the_mmap_attachments_interaction_and_UI
	When User clicks 'View' button in the 'mmap_attachments.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When User clicks 'Central Topic' topic on Canvas
	Then 'Central Topic' is outlined with a blue circuit
	When User clicks 'Main Topic 3' topic on Canvas
	Then 'Main Topic 3' is outlined with a blue circuit
	When tutorial card is set to 'false' on navigation panel
	Then 'Eisenhower.mmap' item is displayed in 'Attachments' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'FiveforcesAnalysis.mmap' item is displayed in 'Attachments' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'FreeForm.mmap' item is displayed in 'Attachments' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'VennDiagram.mmap' item is displayed in 'Attachments' section of 'PanelPublished' side panel with 'Attachments & Links' header
	When User mouses over 'FreeForm.mmap' attachment filename on 'Main Topic 3' topic infobox
	Then 'FreeForm.mmapCreated: 04/20/2023 10:40:10 AMModified: 02/09/2023 01:32:49 PMSize: 974 KB' tooltip is displayed to the User
	When User clicks on 'VennDiagram.mmap' attachment filename on 'Main Topic 3' topic infobox
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Map' view mode
	Then button with 'back-button-placeholder' name is displayed in 'OverlayPanelPageElement' container
	When User clicks button with 'back-button-placeholder' name in 'OverlayPanelPageElement' container
	Then map is displayed in 'Slide' view mode

@MindManager @Slides @Attachments @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-984] @Upd_Qase @Cleanup
Scenario: To_verify_the_attachment_tooltip
	When User clicks 'View' button in the 'AttachmentTooltip.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When User clicks 'Central Topic' topic on Canvas
	Then 'Central Topic' is outlined with a blue circuit
	When User mouses over 'Powerpoint.pptx' attachment filename on 'Main Topic 1' topic infobox
	Then 'Powerpoint.pptxCreated: 04/20/2023 10:45:16 AMModified: 04/20/2023 10:46:32 AMSize: 36 KB' tooltip is displayed to the User

@MindManager @Slides @Attachments @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-985] @Upd_Qase @Cleanup @JIRA[MMCV-10472]
Scenario: To_verify_that_if_the_topic_contains_more_then_one_attachment_the_attachment_list_is_displayed
	When User clicks 'View' button in the 'Attachments.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When User clicks 'Main Topic 1' topic on Canvas
	Then 'Main Topic 1' is outlined with a blue circuit
	When tutorial card is set to 'false' on navigation panel
	Then 'WordDocum1.docx' item is displayed in 'Attachments' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'Powerpoint.pptx' item is displayed in 'Attachments' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then '3CircleVennDiagram.mmap' item is displayed in 'Attachments' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'Image1.bmp' item is displayed in 'Attachments' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'Image2.emf' item is displayed in 'Attachments' section of 'PanelPublished' side panel with 'Attachments & Links' header
	Then 'Image3.wmf' item is displayed in 'Attachments' section of 'PanelPublished' side panel with 'Attachments & Links' header

@MindManager @Slides @Attachments @QA @Staging @Prod @App_QA @App_Staging @App_Prod @Qase[WEB-986] @Upd_Qase @Cleanup @JIRA[MMCV-4111]
Scenario: You_have_the_map_with_attached_images_of_the_following_formats_opened_in_Slide_show_mode_bmp
	When User clicks 'View' button in the 'Download.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When User clicks 'Topic with multiple attachments' topic on Canvas
	Then 'Topic with multiple attachments' is outlined with a blue circuit
	When tutorial card is set to 'false' on navigation panel
	Then 'Image1.bmp' attachment filename is displayed to the 'Topic with multiple attachments' topic infobox
	Then 'Image2.emf' attachment filename is displayed to the 'Topic with multiple attachments' topic infobox
	Then 'Image3.wmf' attachment filename is displayed to the 'Topic with multiple attachments' topic infobox
	Then 'Image4.gif' attachment filename is displayed to the 'Topic with multiple attachments' topic infobox
	Then 'Image5.jpeg' attachment filename is displayed to the 'Topic with multiple attachments' topic infobox
	Then 'Image6.jpg' attachment filename is displayed to the 'Topic with multiple attachments' topic infobox
	Then 'Image7.pcx' attachment filename is displayed to the 'Topic with multiple attachments' topic infobox
	Then 'Image8.png' attachment filename is displayed to the 'Topic with multiple attachments' topic infobox
	When User clicks on 'Image2.emf' attachment filename on 'Topic with multiple attachments' topic infobox
	Then 'Image2.emf' titlebar header is displayed in 'lightbox' dialog
	When User clicks 'btn-download' button in 'lightbox' dialog
	Then User checks that file 'Image2.emf' was downloaded