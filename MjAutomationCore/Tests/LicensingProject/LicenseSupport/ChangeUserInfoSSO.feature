@retry(2)
Feature: ChangeUserInfoSSO
Check Change SSO User Info functionality

Background: Pre-condition
	#Support portal
	Given User is on the Mindmanager License support website
	When User enters 'auto.test@mindmanagercloudqa.com' in the 'email' field
	And User clicks 'Sign In' button
	And User provides the Password from company account and clicks on Sign In button
	And User waits for data loading
	Then 'User Search' search option is selected on Action panel
	 
@Licensing @LisenseSupport @UserDetails @QA @Staging @Qase[LICENSE-147] @Cleanup @Upd_Qase @JIRA[MMCV-9622,MMCV-10397,MMCV-10518]
Scenario: First_name_SSO
	When User enters '<emailAddressSSO>' value in the 'search-input' field on Action panel
	When User find '<emailAddressSSO>' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button
	And User clicks 'Change User Info' button
	Then 'license-user' dialog is displayed to User
	When User enter 'Automation first NAME' value in the 'first_name' field of 'license-user' dialog
	Then 'Automation first NAME' value is displayed to the 'first_name' field of 'license-user' dialog
	When User clicks 'Submit' button in 'license-user' dialog
	Then 'Success. User updated.' text message is displayed in toast container
	When User clicks 'Back' button
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value                            |
		| User           | <emailAddressSSO>                |
		| Name           | Automation first NAME Automation |
		| Email Verified | Yes                              |
	When User find '<emailAddressSSO>' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button
	# Revert the changes made
	And User clicks 'Change User Info' button
	Then 'license-user' dialog is displayed to User
	When User enter 'Automation' value in the 'first_name' field of 'license-user' dialog
	Then 'Automation' value is displayed to the 'first_name' field of 'license-user' dialog
	When User clicks 'Submit' button in 'license-user' dialog
	Then 'Success. User updated.' text message is displayed in toast container

Examples:
	| customerName        | emailAddressSSO                 |
	| Automation_testSRND | testuser@mindmanagercloudqa.com |

@Licensing @LisenseSupport @UserDetails @QA @Staging @Qase[LICENSE-147] @Cleanup @Upd_Qase @JIRA[MMCV-9622,MMCV-10397,MMCV-10518]
Scenario: Last_name_SSO
	When User enters '<emailAddressSSO>' value in the 'search-input' field on Action panel
	When User find '<emailAddressSSO>' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button
	And User clicks 'Change User Info' button
	Then 'license-user' dialog is displayed to User
	When User enter 'Automation last NAME' value in the 'last_name' field of 'license-user' dialog
	Then 'Automation last NAME' value is displayed to the 'last_name' field of 'license-user' dialog
	When User clicks 'Submit' button in 'license-user' dialog
	Then 'Success. User updated.' text message is displayed in toast container
	When User clicks 'Back' button
	Then Rows with following values is displayed in 'license-support-user-search-result' table:
		| ColumnName     | Value                           |
		| User           | <emailAddressSSO>               |
		| Name           | Automation Automation last NAME |
		| Email Verified | Yes                             |
	When User find '<emailAddressSSO>' value in 'User' column of 'license-support-user-search-result' table and clicks 'Details' button
	And User clicks 'Change User Info' button
	Then 'license-user' dialog is displayed to User
	# Revert the changes made
	When User enter 'Automation' value in the 'last_name' field of 'license-user' dialog
	Then 'Automation' value is displayed to the 'last_name' field of 'license-user' dialog
	When User clicks 'Submit' button in 'license-user' dialog
	Then 'Success. User updated.' text message is displayed in toast container
	
Examples:
	| customerName        | emailAddressSSO                 |
	| Automation_testSRND | testuser@mindmanagercloudqa.com |

