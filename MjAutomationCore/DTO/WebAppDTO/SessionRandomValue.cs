using MjAutomationCore.Utils;
using System;

namespace MjAutomationCore.DTO.WebAppDTO
{
    public class SessionRandomValue
    {
        //SRND
        public string RandomString { get; set; }

        //SVRND
        public string UsernameRnd { get; set; }

        //RND
        public string RandomNumber { get; set; }

        //RSN
        public string RandomSymbol { get; set; }

        public string CurrentDateTime;

        public SessionRandomValue()
        {
            RandomString = TestDataGenerator.RandomString();
            UsernameRnd = TestDataGenerator.RandomUsername();
            RandomNumber = TestDataGenerator.RandomNumber();
            RandomSymbol = TestDataGenerator.RandomSymbolsInRange();
            CurrentDateTime = DateTime.Now.ToString("dd'/'MM'/'yyyy'_'HH':'mm':'ss");
        }
    }
}