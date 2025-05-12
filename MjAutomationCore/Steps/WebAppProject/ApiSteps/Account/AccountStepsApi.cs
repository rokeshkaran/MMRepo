using AutomationUtils.Extensions;
using MjAutomationCore.DTO.BaseDto.AccountDTO;
using MjAutomationCore.DTO.BaseDto.RunTimeVariables.Account;
using MjAutomationCore.DTO.WebAppDTO;
using MjAutomationCore.DTO.WebAppDTO.RunTimeVariables;
using MjAutomationCore.Extensions;
using MjAutomationCore.General.Api.Account;
using MjAutomationCore.Providers.Licensing;
using MjAutomationCore.Utils;
using Reqnroll;
using Reqnroll.Assist;

namespace MjAutomationCore.Steps.WebAppProject.Account
{
    [Binding]
    class AccountStepsApi
    {
        protected readonly RestWebClient _restClient;
        private readonly SessionRandomValue _sessionRandom;
        protected readonly SignupRequestDto _signupRequest;
        private readonly UserDataDto _userData;
        private readonly UserDataList _userDataList;

        public AccountStepsApi(RestWebClient restClient,
            SessionRandomValue sessionRandom, SignupRequestDto signupRequest,
            UserDataDto userData, UserDataList userDataList)
        {
            _restClient = restClient;
            _sessionRandom = sessionRandom;
            _signupRequest = signupRequest;
            _userData = userData;
            _userDataList = userDataList;
        }

        [Given(@"User account")]
        public void GivenUserAccount(Table table)
        {
            var userAccount = table.CreateInstance<SignupRequestDto>();
            userAccount.Email = userAccount.Email.AddRandom(_sessionRandom);
            userAccount.Password = userAccount.Password.AddRandom(_sessionRandom);
            userAccount.CopyPropertiesTo(_signupRequest);
        }

        [Given(@"User account user metadata")]
        public void GivenUserAccountUserMetadata(Table table)
        {
            var metadata = table.CreateInstance<UserMetadataDto>();
            metadata.FirstName = metadata.FirstName.AddRandom(_sessionRandom);
            metadata.LastName = metadata.LastName.AddRandom(_sessionRandom);
            _signupRequest.UserMetadata = metadata;
        }

        [When(@"User creates given user account via Api")]
        public void WhenUserCreatesGivenUserAccountViaApi()
        {
            _restClient.FrontendV1Client.InitApiMethods<AccountApiMethods>().CreateAccount(_signupRequest);
            _userData.SetCredentials(_signupRequest.Email, _signupRequest.Password);
            _userData.IsNewUser = true;
            _userDataList.Value.Add(_userData);
        }

        [When(@"User creates given user and confirms the account via Api")]
        public void WhenUserCreatesGivenUserAndConfirmsTheAccountViaApi()
        {
            _restClient.FrontendV1Client.InitApiMethods<AccountApiMethods>().CreateAccount(_signupRequest);

            //Account confirmation
            var signInApiMethods = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>();
            var signInResponse = signInApiMethods.SignInUser(_signupRequest.Email, _signupRequest.Password);

            var userDataResponse = _restClient.FrontendV1Client.InitApiMethods<AccountApiMethods>().GetSignupRequest(signInResponse.IdToken);

            // Admin signIn
            var adminSignInResponse = signInApiMethods.SignInUser(UserAdminPortalProvider.AdminLogin, UserAdminPortalProvider.AdminPassword);

            // Verify account
            _restClient.FrontendV1Client.InitApiMethods<AccountApiMethods>().VerifyAccount(userDataResponse.Id, adminSignInResponse.IdToken);

            _userData.SetCredentials(_signupRequest.Email, _signupRequest.Password);
            _userData.SetTokens(signInResponse.IdToken, signInResponse.RefreshToken);
            _userData.UserId = userDataResponse.Id;
            _userData.IsNewUser = true;
            _userDataList.Value.Add(_userData);
        }

        [Then(@"newly created account successfully created")]
        public void ThenNewlyCreatedAccountSuccessfullyCreated()
        {
            var response = _restClient.FrontendV1Client.InitApiMethods<SignInApiMethods>().PostSignInRequest(_signupRequest.Email, _signupRequest.Password);
            ApiResponseValidator.ValidateResponse(response);
        }
    }
}