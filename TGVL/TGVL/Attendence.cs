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
    
    public partial class Attendence
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Attendence()
        {
            this.ContractProducts = new HashSet<ContractProduct>();
        }
    
        public int Id { get; set; }
        public int RequestId { get; set; }
        public int SupplierId { get; set; }
        public int Rank { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<int> Flag { get; set; }
    
        public virtual User User { get; set; }
        public virtual BiddingFloor BiddingFloor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ContractProduct> ContractProducts { get; set; }
    }
}
