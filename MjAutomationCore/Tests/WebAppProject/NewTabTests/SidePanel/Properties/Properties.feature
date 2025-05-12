@retry(2)
Feature: Properties
	Check functionality of Properties

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath                  |
		| auto_test_SRND.mmap | Properties_for_check.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @SidePanel @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-781] @Upd_Qase
Scenario: Check_that_topic_properties_with_number_value_can_be_edited
	Then 'Number' property is displayed in 'Topic A' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	Then '0' value is displayed in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '-1' value in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '-1' value is displayed in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '-1' is displayed for 'Number' property in 'Topic A' topic infobox
	When User enters '6.9' value in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '6.9' value is displayed in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '6.9' is displayed for 'Number' property in 'Topic A' topic infobox
	When User enters 'fds-12#*' value in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '-12' value is displayed in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '-12' is displayed for 'Number' property in 'Topic A' topic infobox
	When User enters '000000000000' value in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '0' value is displayed in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '0' is displayed for 'Number' property in 'Topic A' topic infobox
	When User enters '123456789101' value in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '123456789101' value is displayed in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '1.23457e+11' is displayed for 'Number' property in 'Topic A' topic infobox
	When User enters '^&%$#' value in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '0' value is displayed in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '0' is displayed for 'Number' property in 'Topic A' topic infobox
	When User enters 'bhcdft' value in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '0' value is displayed in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '0' is displayed for 'Number' property in 'Topic A' topic infobox
	When User enters '6  &*' value in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '6' value is displayed in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '6' is displayed for 'Number' property in 'Topic A' topic infobox

@MindManager @SidePanel @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-782] @Upd_Qase
Scenario: Check_that_topic_properties_with_currency_value_can_be_edited
	Then 'Currency' property is displayed in 'Topic A' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	Then '$0.00' value is displayed in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '-120' value in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '($120.00)' value is displayed in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '($120.00)' is displayed for 'Currency' property in 'Topic A' topic infobox
	When User enters '16.91' value in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '$16.91' value is displayed in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '$16.91' is displayed for 'Currency' property in 'Topic A' topic infobox
	When User enters '123456789101' value in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '$123,456,789,101.00' value is displayed in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '$123,456,789,101.00' is displayed for 'Currency' property in 'Topic A' topic infobox
	When User enters '000000000' value in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '$0.00' value is displayed in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '$0.00' is displayed for 'Currency' property in 'Topic A' topic infobox
	When User enters 'jd@&%d1$iok2*' value in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '$12.00' value is displayed in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '$12.00' is displayed for 'Currency' property in 'Topic A' topic infobox
	When User enters '+' value in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then 'Currency' property input field border is highlighted in 'rgb(255, 0, 0)' color of 'PanelByName' side panel with 'Properties' header
	Then value '$12.00' is displayed for 'Currency' property in 'Topic A' topic infobox
	When User enters 'E' value in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then 'Currency' property input field border is highlighted in 'rgb(255, 0, 0)' color of 'PanelByName' side panel with 'Properties' header
	Then value '$12.00' is displayed for 'Currency' property in 'Topic A' topic infobox
	When User enters '6 9' value in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '$69.00' value is displayed in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '$69.00' is displayed for 'Currency' property in 'Topic A' topic infobox

