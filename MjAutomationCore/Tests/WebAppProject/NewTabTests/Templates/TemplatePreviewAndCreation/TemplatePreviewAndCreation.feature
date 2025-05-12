@retry(2)
Feature: TemplatePreviewAndCreation
Check functionality for templates Preview and Creation

	Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'New' tab on file manager header page
	Then cloud templates page is displayed to User

@MindManager @Templates @App_QA @App_Staging @App_Prod @Qase[WEB-1166] @Upd_Qase
Scenario: Verify_that_template_description_is_displayed_on_hovering
	When User clicks on 'General' template group card on cloud template page
	Then template content is displayed on cloud template page
	When User hovers over 'Timeline' template card on cloud template page
	Then 'People use timeline to plan and present a list of events in chronological order....' description is displayed in 'Timeline' template card
	Then preview button is displayed in 'Timeline' template card