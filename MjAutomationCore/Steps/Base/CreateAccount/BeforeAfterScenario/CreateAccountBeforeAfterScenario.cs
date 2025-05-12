using MjAutomationCore.Base;
using MjAutomationCore.Providers.UserProvider;
using MjAutomationCore.Utils;
using Reqnroll;

namespace MjAutomationCore.Steps.Base.CreateAccount.BeforeAfterScenario
{
    [Binding]
    class CreateAccountBeforeAfterScenario : BaseTest
    {
        [AfterScenario("AccountCreationEmailCleanup")]
        public void CleanupCreateAccountMailboxAfter()
        {
            CleanUpMailbox();
        }

        [AfterScenario("AccountCreationEmailCleanup")]
        public void CleanupCreateAccountMailboxBefore()
        {
            CleanUpMailbox();
        }

        public void CleanUpMailbox()
        {
            var mailRepository = new MailRepository(AccountCreationProvider.EmailForAccountCreation, AccountCreationProvider.CodePasswordForAccountCreation);
            mailRepository.CleanUpMailbox();
        }
    }
}