@MindManager @SidePanel @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-783] @Upd_Qase
Scenario: Check_that_topic_properties_with_Percentage_value_can_be_edited
	Then 'Percentage' property is displayed in 'Topic A' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	Then '0.00%' value is displayed in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '-30' value in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '-30.00%' value is displayed in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '-30.00%' is displayed for 'Percentage' property in 'Topic A' topic infobox
	When User enters '6.9' value in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '6.90%' value is displayed in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '6.90%' is displayed for 'Percentage' property in 'Topic A' topic infobox
	When User enters '+' value in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then 'Percentage' property input field border is highlighted in 'rgb(255, 0, 0)' color of 'PanelByName' side panel with 'Properties' header
	Then value '6.90%' is displayed for 'Percentage' property in 'Topic A' topic infobox
	When User enters 'E' value in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then 'Percentage' property input field border is highlighted in 'rgb(255, 0, 0)' color of 'PanelByName' side panel with 'Properties' header
	Then value '6.90%' is displayed for 'Percentage' property in 'Topic A' topic infobox
	When User enters '123456789101' value in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '123456789101.00%' value is displayed in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '123456789101.00%' is displayed for 'Percentage' property in 'Topic A' topic infobox
	When User enters '000000000000' value in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '0.00%' value is displayed in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '0.00%' is displayed for 'Percentage' property in 'Topic A' topic infobox
	When User enters 'g%@k)$&ksa^?7^^%$0' value in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '70.00%' value is displayed in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '70.00%' is displayed for 'Percentage' property in 'Topic A' topic infobox
	When User enters 'C' value in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '0.00%' value is displayed in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '0.00%' is displayed for 'Percentage' property in 'Topic A' topic infobox
	When User enters '6 9' value in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '69.00%' value is displayed in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '69.00%' is displayed for 'Percentage' property in 'Topic A' topic infobox

@MindManager @SidePanel @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-784] @Upd_Qase
Scenario: Check_that_topic_properties_with_Integer_value_can_be_edited
	Then 'Integer' property is displayed in 'Topic A' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	Then '0' value is displayed in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '-10' value in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '-10' value is displayed in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '-10' is displayed for 'Integer' property in 'Topic A' topic infobox
	When User enters '6.9' value in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then 'Integer' property input field border is highlighted in 'rgb(255, 0, 0)' color of 'PanelByName' side panel with 'Properties' header
	Then '6.9' value is displayed in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '-10' is displayed for 'Integer' property in 'Topic A' topic infobox
	When User enters '2147483648' value in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then 'Integer' property input field border is highlighted in 'rgb(255, 0, 0)' color of 'PanelByName' side panel with 'Properties' header
	Then '2147483648' value is displayed in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '-10' is displayed for 'Integer' property in 'Topic A' topic infobox
	When User enters '-2147483649' value in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then 'Integer' property input field border is highlighted in 'rgb(255, 0, 0)' color of 'PanelByName' side panel with 'Properties' header
	Then '-2147483649' value is displayed in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '-10' is displayed for 'Integer' property in 'Topic A' topic infobox
	When User enters '000000000' value in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '0' value is displayed in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '0' is displayed for 'Integer' property in 'Topic A' topic infobox
	When User enters 'jd@&%d1$iok2*' value in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '12' value is displayed in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '12' is displayed for 'Integer' property in 'Topic A' topic infobox
	When User enters '+' value in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then 'Integer' property input field border is highlighted in 'rgb(255, 0, 0)' color of 'PanelByName' side panel with 'Properties' header
	Then value '12' is displayed for 'Integer' property in 'Topic A' topic infobox
	When User enters 'E' value in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then 'Integer' property input field border is highlighted in 'rgb(255, 0, 0)' color of 'PanelByName' side panel with 'Properties' header
	Then value '12' is displayed for 'Integer' property in 'Topic A' topic infobox
	When User enters '6 9' value in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '69' value is displayed in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '69' is displayed for 'Integer' property in 'Topic A' topic infobox

@MindManager @SidePanel @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-785] @Upd_Qase
Scenario: Check_that_properties_with_text_values_can_be_edited_and_saved_in_the_Web_editor
	Then 'Text' property is displayed in 'Topic A' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	Then '' value is displayed in 'Text' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters 'Allud0 (pr0nunced like "ah loo dough"), is a C@n@dian s0ftware company headquartered 1n Ott@wa, Ontario' value in 'Text' property input field of 'PanelByName' side panel with 'Properties' header
	Then 'Allud0 (pr0nunced like "ah loo dough"), is a C@n@dian s0ftware company headquartered 1n Ott@wa, Ontario' value is displayed in 'Text' property input field of 'PanelByName' side panel with 'Properties' header
	Then value 'Allud0 (pr0nunced like "ah loo dough"), is a C@n@dian s0ftware co' is displayed for 'Text' property in 'Topic A' topic infobox
	When User deletes all data in 'Text' property input field of 'PanelByName' side panel with 'Properties' header
	When User presses the 'Enter' key on the keyboard
	Then '' value is displayed in 'Text' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '' is displayed for 'Text' property in 'Topic A' topic infobox

