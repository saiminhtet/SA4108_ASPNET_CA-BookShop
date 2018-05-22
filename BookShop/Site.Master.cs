using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Shop
{
    public partial class SiteMaster : MasterPage
    {
        static Cart myCart;
        string searchText;
        string userName;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                myCart = (Cart)Session["cart"];
            }
        }

        protected void imgPowerSearch_Click(object sender, ImageClickEventArgs e)
        {
            searchText = tbxSearch.Text;
            Response.Redirect("~/SearchResult?search=" + searchText);
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SignUp");
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            // Response.Redirect("~/LogIn");
            // IIdentity id = User.Identity;
            userName = "Alice Kiong"; //id.Name;
            btnUser.Text = userName;
            btnUser.Visible = true;
            btnSignUp.Visible = false;
            btnLogIn.Visible = false;
        }

        protected void btnUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Profile");
        }

        protected void imgCart_Click(object sender, ImageClickEventArgs e)
        {
            Session["cart"] = myCart;
            Response.Redirect("~/MyCart.aspx");
        }
    }
}