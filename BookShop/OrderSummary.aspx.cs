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
        static int userid;
        static Cart myCart;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                userid = 2;
                Session["eadd"] = "234567@a.com";
                useremail = Session["eadd"].ToString();                
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
                User userdetail = entities.Users.Where(u => u.EmailAddress == email).First<User>();
                lblshippingaddress.Text = userdetail.ShippingAddress;
                lblcustname.Text = userdetail.Title +"."+ userdetail.FirstName + userdetail.LastName;            
                lblemail.Text = userdetail.EmailAddress;
            }            
            
        }


       



       
    }
}