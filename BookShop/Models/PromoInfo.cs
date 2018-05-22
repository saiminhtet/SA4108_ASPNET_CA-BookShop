using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_Shop.Models
{
    public class PromoInfo
    {
        public string scope { get; set; }
        public string promoItem { get; set; }
        public string startDate { get; set; }
        public string endDate { get; set; }
        public string discountAmt { get; set; }

        public PromoInfo(string scope, string promoItem, string startDate, string endDate, string discountAmt)
        {
            this.scope = scope;
            this.promoItem = promoItem;
            this.startDate = startDate;
            this.endDate = endDate;
            this.discountAmt = discountAmt;
        }
    }
}