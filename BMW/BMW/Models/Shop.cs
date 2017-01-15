using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BMW.Models
{
    public class Shop
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Logo { get; set; }
        public string Email { get; set; }
        public string UrlWeb { get; set; }
        public string Phone { get; set; }
        public string Description { get; set; }
    }
}