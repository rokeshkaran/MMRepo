@retry(2)
Feature: MindjetStore
Check fields for validation on Mindjet Store main page

@MindManager @Mindjet_Store @App_QA @App_Staging @App_Prod
Scenario: Check_fields_for_validation
	Given User is on the Mindjet Store page
	Then Mindjet Store page is displayed
	Then order step panel is displayed to User
	When User clicks 'Next' button on Mindjet Store page
	Then 'Input error' message with text 'An error occurred while validating your entries. Please correct the data in the highlighted fields.' is displayed on Mindjet Store page
	Then 'deliveryFirstname' field is highlighted red color on Mindjet Store page
	Then 'deliveryLastname' field is highlighted red color on Mindjet Store page
	Then 'deliveryPostalcode' field is highlighted red color on Mindjet Store page
	Then 'deliveryCity' field is highlighted red color on Mindjet Store page
	Then 'deliveryEmail' field is highlighted red color on Mindjet Store page
	Then 'paymentCreditCardNumberSecure' field is highlighted red color on Mindjet Store page
	Then 'Month' selectbox is highlighted red color on Mindjet Store page
	Then 'Year' selectbox is highlighted red color on Mindjet Store page
	Then 'paymentCreditCardCvv' field is highlighted red color on Mindjet Store page

@MindManager @Mindjet_Store @QA @Staging @Not_Run
Scenario: Purchase_product_with_credit_card
	Given User is on the Mindmanager website
	Then Right Side panel is displayed
	Then 'Create Account' button is displayed
	When User provides the Login and Password and clicks on the Sign In button
	Then file manager header page is displayed to User
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to Google cloud
	Then 'Google' cloud with 'automationtestmj@gmail.com' user is displayed on navigation panel
	Then 'My Drive' folder with 'drive' description is exist on page
	Then 'Shared With Me' folder with 'drive' description is exist on page
	When User clicks 'My Drive' folder
	Then 'For QA automation' folder with 'Folder' description is exist on page
	When User clicks 'For QA automation' folder
	Then 'Map1.mmap' file is exist on page
	When User clicks 'Map1.mmap' file
	Then Web Editor page is displayed to the User
	When User click switch button Autosave
	Then Autosave switcher is displayed 'Off' to the User
	When User clicks 'Share' button on Tools panel
	When User clicks 'Invite Others to Edit' item in 'toolpanel-share-sub-menu' dropdown menu
	Then header 'Invite Others to Co-Edit This File' is displayed on SOME page
	When User clicks 'Anyone with the link can co-edit' checkbox on the Invite Others to Co-Edit This File page
	When User clicks on the 'Copy Link' button and share with other users on SOME page
	When User clicks 'Done' button on SOME page
	Then Web Editor page is displayed to the User
	#New User create account on co-editing main page
	When User openes 'chrome' browser
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	Then Left side panel is displayed
	#Then 'Back' button is displayed on Left side panel of main page
	Then Right Side panel is displayed
	Then Central panel is displayed
	Then header 'Unleash your team's brain power withreal-time collaborative editing' is displayed on Central panel in Main page
	Then Right Side panel is displayed
	Then header 'Co-Editing requires a MindManager account.' is displayed on Right side panel of main page
	Then 'Create Account' button is displayed
	When User clicks 'Create Account' button
	Then User sees 'Create a MindManager account to manage your license or subscription.' header on Right Side panel
	When User fills account creation fields
		| Email                          | FirstName      | LastName       | Password  | ConfirmPassword |
		| SRNDMindManager@mailinator.com | Automation_RND | Automation_RND | TYf78!RND | TYf78!RND       |
	Then checkbox by label 'I accept MindManager's Terms & Conditions. (Last Updated 09/2020)' is unchecked
	When User checks checkbox by label 'I accept MindManager's Terms & Conditions. (Last Updated 09/2020)'
	Then checkbox by label 'I accept MindManager's Terms & Conditions. (Last Updated 09/2020)' is checked
	When User clicks 'Create Account' button
	Then User sees 'Please verify your email to continue.' page header
	Then User sees 'An email was sent to you from noreply@mindjet.com with a link to verify your email. Please check your email and click the link to complete your account setup.' messege on page
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
	When User switches to '0' tab
	Then User sees 'Please verify your email to continue.' page header
	Then User sees 'An email was sent to you from noreply@mindjet.com with a link to verify your email. Please check your email and click the link to complete your account setup.' messege on page
	When User clicks 'Continue' button
	Then Web Editor page is displayed to the User
	Then 'Want to host your own co-editing session?' message is displayed at the bottom of Canvas
	When User clicks 'Click to Start Free Trial' Subscribe link at the bottom of Canvas
	#Then User sees 'Co-editing Free Trial: 30 days remaining' message in down on Web Editor page
	Then 'Co-editing Free Trial: 29 days remaining' message is displayed at the bottom of Canvas
	When User clicks 'Click to Subscribe' Subscribe link at the bottom of Canvas
	Then Central panel is displayed
	#Then header 'Unleash your team's brain power withreal-time collaborative editing' is displayed on Central panel in Main page
	Then Right Side panel is displayed
	When User clicks Visit Store button
	When User switches to '1' tab
	Then Mindjet Store page is displayed
	Then order step panel is displayed to User
	Then 'Your details' step is displayed as Active on order steps panel
	When User enters 'Bozz' in the '*First name' field
	When User enters 'Gury' in the '*Last name' field
	When User enters '7311 be' in the '*Zip/Postal code' field
	When User clicks Country field and selects 'Netherlands' from dropdown
	When User enters 'Apeldoorn' in the '*City' field
	When User enters login of the newly created account in the '*Email' field
	When User enters 'T44831538744265T' in the '*Card number' field
	When User clicks 'Month' field and selects '11' in the dropdown list
	When User clicks 'Year' field and selects '2028' in the dropdown list
	When User enters '739' in the '*Security code' field
	When User clicks 'Next' button on Mindjet Store page
	Then 'Review your data' step is displayed as Active on order steps panel
	When User clicks 'Buy now' button on Mindjet Store page
	Then 'Done' step is displayed as Active on order steps panel
	When User switches to '0' tab
	Then Web Editor page is displayed to the User
	#When User clicks 'Participants' button of side Toolbox
	#Then 'PanelByName' side panel with 'Participants' header is displayed to the User
	#Then '2' participants are displayed in 'Editors' section of 'Participants' panel