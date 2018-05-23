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
        Book_Shop.Models.Bookshop ctx = new Book_Shop.Models.Bookshop();

        protected void Page_Load(object sender, EventArgs e)
        {
            myCart = (Cart)Session["cart"];
            if (!IsPostBack)
            {
                string emailAddress = (string)Session["eadd"];
                if (emailAddress == "")
                {
                    btnLogOut.Visible = false;
                    btnUser.Visible = false;
                    btnLogIn.Visible = true;
                    btnSignUp.Visible = true;
                }
                else
                {
                    btnLogOut.Visible = true;
                    btnUser.Visible = true;
                    btnLogIn.Visible = false;
                    btnSignUp.Visible = false;
                    if (ctx.Users.ToList().Find(x => x.EmailAddress == emailAddress) != null)
                        btnUser.Text = ctx.Users.ToList().Find(x => x.EmailAddress == emailAddress).UserName;
                }
                    
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
            Response.Redirect("~/LogIn");
        }

        protected void btnUser_Click(object sender, EventArgs e)
        {
            if ((string)Session["eadd"]!="") Response.Redirect("~/Profile");
        }

        protected void imgCart_Click(object sender, ImageClickEventArgs e)
        {
            Session["cart"] = myCart;
            Response.Redirect("~/MyCart.aspx");
        }

        protected void imgMainBrand_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Home");
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session["eadd"] = ""; // Logs out user
            btnLogOut.Visible = false;
            Response.Redirect("~/Home");
        }
    }
}