@retry(2)
Feature: DefaultStylePersist
Check the default Style persist between sessions

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath                   |
		| auto_test_SRND.mmap | NavigationControlsMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @Toolbar @DefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1380] @Upd_Qase
Scenario: Verify_that_default_style_persists_for_floating_topic_between_sessions
	When User clicks 'Floating Topic' topic on Canvas
	When User double clicks to the 'Floating Topic' topic text on Canvas
	When User enters 'Test' text to the topic on Canvas
	When User clicks 'MT2' topic on Canvas
	When User clicks 'Test' topic on Canvas
	Then 'Test' is outlined with a blue circuit
	Then 'Set Default Style' button is displayed as enabled on the Tools panel
	#Change design of Topic (Fill color, font style, font color, font)
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'Test' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'Test' is outlined with a blue circuit
	When User clicks on 'Font format' option in Floating Toolbar Popup
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'Test' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	When User clicks 'italic' button in font style section of text editor in 'TextEditorPopup' container
	Then 'italic' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'Test' topic text is displayed 'italic' style
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'Test' topic text is displayed  'Times New Roman' in font
	When User clicks 'up' arrow in font size section of text editor in 'TextEditorPopup' container
	Then 'Test' topic text has '18.666' size
	When User clicks align icon in text editor and selects 'right' option in 'text-alignment' selectbox in 'TextEditorPopup' container
	Then 'Test' topic text is aligned 'right'
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Style' button in Share context menu
	When User waits '2000' miliseconds
	When User close Active tab
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User mouse over to the 'Add floating topic' button on Tool panel
	When User clicks 'Add floating topic' button on Tools panel
	When User add floating topic by coordinates '200', '200' to the Canvas
	Then 'Floating Topic' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'Floating Topic' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	Then 'Floating Topic' topic text is displayed 'italic' style
	Then 'Floating Topic' topic text is displayed  'Times New Roman' in font
	Then 'Floating Topic' topic text has '18.666' size
	Then 'Floating Topic' topic text is aligned 'right'

@MindManager @Toolbar @DefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1452] @Upd_Qase
Scenario: Verify_that_default_style_persists_for_main_topic_between_sessions
	When User clicks 'Main Topic' topic on Canvas
	When User double clicks to the 'Main Topic' topic text on Canvas
	When User enters 'Test' text to the topic on Canvas
	When User clicks 'Floating Topic' topic on Canvas
	When User clicks 'Test' topic on Canvas
	Then 'Test' is outlined with a blue circuit
	Then 'Set Default Style' button is displayed as enabled on the Tools panel
    #Change design of the selected N (fill color, line color, line style, size, text design, align)
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'Test' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'Test' is outlined with a blue circuit
	When User clicks on 'Font format' option in Floating Toolbar Popup
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'Test' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	When User clicks 'italic' button in font style section of text editor in 'TextEditorPopup' container
	Then 'italic' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'Test' topic text is displayed 'italic' style
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'Test' topic text is displayed  'Times New Roman' in font
	When User clicks 'up' arrow in font size section of text editor in 'TextEditorPopup' container
	Then 'Test' topic text has '18.666' size
	When User clicks align icon in text editor and selects 'right' option in 'text-alignment' selectbox in 'TextEditorPopup' container
	Then 'Test' topic text is aligned 'right'
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Style' button in Share context menu
	When User waits '2000' miliseconds
	When User close Active tab
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Central Topic' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	When User waits '1000' miliseconds
	Then 'Main Topic' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'Main Topic' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	Then 'Main Topic' topic text is displayed 'italic' style
	Then 'Main Topic' topic text is displayed  'Times New Roman' in font
	Then 'Main Topic' topic text has '18.666' size
	Then 'Main Topic' topic text is aligned 'right'

@MindManager @Toolbar @DefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1453] @Upd_Qase
Scenario: Verify_that_default_style_persists_for_sub_topic_between_sessions
	When User clicks 'Subtopic' subtopic on Canvas
	When User presses the 'Delete' key on the keyboard
	Then 'Subtopic' subtopic is not displayed on Canvas
	When User clicks 'MTST1' topic on Canvas
	Then 'MTST1' is outlined with a blue circuit
	Then 'Set Default Style' button is displayed as enabled on the Tools panel
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'MTST1' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'MTST1' is outlined with a blue circuit
	When User clicks on 'Font format' option in Floating Toolbar Popup
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'MTST1' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	When User clicks 'italic' button in font style section of text editor in 'TextEditorPopup' container
	Then 'italic' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'MTST1' topic text is displayed 'italic' style
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'MTST1' topic text is displayed  'Times New Roman' in font
	When User clicks 'up' arrow in font size section of text editor in 'TextEditorPopup' container
	Then 'MTST1' topic text has '16' size
	When User clicks align icon in text editor and selects 'right' option in 'text-alignment' selectbox in 'TextEditorPopup' container
	Then 'MTST1' topic text is aligned 'right'
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Style' button in Share context menu
	When User waits '2000' miliseconds
	When User close Active tab
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'MT2' topic on Canvas
	When User clicks 'Add subtopic' button on Tools panel
	When User waits '1000' miliseconds
	Then 'Subtopic' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'Subtopic' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	Then 'Subtopic' topic text is displayed 'italic' style
	Then 'Subtopic' topic text is displayed  'Times New Roman' in font
	Then 'Subtopic' topic text has '16' size
	Then 'Subtopic' topic text is aligned 'right'

