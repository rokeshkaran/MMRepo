using MailKit;
using MailKit.Net.Imap;
using MailKit.Search;
using MailKit.Security;
using MimeKit;
using MjAutomationCore.DTO.BaseDto.AccountDTO;
using System;
using System.Collections.Generic;

namespace MjAutomationCore.Utils
{
    public class MailRepository
    {
        private readonly string mailServer, login, password;
        private readonly int port;
        private readonly bool ssl;

        public MailRepository(UserDataDto user, string mailServer = "imap.gmail.com", int port = 993, bool ssl = true)
        {
            this.mailServer = mailServer;
            this.port = port;
            this.ssl = ssl;
            this.login = user.Email;
            this.password = user.Password;
        }

        public MailRepository(string login, string password, string mailServer = "imap.gmail.com", int port = 993, bool ssl = true)
        {
            this.mailServer = mailServer;
            this.port = port;
            this.ssl = ssl;
            this.login = login;
            this.password = password;
        }

        public IEnumerable<string> GetUnreadMails()
        {
            var messages = new List<string>();

            using (var client = new ImapClient())
            {
                client.Connect(mailServer, port, SecureSocketOptions.SslOnConnect);
                client.AuthenticationMechanisms.Remove("XOAUTH2");
                client.Authenticate(login, password);

                var inbox = client.Inbox;
                inbox.Open(FolderAccess.ReadOnly);
                var results = inbox.Search(SearchOptions.All, SearchQuery.Not(SearchQuery.Seen));

                foreach (var uniqueId in results.UniqueIds)
                {
                    var message = inbox.GetMessage(uniqueId);
                    messages.Add(message.HtmlBody);
                }

                client.Disconnect(true);
            }

            return messages;
        }

        public IEnumerable<MimeMessage> GetAllMails()
        {
            var messages = new List<MimeMessage>();

            using (var client = new ImapClient())
            {
                client.Connect(mailServer, port, SecureSocketOptions.SslOnConnect);
                client.AuthenticationMechanisms.Remove("XOAUTH2");
                client.Authenticate(login, password);

                var inbox = client.Inbox;
                inbox.Open(FolderAccess.ReadWrite);
                var results = inbox.Search(SearchOptions.All, SearchQuery.SentOn(DateTime.Now));

                foreach (var uniqueId in results.UniqueIds)
                {
                    var message = inbox.GetMessage(uniqueId);
                    messages.Add(message);

                    //Mark message as read
                    inbox.AddFlags(uniqueId, MessageFlags.Seen, true);
                }

                client.Disconnect(true);
            }

            return messages;
        }

        public void CleanUpMailbox()
        {
            using (var client = new ImapClient())
            {
                client.Connect(mailServer, port, SecureSocketOptions.SslOnConnect);
                client.AuthenticationMechanisms.Remove("XOAUTH2");
                client.Authenticate(login, password);

                var inbox = client.Inbox;
                inbox.Open(FolderAccess.ReadWrite);
                var results = inbox.Search(SearchOptions.All, SearchQuery.All);

                foreach (var uniqueId in results.UniqueIds)
                {
                    inbox.AddFlags(uniqueId, MessageFlags.Deleted, true);
                }

                inbox.Expunge();
                client.Disconnect(true);
            }
        }
    }
}