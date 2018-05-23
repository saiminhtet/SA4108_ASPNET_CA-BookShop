using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Book_Shop.Models;
namespace Book_Shop
{
    public partial class OrderSummary : System.Web.UI.Page
    {
        static string useremail;
        static User usr;
        static Cart myCart;
        Bookshop ctx = new Bookshop();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                useremail = Session["eadd"].ToString();
                usr = ctx.Users.Where(x => x.EmailAddress == useremail).First();
                myCart = (Cart)Session["cart"];
                BindGrid();
                AddShippinginfo(useremail);
            }
        }
        private void BindGrid()
        {           
            lvorder.DataSource = myCart.GetCartItems();
            lvorder.DataBind();
        }

        private void AddShippinginfo(string email)
        {
            using (Bookshop entities = new Bookshop())
            {
                if (usr.ShippingAddress == "")
                {
                    usr.ShippingAddress = "123 ISS NUS, Singapore 123456";
                    usr.LastName = "user";
                    usr.FirstName = "user";
                    usr.Title = "Mr";
                }
                lblshippingaddress.Text = usr.ShippingAddress;
                lblcustname.Text = usr.Title +"."+ usr.FirstName + usr.LastName;            
                lblemail.Text = usr.EmailAddress;
            }            
            
        }


       



       
    }
}