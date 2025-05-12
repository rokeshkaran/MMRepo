@retry(2)
Feature: Formulas

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-337] @Upd_Qase
Scenario: To_verify_that_web_app_recognises_sum_formula
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath |
		| auto_test_SRND.mmap | SUM.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And 'Expense' property is displayed in 'Topic A' topic infobox
	And 'Expense' property is displayed in 'Topic B' topic infobox
	And 'Expense' property is displayed in 'Topic C' topic infobox
	And value '0' is displayed for 'Total Expenses' property in 'SUM' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	And '' value is displayed in 'Expense' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '100' value in 'Expense' property input field of 'PanelByName' side panel with 'Properties' header
	And User presses the 'Enter' key on the keyboard
	Then value '$100.00' is displayed for 'Expense' property in 'Topic A' topic infobox
	And value '100' is displayed for 'Total Expenses' property in 'SUM' topic infobox
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	And '' value is displayed in 'Expense' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '120.50' value in 'Expense' property input field of 'PanelByName' side panel with 'Properties' header
	And User presses the 'Enter' key on the keyboard
	Then value '$120.50' is displayed for 'Expense' property in 'Topic B' topic infobox
	And value '220.5' is displayed for 'Total Expenses' property in 'SUM' topic infobox
	When User clicks 'Topic C' topic on Canvas
	Then 'Topic C' is outlined with a blue circuit
	And '' value is displayed in 'Expense' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '-50' value in 'Expense' property input field of 'PanelByName' side panel with 'Properties' header
	And User presses the 'Enter' key on the keyboard
	Then value '($50.00)' is displayed for 'Expense' property in 'Topic C' topic infobox
	And value '170.5' is displayed for 'Total Expenses' property in 'SUM' topic infobox

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-338] @Upd_Qase
Scenario: To_verify_that_web_app_recognises_min_formula
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath |
		| auto_test_SRND.mmap | MIN.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And 'Value' property is displayed in 'Topic A' topic infobox
	And 'Value' property is displayed in 'Topic B' topic infobox
	And value '0' is displayed for 'MIN' property in 'MIN' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	And '' value is displayed in 'Value' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '100' value in 'Value' property input field of 'PanelByName' side panel with 'Properties' header
	And User presses the 'Enter' key on the keyboard
	Then value '100' is displayed for 'Value' property in 'Topic A' topic infobox
	And value '100' is displayed for 'MIN' property in 'MIN' topic infobox
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	And '' value is displayed in 'Value' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '50' value in 'Value' property input field of 'PanelByName' side panel with 'Properties' header
	And User presses the 'Enter' key on the keyboard
	Then value '50' is displayed for 'Value' property in 'Topic B' topic infobox
	And value '50' is displayed for 'MIN' property in 'MIN' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User enters '-60' value in 'Value' property input field of 'PanelByName' side panel with 'Properties' header
	And User presses the 'Enter' key on the keyboard
	Then value '-60' is displayed for 'Value' property in 'Topic A' topic infobox
	And value '-60' is displayed for 'MIN' property in 'MIN' topic infobox

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-339] @Upd_Qase
Scenario: To_verify_that_web_app_recognises_max_formula
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath |
		| auto_test_SRND.mmap | MAX.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And 'Value' property is displayed in 'Topic A' topic infobox
	And 'Value' property is displayed in 'Topic B' topic infobox
	And value '0' is displayed for 'MAX' property in 'Central Topic' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	And '' value is displayed in 'Value' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '100' value in 'Value' property input field of 'PanelByName' side panel with 'Properties' header
	And User presses the 'Enter' key on the keyboard
	Then value '100' is displayed for 'Value' property in 'Topic A' topic infobox
	And value '100' is displayed for 'MAX' property in 'Central Topic' topic infobox
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	And '' value is displayed in 'Value' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '150' value in 'Value' property input field of 'PanelByName' side panel with 'Properties' header
	And User presses the 'Enter' key on the keyboard
	Then value '150' is displayed for 'Value' property in 'Topic B' topic infobox
	And value '150' is displayed for 'MAX' property in 'Central Topic' topic infobox

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-340] @Upd_Qase
Scenario: To_verify_that_web_app_recognises_average_formula
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath     |
		| auto_test_SRND.mmap | Average.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And 'Value' property is displayed in 'Topic A' topic infobox
	And 'Value' property is displayed in 'Topic B' topic infobox
	And 'Average' property is displayed in 'AVERAGE' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	And '' value is displayed in 'Value' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '10' value in 'Value' property input field of 'PanelByName' side panel with 'Properties' header
	And User presses the 'Enter' key on the keyboard
	Then value '10' is displayed for 'Value' property in 'Topic A' topic infobox
	And value '10' is displayed for 'Average' property in 'AVERAGE' topic infobox
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	And '' value is displayed in 'Value' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '0' value in 'Value' property input field of 'PanelByName' side panel with 'Properties' header
	And User presses the 'Enter' key on the keyboard
	Then value '0' is displayed for 'Value' property in 'Topic B' topic infobox
	And value '5' is displayed for 'Average' property in 'AVERAGE' topic infobox
	When User clicks 'Topic C' topic on Canvas
	Then 'Topic C' is outlined with a blue circuit
	And '' value is displayed in 'Value' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '-1' value in 'Value' property input field of 'PanelByName' side panel with 'Properties' header
	And User presses the 'Enter' key on the keyboard
	Then value '-1' is displayed for 'Value' property in 'Topic C' topic infobox
	And value '3' is displayed for 'Average' property in 'AVERAGE' topic infobox

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-341] @Health_Check @Upd_Qase
Scenario: To_verify_that_web_app_recognises_count_formula
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath   |
		| auto_test_SRND.mmap | COUNT.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And 'Value' property is displayed in 'Topic A' topic infobox
	And 'Amount' property is displayed in 'Topic B' topic infobox
	And value '2' is displayed for 'COUNT' property in 'COUNT' topic infobox
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	When User clicks 'Delete' button on Tools panel
	Then 'Topic B' topic is not displayed on Canvas
	And value '2' is displayed for 'COUNT' property in 'COUNT' topic infobox
	When User clicks 'Topic C' topic on Canvas
	Then 'Topic C' is outlined with a blue circuit
	When User clicks 'Delete' button on Tools panel
	Then 'Topic C' topic is not displayed on Canvas
	And value '1' is displayed for 'COUNT' property in 'COUNT' topic infobox