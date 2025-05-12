using System.Collections.Generic;

namespace MjAutomationCore.DTO.WebAppDTO.Clouds.Box
{
    public class BoxSearchResponseDto
    {
        public int TotalCount { get; set; }
        public List<BoxItemDTO> Entries { get; set; }
    }

    public class BoxItemDTO
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
    }
}