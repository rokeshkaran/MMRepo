using System;
using System.Text;
using System.Threading;

namespace MjAutomationCore.Utils
{
    class TestDataGenerator
    {
        private static int _randomNumber;
        private static readonly Random random = new Random();

        public static string RandomString(int length = 7)
        {
            if (length > 32)
                length = 32;

            return Guid.NewGuid().ToString("N").Substring(0, length);
        }

        /// <summary>
        /// This method handle situation when same random numbers are generated instantly
        /// </summary>
        /// <param name="maxValue"></param>
        /// <param name="minValue"></param>
        /// <returns></returns>
        public static int RandomNum(int maxValue, int minValue = 0)
        {
            int randNum = new Random().Next(minValue, maxValue);
            int attempts = 5;
            while (randNum == _randomNumber && attempts > 0)
            {
                randNum = new Random().Next(maxValue);
                attempts--;

                if (randNum == _randomNumber)
                    System.Threading.Thread.Sleep(14);
            }

            _randomNumber = randNum;
            return randNum;
        }

        public static string RandomUsername()
        {
            return $"{RandomNum(9999)}";
        }

        public static string RandomIp(string firstNUmber)
        {
            return $"{firstNUmber}.{RandomNum(99)}.{RandomNum(99)}.{RandomNum(99)}";
        }

        public static string RandomNumber()
        {
            return $"{RandomNum(9999, 1000)}";
        }

        public static string GenerateRandomTextWithSpaces(int count)
        {
            var result = string.Empty;
            for (int i = 0; i < count; i++)
            {
                if ((i % 20).Equals(0))
                {
                    result += " ";
                    i++;
                    continue;
                }
                else
                {
                    result += (char)new Random().Next(33, 126);
                    Thread.Sleep(1);
                }
            }

            return result;
        }

        public static string RandomSymbolsInRange()
        {
            int symbolCount = random.Next(1, 6); // Generates a random number between 1 and 5

            StringBuilder symbols = new StringBuilder();
            for (int i = 0; i < symbolCount; i++)
            {
                symbols.Append(RandomSymbol());
            }

            return symbols.ToString();
        }

        public static char RandomSymbol()
        {
            // ASCII values for symbols excluding <, >, :, /, \, |, ?, *, ", A-Z, a-z, 0-9.
            int[] includedValues = { 33, 36, 37, 38, 39, 40, 41, 43, 44, 45, 46, 61, 64, 91, 93, 94, 95, 96, 123, 125, 126 };

            int minValue = 33;  // '!'
            int maxValue = 126; // '~'

            int randomValue;
            do
            {
                randomValue = random.Next(minValue, maxValue + 1);
            } while (Array.IndexOf(includedValues, randomValue) == -1);

            return (char)randomValue;
        }
    }
}