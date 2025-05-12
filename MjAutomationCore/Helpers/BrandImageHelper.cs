using MjAutomationCore.Base;
using MjAutomationCore.Extensions;
using OpenQA.Selenium;
using RestSharp;

namespace MjAutomationCore.Helpers
{
    public class BrandImageHelper : SeleniumBasePage
    {

        public static string DecodeImage(string ImageDetails)
        {
            string[] strlist = ImageDetails.Split(",", 2);
            var encoded = strlist[1].Remove(strlist[1].Length - 2);
            var decoded = encoded.DecodedString();
            return decoded;
        }

        public static string DecodeSRCImage(IWebElement BrandImageEl)
        {
            var imagLink = BrandImageEl.GetAttribute("src");
            var request = new RestRequest(imagLink, Method.Get);
            RestResponse response = new RestClient().Execute(request);
            return response.Content;
        }
    }
}