@MindManager @SidePanel @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-787] @Upd_Qase
Scenario: Check_that_topic_properties_with_Zip_Code_value_can_be_edited
	Then 'Masked field - Zip Code' property is displayed in 'Topic A' topic infobox
	Then value '     ' is displayed for 'Masked field - Zip Code' property in 'Topic A' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	Then '     ' value is displayed in 'Masked field - Zip Code' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '1234567890' value in 'Masked field - Zip Code' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '12345' value is displayed in 'Masked field - Zip Code' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '12345' is displayed for 'Masked field - Zip Code' property in 'Topic A' topic infobox
	When User enters '123' value in 'Masked field - Zip Code' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '123__' value is displayed in 'Masked field - Zip Code' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '123__' is displayed for 'Masked field - Zip Code' property in 'Topic A' topic infobox
	When User enters '00000' value in 'Masked field - Zip Code' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '00000' value is displayed in 'Masked field - Zip Code' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '00000' is displayed for 'Masked field - Zip Code' property in 'Topic A' topic infobox
	When User enters '1 2 3 4 5 6 7' value in 'Masked field - Zip Code' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '1 2 3' value is displayed in 'Masked field - Zip Code' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '1 2 3' is displayed for 'Masked field - Zip Code' property in 'Topic A' topic infobox
	When User enters '2.5' value in 'Masked field - Zip Code' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '25___' value is displayed in 'Masked field - Zip Code' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '25___' is displayed for 'Masked field - Zip Code' property in 'Topic A' topic infobox
	When User enters '2,5' value in 'Masked field - Zip Code' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '25___' value is displayed in 'Masked field - Zip Code' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '25___' is displayed for 'Masked field - Zip Code' property in 'Topic A' topic infobox
	When User enters 'mom@+_1234567890#"*' value in 'Masked field - Zip Code' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '12345' value is displayed in 'Masked field - Zip Code' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '12345' is displayed for 'Masked field - Zip Code' property in 'Topic A' topic infobox

@MindManager @SidePanel @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-788] @Upd_Qase
Scenario: Check_that_topic_properties_with_Zip_Code_4_value_can_be_edited
	Then 'Masked Field - Zip Code + 4' property is displayed in 'Topic A' topic infobox
	Then value '     -    ' is displayed for 'Masked Field - Zip Code + 4' property in 'Topic A' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	Then '     -    ' value is displayed in 'Masked Field - Zip Code + 4' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '123456789012' value in 'Masked Field - Zip Code + 4' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '12345-6789' value is displayed in 'Masked Field - Zip Code + 4' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '12345-6789' is displayed for 'Masked Field - Zip Code + 4' property in 'Topic A' topic infobox
	When User enters '123' value in 'Masked Field - Zip Code + 4' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '123__-____' value is displayed in 'Masked Field - Zip Code + 4' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '123__-____' is displayed for 'Masked Field - Zip Code + 4' property in 'Topic A' topic infobox
	When User enters '000000000' value in 'Masked Field - Zip Code + 4' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '00000-0000' value is displayed in 'Masked Field - Zip Code + 4' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '00000-0000' is displayed for 'Masked Field - Zip Code + 4' property in 'Topic A' topic infobox
	When User enters '1 2 3 4 5 6 7' value in 'Masked Field - Zip Code + 4' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '1 2 3- 4 5' value is displayed in 'Masked Field - Zip Code + 4' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '1 2 3- 4 5' is displayed for 'Masked Field - Zip Code + 4' property in 'Topic A' topic infobox
	When User enters 'mom@+_1234567890#"*' value in 'Masked Field - Zip Code + 4' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '12345-6789' value is displayed in 'Masked Field - Zip Code + 4' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '12345-6789' is displayed for 'Masked Field - Zip Code + 4' property in 'Topic A' topic infobox
	When User enters 'mom1234567890' value in 'Masked Field - Zip Code + 4' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '12345-6789' value is displayed in 'Masked Field - Zip Code + 4' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '12345-6789' is displayed for 'Masked Field - Zip Code + 4' property in 'Topic A' topic infobox
	
