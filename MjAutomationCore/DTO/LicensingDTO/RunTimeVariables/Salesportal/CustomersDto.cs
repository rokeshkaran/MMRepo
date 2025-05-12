using System.Collections.Generic;

namespace MjAutomationCore.DTO.LicensingDTO.RunTimeVariables.Salesportal
{
    public class CustomersDto
    {
        public List<CustomerDto> Value;

        public CustomersDto() => Value = new List<CustomerDto>();
    }
}