using OtpNet;

namespace MjAutomationCore.Utils
{
    class TwoFaCodeGenerator
    {
        public static string Get(string key)
        {
            var otpKeyBytes = Base32Encoding.ToBytes(key);
            var totp = new Totp(otpKeyBytes);
            var code = totp.ComputeTotp();
            return code;
        }
    }
}