@MindManager @SidePanel @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-789] @Upd_Qase
Scenario: Check_that_topic_properties_with_Phone_Number_value_can_be_edited
	Then 'Masked Field - Phone Number' property is displayed in 'Topic A' topic infobox
	Then value '(   )    -    ' is displayed for 'Masked Field - Phone Number' property in 'Topic A' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	When User clicks 'Masked Field - Phone Number' property input field of 'PanelByName' side panel with 'Properties' header
	Then '(   )    -    ' value is displayed in 'Masked Field - Phone Number' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '12345678901234' value in 'Masked Field - Phone Number' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '(123) 456-7890' value is displayed in 'Masked Field - Phone Number' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '(123) 456-7890' is displayed for 'Masked Field - Phone Number' property in 'Topic A' topic infobox
	When User enters '12345' value in 'Masked Field - Phone Number' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '(123) 45_-____' value is displayed in 'Masked Field - Phone Number' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '(123) 45_-____' is displayed for 'Masked Field - Phone Number' property in 'Topic A' topic infobox
	When User enters '0000000000' value in 'Masked Field - Phone Number' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '(000) 000-0000' value is displayed in 'Masked Field - Phone Number' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '(000) 000-0000' is displayed for 'Masked Field - Phone Number' property in 'Topic A' topic infobox
	When User enters '1 2 3 4 5 6 7' value in 'Masked Field - Phone Number' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '(1 2)  3 -4 5 ' value is displayed in 'Masked Field - Phone Number' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '(1 2)  3 -4 5 ' is displayed for 'Masked Field - Phone Number' property in 'Topic A' topic infobox
	When User enters 'mom@+_1234567890#"*' value in 'Masked Field - Phone Number' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '(123) 456-7890' value is displayed in 'Masked Field - Phone Number' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '(123) 456-7890' is displayed for 'Masked Field - Phone Number' property in 'Topic A' topic infobox
	When User enters 'mom1234567890' value in 'Masked Field - Phone Number' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '(123) 456-7890' value is displayed in 'Masked Field - Phone Number' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '(123) 456-7890' is displayed for 'Masked Field - Phone Number' property in 'Topic A' topic infobox

@MindManager @SidePanel @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-790] @Upd_Qase
Scenario: Check_that_topic_properties_with_SSN_values_can_be_edited
	Then 'Masked Field - SSN' property is displayed in 'Topic A' topic infobox
	Then value '   -  -    ' is displayed for 'Masked Field - SSN' property in 'Topic A' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	When User clicks 'Masked Field - SSN' property input field of 'PanelByName' side panel with 'Properties' header
	Then '   -  -    ' value is displayed in 'Masked Field - SSN' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '12345678901234' value in 'Masked Field - SSN' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '123-45-6789' value is displayed in 'Masked Field - SSN' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '123-45-6789' is displayed for 'Masked Field - SSN' property in 'Topic A' topic infobox
	When User enters '1234' value in 'Masked Field - SSN' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '123-4_-____' value is displayed in 'Masked Field - SSN' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '123-4_-____' is displayed for 'Masked Field - SSN' property in 'Topic A' topic infobox
	When User enters '0000000000' value in 'Masked Field - SSN' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '000-00-0000' value is displayed in 'Masked Field - SSN' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '000-00-0000' is displayed for 'Masked Field - SSN' property in 'Topic A' topic infobox
	When User enters '1 2 3 4 5 6 7' value in 'Masked Field - SSN' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '1 2- 3- 4 5' value is displayed in 'Masked Field - SSN' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '1 2- 3- 4 5' is displayed for 'Masked Field - SSN' property in 'Topic A' topic infobox
	When User enters 'mom@+_1234567890#"*' value in 'Masked Field - SSN' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '123-45-6789' value is displayed in 'Masked Field - SSN' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '123-45-6789' is displayed for 'Masked Field - SSN' property in 'Topic A' topic infobox
	When User enters 'mom1234567890' value in 'Masked Field - SSN' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Topic A' topic on Canvas
	Then '123-45-6789' value is displayed in 'Masked Field - SSN' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '123-45-6789' is displayed for 'Masked Field - SSN' property in 'Topic A' topic infobox

