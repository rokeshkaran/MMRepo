@retry(2)
Feature: Tags
Check Tags functionality in Slides mode

Background: Pre-condition
	Given '1' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'Published Files' tab on file manager header page

@MindManager @Slides @Tags @QA @Staging @Prod @Qase[WEB-933] @Upd_Qase
Scenario: Check_that_tags_from_general_tag_group_correctly_displayed_cloud
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel
	Then 'Done' tag is displayed in 'FT4ST1' topic infobox
	When User clicks 'Done' tags in 'FT4ST1' topic infobox
	Then 'PanelPublished' side panel with 'Tags' header is displayed to the User

@MindManager @Slides @Tags @App_QA @App_Staging @App_Prod @Qase[WEB-933] @Upd_Qase
Scenario: Check_that_tags_from_general_tag_group_correctly_displayed
	When User clicks 'View' button in the 'General Tags.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel
	Then 'General Tag 1' tag is displayed in 'Main1' topic infobox
	Then 'General Tag 2' tag is displayed in 'Main1' topic infobox
	Then 'General Tag 3' tag is displayed in 'Main1' topic infobox
	When User clicks 'General Tag 1' tags in 'Main1' topic infobox
	Then 'PanelPublished' side panel with 'Tags' header is displayed to the User
	Then 'General Tag 1' item is displayed in 'General Tags' section of 'PanelPublished' side panel with 'Tags' header
	Then 'General Tag 2' item is displayed in 'General Tags' section of 'PanelPublished' side panel with 'Tags' header
	Then 'General Tag 3' item is displayed in 'General Tags' section of 'PanelPublished' side panel with 'Tags' header

@MindManager @Slides @Tags @QA @Staging @Prod @Qase[WEB-934] @Upd_Qase
Scenario: Check_that_tags_from_the_tag_groups_correctly_displayed_cloud
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel
	Then 'Tag #2' tag is displayed in 'FT4ST2' topic infobox
	When User clicks 'Tag #2' tags in 'FT4ST2' topic infobox
	Then 'PanelPublished' side panel with 'Tags' header is displayed to the User

@MindManager @Slides @Tags @App_QA @App_Staging @App_Prod @Qase[WEB-934] @Upd_Qase
Scenario: Check_that_tags_from_the_tag_groups_correctly_displayed
	When User clicks 'View' button in the 'Custom Tags.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel
	Then 'Custom 1' tag is displayed in 'Main1' topic infobox
	Then 'Custom 2' tag is displayed in 'Main1' topic infobox
	Then 'Custom 3' tag is displayed in 'Main1' topic infobox
	When User clicks 'Custom 1' tags in 'Main1' topic infobox
	Then 'PanelPublished' side panel with 'Tags' header is displayed to the User
	Then 'Custom 1' item is displayed in 'Custom Tags' section of 'PanelPublished' side panel with 'Tags' header
	Then 'Custom 2' item is displayed in 'Custom Tags' section of 'PanelPublished' side panel with 'Tags' header
	Then 'Custom 3' item is displayed in 'Custom Tags' section of 'PanelPublished' side panel with 'Tags' header

@MindManager @Slides @Tags @QA @Staging @Prod @Qase[WEB-936] @Upd_Qase
Scenario: Check_that_Multiple_tags_are_delineated_by_commas_cloud
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel
	Then 'Tag #2' tag is displayed in 'FT4ST2' topic infobox
	When User mouses over 'Tag #2' tag in 'FT4ST2' topic infobox
	Then 'Tag #2, Tag #3' tooltip is displayed to the User

@MindManager @Slides @Tags @App_QA @App_Staging @App_Prod @Qase[WEB-936] @Upd_Qase
Scenario: Check_that_Multiple_tags_are_delineated_by_commas
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel
	Then 'Tag #2' tag is displayed in 'FT4ST2' topic infobox
	When User mouses over 'Tag #2' tag in 'FT4ST2' topic infobox
	Then 'Tag #2, Tag #3' tooltip is displayed to the User

@MindManager @Slides @Tags @QA @Staging @Prod @Qase[WEB-937] @Upd_Qase
Scenario: Check_that_Full_name_of_the_tags_displayed_in_the_tooltip_cloud
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel
	Then 'Tag #2' tag is displayed in 'FT4ST2' topic infobox
	When User mouses over 'Tag #2' tag in 'FT4ST2' topic infobox
	Then 'Tag #2, Tag #3' tooltip is displayed to the User

@MindManager @Slides @Tags @App_QA @App_Staging @App_Prod @Qase[WEB-937] @Upd_Qase
Scenario: Check_that_that_Full_name_of_the_tags_displayed_in_the_tooltip
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel
	Then 'Tag #2' tag is displayed in 'FT4ST2' topic infobox
	When User mouses over 'Tag #2' tag in 'FT4ST2' topic infobox
	Then 'Tag #2, Tag #3' tooltip is displayed to the User

@MindManager @Slides @Tags @QA @Staging @Prod @Qase[WEB-938] @Upd_Qase
Scenario: Check_that_tag_text_is_displayed_in_the_default_font_cloud
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel
	Then 'Tag #2' tag is displayed in 'FT4ST2' topic infobox
	When User mouses over 'Tag #2' tag in 'FT4ST2' topic infobox
	Then 'Tag #2' Tag text is displayed 'Source Sans Pro' in font in 'FT4ST2' topic infobox

@MindManager @Slides @Tags @App_QA @App_Staging @App_Prod @Qase[WEB-938] @Upd_Qase
Scenario: Check_that_tag_text_is_displayed_in_the_default_font
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel
	Then 'Tag #2' tag is displayed in 'FT4ST2' topic infobox
	When User mouses over 'Tag #2' tag in 'FT4ST2' topic infobox
	Then 'Tag #2' Tag text is displayed 'Source Sans Pro' in font in 'FT4ST2' topic infobox

@MindManager @Slides @Tags @QA @Staging @Prod @Qase[WEB-939] @Upd_Qase
Scenario: Check_that_tags_color_is_correctly_displayed_cloud
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel
	Then 'Done' Tag is displayed to the 'rgba(0, 0, 0, 0)' color in 'FT4ST1' topic infobox
	Then 'Done' Tag text is displayed to the 'rgb(51, 51, 51)' color in 'FT4ST1' topic infobox

@MindManager @Slides @Tags @App_QA @App_Staging @App_Prod @Qase[WEB-939] @Upd_Qase
Scenario: Check_that_tags_color_is_correctly_displayed
	When User clicks 'View' button in the 'Slide.mdeck' row of Published Files table
	When User switches to '1' tab
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	When tutorial card is set to 'true' on navigation panel
	Then 'Done' Tag is displayed to the 'rgba(0, 0, 0, 0)' color in 'FT4ST1' topic infobox
	Then 'Done' Tag text is displayed to the 'rgb(51, 51, 51)' color in 'FT4ST1' topic infobox