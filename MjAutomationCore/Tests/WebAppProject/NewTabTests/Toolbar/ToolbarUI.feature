@retry(2)
Feature: ToolbarUI
Check functionality Toolbar

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

@MindManager @Toolbar @ToolbarUI @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1177,WEB-1363] @Upd_Qase
Scenario: Check_the_default_toolbar_state
	Then Tools panel is displayed in 'top' side on page
	Then following buttons are displayed on the Top Toolbar:
		| buttons             |
		| Undo                |
		| Redo                |
		| Paste               |
		| Cut                 |
		| Copy                |
		| Format painter      |
		| Font format         |
		| Add topic           |
		| Add subtopic        |
		| Add floating topic  |
		| Add sticky note     |
		| Add callout         |
		| Add relationship    |
		| Add boundary        |
		| Topic Shape         |
		| Colors              |
		| Insert Shape        |
		| Insert Smart Shape  |
		| Insert Image        |
		| Insert Text Box     |
		| Set Default Style   |
		| Delete              |
		| Share               |
		| Tool Panel Settings |
	When User mouse over to the 'Undo' button on Tool panel
	Then 'Undo' tooltip is displayed to the User
	When User mouse over to the 'Redo' button on Tool panel
	Then 'Redo' tooltip is displayed to the User
	When User mouse over to the 'Paste' button on Tool panel
	Then 'Paste' tooltip is displayed to the User
	When User mouse over to the 'Cut' button on Tool panel
	Then 'Cut' tooltip is displayed to the User
	When User mouse over to the 'Copy' button on Tool panel
	Then 'Copy' tooltip is displayed to the User
	When User mouse over to the 'Format painter' button on Tool panel
	Then 'Format painter' tooltip is displayed to the User
	When User mouse over to the 'Font format' button on Tool panel
	Then 'Font format' tooltip is displayed to the User
	When User mouse over to the 'Add topic' button on Tool panel
	Then 'Add topic' tooltip is displayed to the User
	When User mouse over to the 'Add subtopic' button on Tool panel
	Then 'Add subtopic' tooltip is displayed to the User
	When User mouse over to the 'Add floating topic' button on Tool panel
	Then 'Add floating topic' tooltip is displayed to the User
	When User mouse over to the 'Add sticky note' button on Tool panel
	Then 'Add sticky note' tooltip is displayed to the User
	When User mouse over to the 'Add callout' button on Tool panel
	Then 'Add callout' tooltip is displayed to the User
	When User mouse over to the 'Add relationship' button on Tool panel
	Then 'Add relationship' tooltip is displayed to the User
	When User mouse over to the 'Add boundary' button on Tool panel
	Then 'Add boundary' tooltip is displayed to the User
	When User mouse over to the 'Topic Shape' button on Tool panel
	Then 'Topic Shape' tooltip is displayed to the User
	When User mouse over to the 'Colors' button on Tool panel
	Then 'Colors' tooltip is displayed to the User
	When User mouse over to the 'Insert Shape' button on Tool panel
	Then 'Insert Shape' tooltip is displayed to the User
	When User mouse over to the 'Insert Smart Shape' button on Tool panel
	Then 'Insert Smart Shape' tooltip is displayed to the User
	When User mouse over to the 'Insert Image' button on Tool panel
	Then 'Insert Image' tooltip is displayed to the User
	When User mouse over to the 'Insert Text Box' button on Tool panel
	Then 'Insert Text Box' tooltip is displayed to the User
	When User mouse over to the 'Set Default Style' button on Tool panel
	Then 'Set Default Style' tooltip is displayed to the User
	When User mouse over to the 'Delete' button on Tool panel
	Then 'Delete' tooltip is displayed to the User
	When User mouse over to the 'Share' button on Tool panel
	Then 'Share' tooltip is displayed to the User
	When User mouse over to the 'Tool Panel Settings' button on Tool panel
	Then 'Tool Panel Settings' tooltip is displayed to the User

