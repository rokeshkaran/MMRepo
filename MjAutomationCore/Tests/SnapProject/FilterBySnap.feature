@retry(2)
Feature: FilterBySnap

Using Fitler option in snap 

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given '1' User is logged into MindManager web app via Api
	When '1' User upload capture item via Api
		| Type       | Source           | Text                          | Link                    | Note        | Item | File                               |
		| link       | MindManager Snap | automation_bookmark_1#_SRND   | https://www.google.com/ |             |      |                                    |
		| link       | MindManager Snap | automation_bookmark_2#_SRND   | https://www.google.com/ |             |      |                                    |
		| attachment | MindManager Snap | image_file_attachment_1#_SRND |                         |             |      | FruitImages.jpg                    |
		| attachment | MindManager Snap | image_file_attachment_2#_SRND |                         |             |      | FruitImages.jpg                    |
		| attachment | MindManager Snap | text_file_attachment_1#_SRND  |                         |             |      | Automatic License Provisioning.txt |
		| attachment | MindManager Snap | text_file_attachment_2#_SRND  |                         |             |      | Automatic License Provisioning.txt |
		| mappart    | MindManager Snap | automation_mappart_1#_SRND    |                         |             |      | Business profile info.mmap         |
		| mappart    | MindManager Snap | automation_mappart_2#_SRND    |                         |             |      | Business profile info.mmap         |
		| text       | MindManager Snap | test_notes_1#_SRND            |                         | test notes  |      |                                    |
		| text       | MindManager Snap | test_notes_2#_SRND            |                         | test notes2 |      |                                    |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle              |
		| automation_bookmark_1#_SRND   |
		| automation_bookmark_2#_SRND   |
		| image_file_attachment_1#_SRND |
		| image_file_attachment_2#_SRND |
		| text_file_attachment_1#_SRND  |
		| text_file_attachment_2#_SRND  |
		| automation_mappart_1#_SRND    |
		| automation_mappart_2#_SRND    |
		| test_notes_1#_SRND            |
		| test_notes_2#_SRND            |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-144]
Scenario: To_verify_that_user_can_filter_snaps_by_Map_part_in_the_Snap_Filter
	When User clicks 'Filter' button on Snap panel
	Then filter tab is displayed on Snap panel
	When User checks checkbox with label 'Map Part' in 'FilterMenuElement' container
	Then checkbox by label 'Map Part' is checked in 'FilterMenuElement' container
	Then '1' type of 'filter' items is displayed on 'Filter' button in capture queue buttons dropdown
	Then following capture items are displayed in Snap panel:
		| captureItemTitle           |
		| automation_mappart_1#_SRND |
		| automation_mappart_2#_SRND |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-145]
Scenario: To_verify_that_the_user_can_filter_snaps_by_Image_in_the_Snap_Filter
	When User clicks 'Filter' button on Snap panel
	Then filter tab is displayed on Snap panel
	When User checks checkbox with label 'Image' in 'FilterMenuElement' container
	Then checkbox by label 'Image' is checked in 'FilterMenuElement' container
	Then '1' type of 'filter' items is displayed on 'Filter' button in capture queue buttons dropdown
	Then following capture items are displayed in Snap panel:
		| captureItemTitle              |
		| image_file_attachment_1#_SRND |
		| image_file_attachment_2#_SRND |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-146]
Scenario: To_verify_that_the_user_can_filter_snaps_by_Bookmark_in_the_Snap_Filter
	When User clicks 'Filter' button on Snap panel
	Then filter tab is displayed on Snap panel
	When User checks checkbox with label 'Bookmark' in 'FilterMenuElement' container
	Then checkbox by label 'Bookmark' is checked in 'FilterMenuElement' container
	Then '1' type of 'filter' items is displayed on 'Filter' button in capture queue buttons dropdown
	Then following capture items are displayed in Snap panel:
		| captureItemTitle            |
		| automation_bookmark_1#_SRND |
		| automation_bookmark_2#_SRND |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-147]
Scenario: To_verify_that_the_user_can_filter_snaps_by_Attachment_in_the_Snap_Filter
	When User clicks 'Filter' button on Snap panel
	Then filter tab is displayed on Snap panel
	When User checks checkbox with label 'Attachment' in 'FilterMenuElement' container
	Then checkbox by label 'Attachment' is checked in 'FilterMenuElement' container
	Then '1' type of 'filter' items is displayed on 'Filter' button in capture queue buttons dropdown
	Then following capture items are displayed in Snap panel:
		| captureItemTitle             |
		| text_file_attachment_1#_SRND |
		| text_file_attachment_2#_SRND |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-148]
