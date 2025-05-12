using System.ComponentModel;
using OpenQA.Selenium;

namespace MjAutomationCore.DTO.WebAppDTO.RunTimeVariables.ShapesList
{
    interface IShape
    {
        IWebElement Element { get; set; }
        ShapeType ElementShape { get; set; }
    }

    public enum ShapeType
    {
        Rectangle,
        [Description("Rounded Rectangle")]
        RoundedRectangle,
        Trapezoid,
        Parallelogram,
        [Description("Isosceles Triangle")]
        IsoscelesTriangle,
        [Description("Right Angle Triangle")]
        RightAngleTriangle,
        Circle,
        [Description("Right Arrow")]
        RightArrow,
        [Description("Block Arrow")]
        BlockArrow,
        Chevron,
        [Description("Text Bubble")]
        TextBubble,
        Explosion,
        [Description("Four Point Star")]
        FourPointStar,
        [Description("Five Point Star")]
        FivePointStar,
        [Description("Horizontal Divider")]
        HorizontalDivider,
        [Description("Vertical Divider")]
        VerticalDivider,
        [Description("Left Curly Bracket")]
        LeftCurlyBracket,
        [Description("Right Curly Bracket")]
        RightCurlyBracket
    }

    public enum SmartShapeType
    {
        [Description("Table")]
        Table,
        [Description("Swim Lanes")]
        SwimLanes,
        [Description("Funnel")]
        Funnel
    }

    public enum StaticSmartShapeType
    {
        [Description("StaticTable,NvBudFpzcUuS7uyIWiQmtw==")]
        StaticTable,
        [Description("StaticSwimLanes,WsGfI6OtAku6JtwvxMPSqQ==")]
        StaticSwimLanes,
        [Description("StaticFunnel,6hF7+nCTzUiliB5MVkqh4Q==")]
        StaticFunnel
    }
}
