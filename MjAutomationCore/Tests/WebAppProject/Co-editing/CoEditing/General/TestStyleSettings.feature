@retry(2)
Feature: TextStyleSettings
Check functionality context menu for Text style settings in coedit session

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then User set zoom level to '36' via the side tool bar

@MindManager @EditingCapabilities @Co_Editing @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-275] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_edit_topic_text_style_during_the_coediting_session_QA
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
	Then User set zoom level to '36' via the side tool bar
	#User A Actions
	When User switches to '0' browser	
	When User clicks on text in the 'FT2' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'FT2' topic text is displayed  'Times New Roman' in font
	When User waits '2000' miliseconds
	#User B Actions
	When User switches to '1' browser
	Then 'FT2' topic text is displayed  'Times New Roman' in font	
	When User clicks on text in the 'Properties' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks 'strikethrough' button in font style section of text editor in 'TextEditorPopup' container
	When User waits '1500' miliseconds
	Then 'Properties' topic text is displayed 'strikethrough' style
	#User A Actions
	When User switches to '0' browser
	Then 'Properties' topic text is displayed 'strikethrough' style
	When User remembers 'Multiline topic text' topic model id and name
	When User clicks 'Multiline topic text' topic on Canvas
	When User clicks 'Multiline topic text' topic on Canvas
	When User clicks and hold editable cursor and moves by '20' '0' coordinates on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	When User clicks by coordinates '200' and '50' on Canvas
	Then text 'Multiline topic text' has 'rgba(0, 0, 0, 1)' color in the 'Multiline topic text' topic on Canvas
	Then text 'Topic for' has 'rgba(0, 0, 0, 1)' color in the 'Multiline topic text' topic on Canvas
	Then text 'a specific' has 'rgba(244, 177, 16, 1)' color in the 'Multiline topic text' topic on Canvas
	Then text 'Text formatting test' has 'rgba(0, 0, 0, 1)' color in the 'Multiline topic text' topic on Canvas
	When User waits '2000' miliseconds
	#User B Actions
	When User switches to '1' browser
	Then text 'a specific' has 'rgba(244, 177, 16, 1)' color in the 'Multiline topic text' topic on Canvas
	When User remembers 'Text Formatting' topic model id and name
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font size section in text editor and selects '26' option in 'text-style-size' selectbox in 'TextEditorPopup' container
	Then text 'Text Formatting' has font size of '34.666' in the 'Text Formatting' topic on Canvas
	#Verify all changes are saved
	When User close Active tab
	When User switches to '0' browser
	When User refresh page
	When User waits '5000' miliseconds
	When User waits for data loading
	Then Web Editor page is displayed to the User
	Then 'FT2' topic text is displayed  'Times New Roman' in font
	Then 'Properties' topic text is displayed 'strikethrough' style
	Then text 'Text Formatting' has font size of '34.666' in the 'Text Formatting' topic on Canvas
	Then text 'a specific' has 'rgba(244, 177, 16, 1)' color in the 'Multiline topic text' topic on Canvas