using System.Collections.Generic;
using System.Drawing;

namespace MjAutomationCore.DTO.WebAppDTO.RunTimeVariables
{
    public class LocationWebDtoList
    {
        public IDictionary<string, Point> ListOfImageLocations = new Dictionary<string, Point>();

        public IDictionary<string, Point> ListOfTextLocations = new Dictionary<string, Point>();
    }
}
