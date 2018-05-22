using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Book_Shop.Models;

namespace Book_Shop
{
    public class Cart
    {
        // Class Variables, Properties
        public List<CartItem> itmColl { get; protected set; }

        // Messages
        public const string AddToCartNG = "Failed to add item to cart, please try again.";
        public const string AddToCartOK = "Added item to cart.";

        public Cart()
        {
            itmColl = new List<CartItem>();
        }

        // Service Methods
        public string AddToCart(CartItem itm)
        {
            try
            {
                if (itm != null)
                {
                    bool IsExists = false;
                    foreach (var i in itmColl)
                    {
                        if (i.bkID == itm.bkID)
                        { i.orderQty += itm.orderQty; IsExists = true; break; }
                    }
                    if (!IsExists) itmColl.Add(itm);
                    return AddToCartOK;
                }
                else
                    return AddToCartNG;
            }
            catch (Exception e)
            {
                return AddToCartNG;
            }
        }
        public List<CartItem> GetCartItems()
        {
            try
            {
                if (itmColl.Count != 0)
                {
                    return itmColl;
                }
                else
                    return null;
            }
            catch (Exception e)
            {
                return null;
            }
        }
        public void UpdateCart(CartItem itm)
        {
            foreach (CartItem i in itmColl)
            {
                if (i.bkID == itm.bkID)
                {
                    i.bkTitle = itm.bkTitle;
                    i.orderQty = itm.orderQty;
                    i.unitPrice = itm.unitPrice;
                    break;
                }
            }
        }
        public void RemoveFromCart(int bkID)
        {
            foreach (CartItem i in itmColl)
            {
                if (i.bkID == bkID)
                {
                    itmColl.Remove(i);
                    break;
                }
            }
        }
    }
}