using MjAutomationCore.Providers.Base;
using MjAutomationCore.Providers.Email;
using MjAutomationCore.Utils;
using Reqnroll;

namespace MjAutomationCore.Base
{
    [Binding]
    class BeforeAfterActionsWithAccount : BaseTest
    {
        [AfterScenario("Cleanup")]
        public void CleanUpMailboxBeforeAfter()
        {
            //TODO Temporarily disabling CleanUpMailbox method due to "Too many simultaneous connections" error.
            //CleanUpMailbox();
        }

        [BeforeScenario("Cleanup")]
        public void CleanUpMailboxBefore()
        {
            //TODO Temporarily disabling CleanUpMailbox method due to "Too many simultaneous connections" error.
            //CleanUpMailbox();
        }

        public void CleanUpMailbox()
        {
            var mailRepository = new MailRepository(GmailProvider.EmailAddress, GmailProvider.CodePasswordEmail);
            mailRepository.CleanUpMailbox();
        }

        //[AfterScenario("Cleanup")]
        [AfterScenario("ForgotPasswordEmailCleanup")]
        public void CleanUpMailboxForgotPasswordAfter()
        {
            CleanUpMailboxForgotPassword();
        }

        //[BeforeScenario("Cleanup")]
        [BeforeScenario("ForgotPasswordEmailCleanup")]
        public void CleanUpMailboxForgotPasswordBefore()
        {
            CleanUpMailboxForgotPassword();
        }

        public void CleanUpMailboxForgotPassword()
        {
            var mailRepository = new MailRepository(RecoveryPasswordAccountProvider.Login, RecoveryPasswordAccountProvider.GmailApiAccessPasswordCode);
            mailRepository.CleanUpMailbox();
        }

        [AfterScenario("Cleanup")]
        public void CleanUpLicensingMailboxAfterRun()
        {
            CleanUpLicensingMailbox();
        }

        [BeforeScenario("Cleanup")]
        public void CleanUpLicensingMailboxBeforeRun()
        {
            CleanUpLicensingMailbox();
        }

        public void CleanUpLicensingMailbox()
        {
            //TODO Temporarily disabling CleanUpMailbox method due to "Too many simultaneous connections" error.
            //var mailRepository = new MailRepository(GmailProvider.EmailLC, GmailProvider.CodePasswordLC);
            //mailRepository.CleanUpMailbox();
        }
    }
}