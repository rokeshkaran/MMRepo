@retry(2)
Feature: FileControls
Check FileControls functionality

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @Keyboard_Shortcuts @FileControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1477] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_open_another_file_using_Ctrl_O_hotkey
	When User presses the CTRL_O combination key on the keyboard
	Then content page is displayed to User
	When User clicks 'Back' tab on file manager header page
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @Keyboard_Shortcuts @FileControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1401] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_open_New_tab_using_Alt_N_hotkey
	When User presses the ALT_N combination key on the keyboard
	Then cloud templates page is displayed to User
	When User clicks 'Back' tab on file manager header page
	Then Web Editor page is displayed to the User