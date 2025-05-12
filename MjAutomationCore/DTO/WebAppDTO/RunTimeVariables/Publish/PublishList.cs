using MjAutomationCore.DTO.WebAppDTO.Publish;
using System.Collections.Generic;

namespace MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.Publish
{
    internal class PublishList
    {
        public List<PublishDto> Value;

        public PublishList() => Value = new List<PublishDto>();
    }
}
