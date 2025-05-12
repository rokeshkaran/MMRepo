@retry(2)
Feature: WebAppEN
To verify the 'customer support' link in the 'MindManager Account help' screen in English

@MindManager @Accounts @HelpButton @WebApp @App_QA @App_Staging @App_Prod @Qase[WEB-2412] @JIRA[MMCV-10262] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Welcome_Screen
	Given User is on the Mindmanager website
	When User accepts Optanon cookies
	When User clicks 'Help' button
	Then Following text is displayed under each header:
		| Header                                        | ExpectedText                                                                                                                                                                                                                                                                                                                                                           |
		| MindManager Account Help                      | Your MindManager Account unlocks the full potential of MindManager. Creating an account only takes a minute, and it's free!                                                                                                                                                                                                                                            |
		| Why do I need a MindManager Account?          | The MindManager Account is your unique identification for MindManager.                                                                                                                                                                                                                                                                                                 |
		| What can I use my MindManager Account for?    | Your MindManager Account gives you access to your MindManager perpetual license, subscription, and support services. It's also your unique identity when using special features like MindManager Snap, Publishing, Co-Editing, or the MindManager app for Microsoft Teams.                                                                                             |
		| Can I use my existing Mindjet credentials?    | In most cases no. If you have a Mindjet Connect, Mindjet Files, Mindjet ID, or Maps for That account your previous credentials will not work and you need to create a new MindManager Account.If you previously created a MindManager account to use MindManager Snap, Publishing, or Co-Editing, then yes, you can use that account to sign-in.                       |
		| I didn't receive my email verification email! | In some cases spam filters can block our emails, try whitelisting noreply@mindmanager.com in your email sender list. You can also try pressing the "Resend Email" button, be sure to give it a few minutes, sometimes emails can be slow to get to you. If you still haven't received the verification email after trying the previous methods please contact support. |
	Then User sees 'contact support' hyperlink on Right Side panel
	When User click 'contact support' hyperlink on Right Side panel
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/en/support/'
	Then User sees 'Welcome to MindManager Support' page header

@MindManager @Accounts @HelpButton @WebApp @App_QA @App_Staging @App_Prod @Qase[WEB-2405] @JIRA[MMCV-10262] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Sign_In_Screen
	Given User is on the Mindmanager website
	When User accepts Optanon cookies
	When User clicks 'Sign In' button
	When User clicks 'Help' button
	Then User sees 'contact support' hyperlink on Right Side panel
	Then Following text is displayed under each header:
		| Header                                        | ExpectedText                                                                                                                                                                                                                                                                                                                                                           |
		| MindManager Account Help                      | Your MindManager Account unlocks the full potential of MindManager. Creating an account only takes a minute, and it's free!                                                                                                                                                                                                                                            |
		| Why do I need a MindManager Account?          | The MindManager Account is your unique identification for MindManager.                                                                                                                                                                                                                                                                                                 |
		| What can I use my MindManager Account for?    | Your MindManager Account gives you access to your MindManager perpetual license, subscription, and support services. It's also your unique identity when using special features like MindManager Snap, Publishing, Co-Editing, or the MindManager app for Microsoft Teams.                                                                                             |
		| Can I use my existing Mindjet credentials?    | In most cases no. If you have a Mindjet Connect, Mindjet Files, Mindjet ID, or Maps for That account your previous credentials will not work and you need to create a new MindManager Account.If you previously created a MindManager account to use MindManager Snap, Publishing, or Co-Editing, then yes, you can use that account to sign-in.                       |
		| I didn't receive my email verification email! | In some cases spam filters can block our emails, try whitelisting noreply@mindmanager.com in your email sender list. You can also try pressing the "Resend Email" button, be sure to give it a few minutes, sometimes emails can be slow to get to you. If you still haven't received the verification email after trying the previous methods please contact support. |
	When User click 'contact support' hyperlink on Right Side panel
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/en/support/'
	Then User sees 'Welcome to MindManager Support' page header

