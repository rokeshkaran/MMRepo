using OpenQA.Selenium;

namespace MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.ShapesList
{
    public class Shape : IShape
    {
        public IWebElement Element { get; set; }
        public ShapeType ElementShape { get; set; }
        public SmartShapeType ElementSmartShape { get; set; }
    }
}
