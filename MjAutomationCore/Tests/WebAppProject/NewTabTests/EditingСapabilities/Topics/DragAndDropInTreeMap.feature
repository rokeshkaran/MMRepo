@retry(2)
Feature: DragAndDropInTreeMap
Check the functionality of drag and drop topics in Flowchart

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'New' tab on file manager header page

@MindManager @EditingCapabilities @Topics @DragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-301] @Upd_Qase
Scenario: Drag_and_Drop_in_Free_Form
	When User clicks on 'Mind Mapping' template group card on cloud template page
	Then template content is displayed on cloud template page
	When User right clicks on 'Tree Map' template card on cloud template page
	Then 'cloud-templates-context-menu' Menu is displayed to User
	When User clicks button with 'prefilled' name in 'cloud-templates-context-menu' menu
	Then Web Editor page is displayed to the User
	When User remembers mindmanager cloud template map details from '/' directory via API
	When User remembers location of 'Cereal' topic on Canvas
	When User drags and hold 'Cereal' topic to '-50' and '-50' coordinates on Canvas
	Then selected topic is displayed attached to the mouse cursor at 50 percent opacity
	Then 'line-legacy' topic shape is attached to the cursor on Canvas
	When User releases all pressed keys
	Then 'Cereal' topic has changed location by X axis on Canvas
	Then 'Cereal' topic has changed location by Y axis on Canvas