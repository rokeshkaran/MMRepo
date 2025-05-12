using MjAutomationCore.DTO.BaseDto.AccountDTO;
using MjAutomationCore.Utils;
using System;
using System.Threading;

namespace MjAutomationCore.Helpers
{
    public class EmailHelper
    {
        public static MimeKit.MimeMessage WaitForEmailWithSubject(UserDataDto gAccount, string subj)
        {
            MimeKit.MimeMessage mail = null;
            for (int i = 0; i < 100; i++)
            {
                if (IsMailWithSubjectPresent(gAccount, subj, out mail))
                    break;

                Thread.Sleep(2000);
            }

            if (mail == null)
                throw new Exception($"Mail with '{subj}' subject was not found");

            return mail;
        }

        public static MimeKit.MimeMessage WaitForEmailWithSubject(string email, string password, string subj)
        {
            return WaitForEmailWithSubject(new UserDataDto() { Email = email, Password = password }, subj);
        }

        private static bool IsMailWithSubjectPresent(UserDataDto gAccount, string subj, out MimeKit.MimeMessage mail)
        {
            var mailRepository = new MailRepository(gAccount);
            var compareDate = DateTime.Now.AddSeconds(-60).ToUniversalTime();
            var nowDate = DateTime.Now.ToUniversalTime();
            for (int i = 0; i<=1;i++)
            {            
                var emailList = mailRepository.GetAllMails();
                foreach (MimeKit.MimeMessage message in emailList)
                {
                    if (message.Date < compareDate || message.Date > nowDate)
                        continue;

                    if (message.Subject.Contains(subj))
                    {
                        mail = message;
                        return true;
                    }
                }
                Thread.Sleep(1000);
            }            

            mail = null;
            return false;
        }
    }
}