@MindManager @SidePanel @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-794] @Upd_Qase
Scenario: Check_that_properties_with_Boolean_values_can_be_edited_and_saved_in_the_Web
	Then 'Boolean' property is displayed in 'Topic A' topic infobox
	Then value 'true' is displayed for 'Boolean' property in 'Topic A' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	Then 'True' value is displayed in 'Boolean' property selectbox of 'PanelByName' side panel with 'Properties' header
	When User clicks 'Boolean' property selectbox of 'PanelByName' side panel with 'Properties' header and selects 'False' in dropdown menu
	Then 'False' value is displayed in 'Boolean' property field of 'PanelByName' side panel with 'Properties' header
	Then value 'false' is displayed for 'Boolean' property in 'Topic A' topic infobox
	When User clicks 'Boolean' property selectbox of 'PanelByName' side panel with 'Properties' header and selects 'True' in dropdown menu
	Then 'True' value is displayed in 'Boolean' property field of 'PanelByName' side panel with 'Properties' header
	Then value 'true' is displayed for 'Boolean' property in 'Topic A' topic infobox

@MindManager @SidePanel @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-795] @Upd_Qase
Scenario: Check_that_topic_properties_with_File_or_Folder_link_values_can_be_edited
	Then 'Folder Link' property is displayed in 'Topic A' topic infobox
	Then value '' is displayed for 'Folder Link' property in 'Topic A' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	Then '' value is displayed in 'Folder Link' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters 'C:\Users\Nina\Documents\My Maps*@_,.123\' value in 'Folder Link' property input field of 'PanelByName' side panel with 'Properties' header
	Then 'C:\Users\Nina\Documents\My Maps*@_,.123\' value is displayed in 'Folder Link' property input field of 'PanelByName' side panel with 'Properties' header
	Then value 'C:\Users\Nina\Documents\My Maps*@_,.123\' is displayed for 'Folder Link' property in 'Topic A' topic infobox
	When User deletes all data in 'Folder Link' property input field of 'PanelByName' side panel with 'Properties' header
	When User presses the 'Enter' key on the keyboard
	Then '' value is displayed in 'Folder Link' property input field of 'PanelByName' side panel with 'Properties' header
	Then value '' is displayed for 'Folder Link' property in 'Topic A' topic infobox

@MindManager @SidePanel @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-796] @Upd_Qase
Scenario: Verify_that_properties_with_color_values_can_be_edited_and_saved_in_the_Web_editor
	Then 'Color' property is displayed in 'Topic A' topic infobox
	Then color 'rgb(221, 22, 82)' is displayed to the 'Color' property in 'Topic A' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	Then 'rgb(221, 22, 82)' color is displayed to 'Color' field of 'PanelByName' side panel with 'Properties' header
	When User clicks Color Picker menu button in 'Color' field of 'PanelByName' side panel with 'Properties' header
	Then Color Picker window is displayed to User
	When User clicks 'rgb(221, 22, 82)' checkbox in palette container on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'rgb(221, 22, 82)' color is displayed to 'Color' field of 'PanelByName' side panel with 'Properties' header
	Then color 'rgb(221, 22, 82)' is displayed to the 'Color' property in 'Topic A' topic infobox
	When User clicks Color Picker menu button in 'Color' field of 'PanelByName' side panel with 'Properties' header
	Then Color Picker window is displayed to User
	Then checkbox with color 'rgb(221, 22, 82)' is highlighted in palette container on Color picker
	When User click mouse by '60' '3' coordinates in field color Area
	Then Color Preview has color 'rgb(123, 29, 58)' on Color Picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'rgb(123, 29, 58)' color is displayed to 'Color' field of 'PanelByName' side panel with 'Properties' header
	Then color 'rgb(123, 29, 58)' is displayed to the 'Color' property in 'Topic A' topic infobox
	When User clicks Color Picker menu button in 'Color' field of 'PanelByName' side panel with 'Properties' header
	Then Color Picker window is displayed to User
	Then checkbox with color 'rgb(123, 29, 58)' is displayed in palette container on Color picker