using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_Shop
{
    public class CartItem
    {
        // Class Variables, Properties
        public int bkID { get; set; }
        public string bkTitle { get; set; }
        public int orderQty { get; set; }
        public double unitPrice { get; set; }

        public CartItem(int id, string title, int qty, double price)
        {
            bkID = id;
            bkTitle = title;
            orderQty = qty;
            unitPrice = price;
        }
    }
}