@MindManager @Toolbar @DefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1454] @Upd_Qase
Scenario: Verify_that_default_style_persists_for_Callout_topic_between_sessions
	When User clicks 'Callout' topic on Canvas
	When User double clicks to the 'Callout' topic text on Canvas
	When User enters 'Test' text to the topic on Canvas
	When User clicks 'Floating Topic' topic on Canvas
	When User clicks 'Test' topic on Canvas
	Then 'Test' is outlined with a blue circuit
	Then 'Set Default Style' button is displayed as enabled on the Tools panel
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'Test' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'Test' is outlined with a blue circuit
	When User clicks on 'Font format' option in Floating Toolbar Popup
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'Test' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	When User clicks 'italic' button in font style section of text editor in 'TextEditorPopup' container
	Then 'italic' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'Test' topic text is displayed 'italic' style
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'Test' topic text is displayed  'Times New Roman' in font
	When User clicks 'up' arrow in font size section of text editor in 'TextEditorPopup' container
	Then 'Test' topic text has '16' size
	When User clicks align icon in text editor and selects 'right' option in 'text-alignment' selectbox in 'TextEditorPopup' container
	Then 'Test' topic text is aligned 'right'
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Style' button in Share context menu
	When User waits '2000' miliseconds
	When User close Active tab
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'MT2' topic on Canvas
	When User clicks 'Add callout' button on Tools panel
	When User waits '1000' miliseconds
	Then 'Callout' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'Callout' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	Then 'Callout' topic text is displayed 'italic' style
	Then 'Callout' topic text is displayed  'Times New Roman' in font
	Then 'Callout' topic text has '16' size
	Then 'Callout' topic text is aligned 'right'

@MindManager @Toolbar @DefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1457] @Upd_Qase @JIRA[MMCV-10330]
Scenario: Verify_that_default_style_persists_for_relationship_between_sessions
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'ImageTopic1' topic on Canvas
	When User clicks 'Central Topic' topic on Canvas
	Then '1' relationship lines are displayed on Canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#2fccc4' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then relationship line has Color '#2FCCC4' on Canvas
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Set Default Style' item in 'toolpanel-popup' dropdown menu
	When User waits '1000' miliseconds
	Then text 'Default Style Saved!' is displayed in toast notification on Overlay panel
	When User clicks 'Delete' button on Tools panel
	When User close Active tab
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	When User waits '200' miliseconds
	Then cursor relationship added to the 'ImageTopic1' topic on Canvas
	When User clicks 'Central Topic' topic on Canvas
	When User waits '1000' miliseconds
	Then relationship line has Color '#2FCCC4' on Canvas

@MindManager @Toolbar @DefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1458] @Upd_Qase @JIRA[MMCV-9960]
Scenario: Verify_that_default_style_persists_for_relationship_label_between_sessions
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'ImageTopic1' topic on Canvas
	When User clicks 'Central Topic' topic on Canvas
	Then '1' relationship lines are displayed on Canvas
	When User clicks Relationship label on Canvas
	When User enters 'Relationship label' text to the topic on Canvas
	When User clicks by coordinates '200' and '70' on Canvas
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks on text in the 'Relationship label' topic on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font family section in text editor and selects 'Verdana' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'Relationship label' topic text is displayed  'Verdana' in font
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Set Default Style' item in 'toolpanel-popup' dropdown menu
	When User waits '500' miliseconds
	Then text 'Default Style Saved!' is displayed in toast notification on Overlay panel
	When User clicks 'Delete' button on Tools panel
	When User close Active tab
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	When User waits '500' miliseconds
	Then cursor relationship added to the 'ImageTopic1' topic on Canvas
	When User clicks 'Central Topic' topic on Canvas
	When User clicks Relationship label on Canvas
	When User enters 'Relationship label 2' text to the topic on Canvas
	When User clicks by coordinates '200' and '70' on Canvas
	Then 'Relationship label 2' topic text is displayed  'Verdana' in font

@MindManager @Toolbar @DefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1459] @Upd_Qase @JIRA[MMCV-10330]
Scenario: Verify_that_default_style_persists_for_boundaries_between_sessions
	When User clicks 'Main Topic' topic on Canvas
	Then 'Main Topic' is outlined with a blue circuit
	When User clicks 'Add boundary' button on Tools panel
	Then 'Main Topic' topic is located in boundary on Canvas
	When User selects 'Main Topic' topic boundary body on Canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#2fccc4' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'Main Topic' topic boundary body is 'RGBA(47,204,196,1)' color on Canvas
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Set Default Style' item in 'toolpanel-popup' dropdown menu
	When User waits '500' miliseconds
	Then text 'Default Style Saved!' is displayed in toast notification on Overlay panel
	When User selects 'Main Topic' topic boundary body on Canvas
	When User clicks 'Delete' button on Tools panel
	When User close Active tab
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Main Topic' topic on Canvas
	When User clicks 'Add boundary' button on Tools panel
	When User waits '1000' miliseconds
	Then 'Main Topic' topic boundary body is 'RGBA(47,204,196,1)' color on Canvas