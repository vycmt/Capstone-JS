﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BMWEntities : DbContext
    {
        public BMWEntities()
            : base("name=BMWEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Attendence> Attendences { get; set; }
        public virtual DbSet<BiddingFloor> BiddingFloors { get; set; }
        public virtual DbSet<ContractProduct> ContractProducts { get; set; }
        public virtual DbSet<Deal> Deals { get; set; }
        public virtual DbSet<Manufacturer> Manufacturers { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Reply> Replies { get; set; }
        public virtual DbSet<RequestDescription> RequestDescriptions { get; set; }
        public virtual DbSet<RequestProduct> RequestProducts { get; set; }
        public virtual DbSet<Request> Requests { get; set; }
        public virtual DbSet<RequestType> RequestTypes { get; set; }
        public virtual DbSet<Review> Reviews { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<ShopCategory> ShopCategories { get; set; }
        public virtual DbSet<ShopProduct> ShopProducts { get; set; }
        public virtual DbSet<Shop> Shops { get; set; }
        public virtual DbSet<SysCategory> SysCategories { get; set; }
        public virtual DbSet<SysProductAttribute> SysProductAttributes { get; set; }
        public virtual DbSet<SysProduct> SysProducts { get; set; }
        public virtual DbSet<UserClaim> UserClaims { get; set; }
        public virtual DbSet<UserLogin> UserLogins { get; set; }
        public virtual DbSet<User> Users { get; set; }
    }
}
