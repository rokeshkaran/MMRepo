using System.Collections.Generic;

namespace MjAutomationCore.DTO.WebAppDTO
{
    public class CountWebDto
    {
        public List<int> AmountTopicsOnViewMapPage { get; set; }

        public CountWebDto()
        {
            AmountTopicsOnViewMapPage = new List<int>();
        }
    }
}
