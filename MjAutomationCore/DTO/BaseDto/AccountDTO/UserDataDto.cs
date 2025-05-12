namespace MjAutomationCore.DTO.BaseDto.AccountDTO
{
    public class UserDataDto : BaseAccountDto
    {
        public string ConfirmPassword { get; set; }
        public string IdToken { get; set; }
        public string RefreshToken { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserId { get; set; }
        public string FullName { get; set; }
        public bool IsNewUser { get; set; }

        public void SetCredentials(string email, string password)
        {
            Email = email;
            Password = password;
        }

        public void SetTokens(string idToken, string refreshToken)
        {
            IdToken = idToken;
            RefreshToken = refreshToken;
        }
    }
}