//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TGVL
{
    using System;
    using System.Collections.Generic;
    
    public partial class ContractProduct
    {
        public int Id { get; set; }
        public Nullable<int> ReplyId { get; set; }
        public Nullable<int> AttendenceId { get; set; }
        public int ShopProductId { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public Nullable<int> Flag { get; set; }
    
        public virtual Attendence Attendence { get; set; }
        public virtual Reply Reply { get; set; }
        public virtual ShopProduct ShopProduct { get; set; }
    }
}