Scenario: To_verify_that_the_user_can_filter_snaps_by_Text_Note_in_the_Snap_Filter
	When User clicks 'Filter' button on Snap panel
	Then filter tab is displayed on Snap panel
	When User checks checkbox with label 'Text Note' in 'FilterMenuElement' container
	Then checkbox by label 'Text Note' is checked in 'FilterMenuElement' container
	Then '1' type of 'filter' items is displayed on 'Filter' button in capture queue buttons dropdown
	Then following capture items are displayed in Snap panel:
		| captureItemTitle   |
		| test_notes_1#_SRND |
		| test_notes_2#_SRND |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-150]
Scenario: To_verify_that_hidden_buttons_are_displayed_after_clicking_the_More_Ellipsis_button
	When User clicks 'Options' button on Snap panel
	Then 'Snap' side panel with 'Options' header is displayed to the User
	When User clicks 'Trash All' button on Snap panel
	When User moves Side panel resizable handle by '20' '0' coordinates
	Then 'Show Buttons' button is displayed on Snap panel
	When User clicks 'Show Buttons' button on Snap panel
	Then 'Open Search' button is displayed on Snap panel
	Then 'Refresh' button is displayed on Snap panel
	Then 'Options' button is displayed on Snap panel
	Then '10' number of 'trash' items is displayed on 'Open Trash' button in capture queue buttons dropdown

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-151]
Scenario: To_verify_that_it_is_possible_to_filter_snaps_by_selecting_different_Snap_types_in_the_Snap_Filter
	When User clicks 'Filter' button on Snap panel
	Then filter tab is displayed on Snap panel
	When User checks checkbox with label 'Attachment' in 'FilterMenuElement' container
	Then checkbox by label 'Attachment' is checked in 'FilterMenuElement' container
	Then '1' type of 'filter' items is displayed on 'Filter' button in capture queue buttons dropdown
	When User checks checkbox with label 'Bookmark' in 'FilterMenuElement' container
	Then checkbox by label 'Bookmark' is checked in 'FilterMenuElement' container
	Then '2' type of 'filter' items is displayed on 'Filter' button in capture queue buttons dropdown
	Then following capture items are displayed in Snap panel:
		| captureItemTitle             |
		| text_file_attachment_1#_SRND |
		| text_file_attachment_2#_SRND |
		| automation_bookmark_1#_SRND  |
		| automation_bookmark_2#_SRND  |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-152]
Scenario: To_verify_that_user_can_remove_all_filters
	When User clicks 'Filter' button on Snap panel
	Then filter tab is displayed on Snap panel
	When User checks checkbox with label 'Map Part' in 'FilterMenuElement' container
	Then '1' type of 'filter' items is displayed on 'Filter' button in capture queue buttons dropdown
	When User checks checkbox with label 'Image' in 'FilterMenuElement' container
	Then '2' type of 'filter' items is displayed on 'Filter' button in capture queue buttons dropdown
	When User checks checkbox with label 'Attachment' in 'FilterMenuElement' container
	Then '3' type of 'filter' items is displayed on 'Filter' button in capture queue buttons dropdown
	Then checkbox by label 'Map Part' is checked in 'FilterMenuElement' container
	Then checkbox by label 'Image' is checked in 'FilterMenuElement' container
	Then checkbox by label 'Attachment' is checked in 'FilterMenuElement' container
	Then following capture items are displayed in Snap panel:
		| captureItemTitle              |
		| automation_mappart_1#_SRND    |
		| automation_mappart_2#_SRND    |
		| image_file_attachment_1#_SRND |
		| image_file_attachment_2#_SRND |
		| text_file_attachment_1#_SRND  |
		| text_file_attachment_2#_SRND  |
	When User clear all filter on Snap panel
	Then following capture items are displayed in Snap panel:
		| captureItemTitle              |
		| automation_bookmark_1#_SRND   |
		| automation_bookmark_2#_SRND   |
		| image_file_attachment_1#_SRND |
		| image_file_attachment_2#_SRND |
		| text_file_attachment_1#_SRND  |
		| text_file_attachment_2#_SRND  |
		| automation_mappart_1#_SRND    |
		| automation_mappart_2#_SRND    |
		| test_notes_1#_SRND            |
		| test_notes_2#_SRND            |
	Then checkbox by label 'Map Part' is unchecked in 'FilterMenuElement' container
	Then checkbox by label 'Image' is unchecked in 'FilterMenuElement' container
	Then checkbox by label 'Attachment' is unchecked in 'FilterMenuElement' container