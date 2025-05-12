@retry(2)
Feature: AdminPortalEN
To verify the 'customer support' link in the 'MindManager Account help' screen in English

Background: Pre-condition
	Given User is on Customer Admin Portal website
	When User accepts Optanon cookies

@MindManager @Accounts @HelpButton @AdminPortal @App_QA @App_Staging @Qase[WEB-2409] @JIRA[MMCV-10262] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Admin_Portal_Welcome_Screen
	When User clicks 'Help' button
	When User accepts Optanon cookies
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

@MindManager @Accounts @HelpButton @AdminPortal @App_QA @App_Staging @Qase[WEB-2410] @JIRA[MMCV-10262] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Sign_In_Screen
	When User clicks 'Sign In' button
	When User accepts Optanon cookies
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

@MindManager @Accounts @HelpButton @AdminPortal @App_QA @App_Staging @Qase[WEB-2413] @JIRA[MMCV-10262] @Cleanup @Build_24.0.110 @Upd_Qase
Scenario: Customer_Support_Link_from_Admin_Create_Account_Screen
	When User clicks 'Create Account' button
	When User accepts Optanon cookies
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