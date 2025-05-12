using System.Collections.Generic;

namespace MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.TopicsDetails
{
    public class TopicDetails
    {
        public Dictionary<string, string> TopicModelIdList = new Dictionary<string, string>();

        public List<KeyValuePair<string, string>> TopicImageRef = new List<KeyValuePair<string, string>>();

        public List<KeyValuePair<string, string>> TopicWidthSize = new List<KeyValuePair<string, string>>();

        public List<KeyValuePair<string, string>> TopicTextColor = new List<KeyValuePair<string, string>>();
    }
}