@MindManager @Accounts @HelpButton @WebApp @App_QA @App_Staging @App_Prod @Qase[WEB-2406] @JIRA[MMCV-10262] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Create_Account_Screen
	Given User is on the Mindmanager website
	When User accepts Optanon cookies
	When User clicks 'Create Account' button
	When User clicks 'Help' button
	Then User sees 'contact support' hyperlink on Right Side panel
	Then Following text is displayed under each header:
	| Header                                        | ExpectedText                                                                                                                                                                                                                                                                                                                                                           |
	| MindManager Account Help                      | Your MindManager Account unlocks the full potential of MindManager. Creating an account only takes a minute, and it's free!                                                                                                                                                                                                                                            |
	| Why do I need a MindManager Account?          | The MindManager Account is your unique identification for MindManager.                                                                                                                                                                                                                                                                                                 |
	| What can I use my MindManager Account for?    | Your MindManager Account gives you access to your MindManager perpetual license, subscription, and support services. It's also your unique identity when using special features like MindManager Snap, Publishing, Co-Editing, or the MindManager app for Microsoft Teams.                                                                                             |
	| Can I use my existing Mindjet credentials?    | In most cases no. If you have a Mindjet Connect, Mindjet Files, Mindjet ID, or Maps for That account your previous credentials will not work and you need to create a new MindManager Account.If you previously created a MindManager account to use MindManager Snap, Publishing, or Co-Editing, then yes, you can use that account to sign-in.                       |
	| I didn't receive my email verification email! | In some cases spam filters can block our emails, try whitelisting noreply@mindmanager.com in your email sender list. You can also try pressing the "Resend Email" button, be sure to give it a few minutes, sometimes emails can be slow to get to you. If you still haven't received the verification email after trying the previous methods please contact support. |
	When User click 'contact support' hyperlink on Right Side panel
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/en/support/'
	Then User sees 'Welcome to MindManager Support' page header

@MindManager @Accounts @HelpButton @WebApp @App_QA @App_Staging @App_Prod @Qase[WEB-2407] @JIRA[MMCV-10262] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Start_Free_Trial_Screen
	Given User is on the Mindmanager website
	When User accepts Optanon cookies
	When User clicks 'Start Free Trial' button
	When User clicks 'Help' button
	Then User sees 'contact support' hyperlink on Right Side panel
	Then Following text is displayed under each header:
	| Header                                        | ExpectedText                                                                                                                                                                                                                                                                                                                                                           |
	| MindManager Account Help                      | Your MindManager Account unlocks the full potential of MindManager. Creating an account only takes a minute, and it's free!                                                                                                                                                                                                                                            |
	| Why do I need a MindManager Account?          | The MindManager Account is your unique identification for MindManager.                                                                                                                                                                                                                                                                                                 |
	| What can I use my MindManager Account for?    | Your MindManager Account gives you access to your MindManager perpetual license, subscription, and support services. It's also your unique identity when using special features like MindManager Snap, Publishing, Co-Editing, or the MindManager app for Microsoft Teams.                                                                                             |
	| Can I use my existing Mindjet credentials?    | In most cases no. If you have a Mindjet Connect, Mindjet Files, Mindjet ID, or Maps for That account your previous credentials will not work and you need to create a new MindManager Account.If you previously created a MindManager account to use MindManager Snap, Publishing, or Co-Editing, then yes, you can use that account to sign-in.                       |
	| I didn't receive my email verification email! | In some cases spam filters can block our emails, try whitelisting noreply@mindmanager.com in your email sender list. You can also try pressing the "Resend Email" button, be sure to give it a few minutes, sometimes emails can be slow to get to you. If you still haven't received the verification email after trying the previous methods please contact support. |
	When User click 'contact support' hyperlink on Right Side panel
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/en/support/'
	Then User sees 'Welcome to MindManager Support' page header

@MindManager @Accounts @HelpButton @WebApp @App_QA @App_Staging @Qase[WEB-2408] @JIRA[MMCV-10262] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_the_trial_expired_screen
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId | EndDate |
		| <customerName> | 3     | MMTRIAL   | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When admin '<customerName>' accepts BULA terms via API
	When User accepts Optanon cookies
	When User find 'MindManager Trial' value in 'Product' column of 'admin-home-purchases' table and clicks 'Administrate' button
	When User find 'MindManager Trial' value in 'Version' column of 'admin-license-purchases' table and clicks 'Add / Manage Users' button
	When User enters '<emailAddress>' value in the 'email' field in 'manage-user' dialog
	When User clicks 'Submit' button in 'manage-user' dialog
	Then Rows with following values is displayed in 'admin-license-purchases' table:
		| ColumnName       | Value             |
		| Version          | MindManager Trial |
		| Expires          | D(1)              |
		| Seats Used/Total | 1/3               |
	When User updates 'MMTRIAL' purchase data for '<customerName>' customer in Sales portal via Api
		| EndDate |
		| D(-1)   |
	Given User is logged into '<emailAddress>' newly created account of MindManager web app via Api
	Then Right Side panel is displayed
	Then User sees 'Your MindManager Trial has expired.' header on Right Side panel
	When User clicks 'Help' button
	Then User sees 'MindManager Licensing Help' header on Right Side panel
	When User clicks 'contact support' hyperlink in '<text>' text on Right Side panel
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/en/support/'
	Then User sees 'Welcome to MindManager Support' page header

Examples:
	| customerName        | emailAddress                                 | password   | text                                                      |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | If you have extenuating circumstances                     |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | If there is a problem with your subscription please       |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | If your key is not working please                         |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | If you have issues receiving your key, please             |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | If you think your license key has been compromised please |
	| Automation_testSRND | auto.test_1+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND | Please contact support                                    |