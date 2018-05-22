using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                useremail = Session["eadd"].ToString();                
                myCart = (Cart)Session["cart"];
                BindGrid();
            }
        }
        private void BindGrid()
        {
            lvorder.DataSource = myCart.GetCartItems();
            lvorder.DataBind();
        }
    }
}