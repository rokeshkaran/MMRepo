using System.Collections.Generic;

namespace MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal
{
    public class PurchasesDto
    {
        public List<PurchaseDto> Value { get; set; }

        public PurchasesDto()
        {
            Value = new List<PurchaseDto>();
        }
    }
}