@MindManager @Toolbar @ToolbarUI @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1178] @Upd_Qase
Scenario: Check_that_the_toolbar_location_can_be_customized
	Then Tools panel is displayed in 'top' side on page
	When User clicks 'Tool Panel Settings' button on Tools panel
	Then following items is displayed in 'toolpanel-settings' dropdown menu
		| item   |
		| Left   |
		| Top    |
		| Bottom |
	Then 'Top' item is displayed as selected in 'toolpanel-settings' dropdown menu
	When User clicks 'Bottom' item in 'toolpanel-settings' dropdown menu
	Then Tools panel is displayed in 'bottom' side on page
	When User clicks 'Tool Panel Settings' button on Tools panel
	Then 'Bottom' item is displayed as selected in 'toolpanel-settings' dropdown menu
	When User clicks 'Left' item in 'toolpanel-settings' dropdown menu
	Then Tools panel is displayed in 'left' side on page
	When User clicks 'Tool Panel Settings' button on Tools panel
	Then 'Left' item is displayed as selected in 'toolpanel-settings' dropdown menu
	When User clicks 'Top' item in 'toolpanel-settings' dropdown menu
	Then Tools panel is displayed in 'top' side on page

@MindManager @Toolbar @ToolbarUI @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1179] @Upd_Qase
Scenario: Check_that_the_toolbar_can_be_customized
	Then following buttons are displayed on the Top Toolbar:
		| buttons             |
		| Undo                |
		| Redo                |
		| Paste               |
		| Cut                 |
		| Copy                |
		| Format painter      |
		| Font format         |
		| Add topic           |
		| Add subtopic        |
		| Add floating topic  |
		| Add sticky note     |
		| Add callout         |
		| Add relationship    |
		| Add boundary        |
		| Topic Shape         |
		| Colors              |
		| Insert Shape        |
		| Insert Smart Shape  |
		| Insert Image        |
		| Insert Text Box     |
		| Set Default Style   |
		| Delete              |
		| Share               |
		| Tool Panel Settings |
	When User hover over 'Add topic' button in Tools panel
	Then 'Add topic' button is highlighted blue border on Tools panel
	When User drag and drop 'Copy' button to 'Add relationship' button of Tools panel
	Then following buttons are displayed on the Top Toolbar:
		| buttons             |
		| Undo                |
		| Redo                |
		| Paste               |
		| Cut                 |
		| Format painter      |
		| Font format         |
		| Add topic           |
		| Add subtopic        |
		| Add floating topic  |
		| Add sticky note     |
		| Add callout         |
		| Add relationship    |
		| Copy                |
		| Add boundary        |
		| Topic Shape         |
		| Colors              |
		| Insert Shape        |
		| Insert Smart Shape  |
		| Insert Image        |
		| Insert Text Box     |
		| Set Default Style   |
		| Delete              |
		| Share               |
		| Tool Panel Settings |
	When User clicks on the toolbar logo of Tools panel
	When User clicks on 'General' template group card on cloud template page
	Then template content is displayed on cloud template page
	When User right clicks on 'Timeline' template card on cloud template page
	Then 'cloud-templates-context-menu' Menu is displayed to User
	When User clicks button with 'blank' name in 'cloud-templates-context-menu' menu
	Then Web Editor page is displayed to the User
	When User remembers mindmanager cloud template map details from '/' directory via API
	Then following buttons are displayed on the Top Toolbar:
		| buttons             |
		| Undo                |
		| Redo                |
		| Paste               |
		| Cut                 |
		| Format painter      |
		| Font format         |
		| Add topic           |
		| Add subtopic        |
		| Add floating topic  |
		| Add sticky note     |
		| Add callout         |
		| Add relationship    |
		| Copy                |
		| Add boundary        |
		| Topic Shape         |
		| Colors              |
		| Insert Shape        |
		| Insert Smart Shape  |
		| Insert Image        |
		| Insert Text Box     |
		| Set Default Style   |
		| Delete              |
		| Share               |
		| Tool Panel Settings |

@MindManager @Toolbar @ToolbarUI @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1181] @Upd_Qase
Scenario: Check_that_disabled_buttons_appear_with_50_percent_transparent
	Then 'Undo' button is displayed as disabled on the Tools panel
	When User hover over 'Undo' button in Tools panel
	Then 'Undo' button is highlighted blue border on Tools panel
	Then 'Undo' tooltip is displayed to the User