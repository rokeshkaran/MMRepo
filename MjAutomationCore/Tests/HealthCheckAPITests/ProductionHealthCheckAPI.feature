@retry(3)
Feature: ProductionHealthCheckAPI

@API @ProductionHealthCheckAPI
Scenario: VerifyServerStatus
	When User performs request to get application status of MindManager app
	Then response status code should be '200'
	Then response content should be 'Hi there!'

@API @ProductionHealthCheckAPI
Scenario: VerifyLoginFunctionality
	When User performs signin request for MindManager app
	Then response status code should be '200'
	When User performs request to get user info data of MindManager app
	Then response status code should be '200'

@API @ProductionHealthCheckAPI @Cleanup
Scenario: VerifyAccountCreationFunctionality
	Given User account
		| Email       | Password       |
		| <userEmail> | <userPassword> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user account via Api
	Then newly created account successfully created
	When User performs signin request using newly created account for MindManager app
	Then response status code should be '200'

Examples:
	| userEmail                                   | userPassword |
	| auto.test_+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND   |

@API @ProductionHealthCheckAPI @TrialLicenseActivation @Cleanup
Scenario: VerifyUserCanActivateTrialLicense
	Given User account
		| Email       | Password       |
		| <userEmail> | <userPassword> |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	When newly created user performs request to activate trial license
		| productId |
		| MMTRIAL   |
	Then response status code should be '200'
	When User performs license status verification request for product version 'MMTRIAL'
	Then response status code should be '200'
	Then 'MMTRIAL' license is active for newly created user

Examples:
	| userEmail                                   | userPassword |
	| auto.test_+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND   |

@API @ProductionHealthCheckAPI @PasswordRecoveryAPI
Scenario: VerifyPasswordRecoveryRequest
When User performs password recovery request using email 'auto.test_+SRND@mindmanager.onmicrosoft.com'
Then response status code should be '200'