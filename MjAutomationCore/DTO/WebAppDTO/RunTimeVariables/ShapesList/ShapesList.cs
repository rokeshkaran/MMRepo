using System.Collections.Generic;

namespace MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.ShapesList
{
    //All shapes that were added to canvas
    public class ShapesList
    {
        public List<Shape> Value { get; set; }

        public ShapesList()
        {
            Value = new List<Shape>();
        }
    }
}
