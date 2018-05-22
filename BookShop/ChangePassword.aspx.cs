using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Book_Shop.Models;

namespace Book_Shop
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // this page comes from User Profile page
            Bookshop ctx = new Bookshop();
            string emailAddress = (string)Session["eadd"];
            if (emailAddress == "")
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void btn_Change_Click(object sender, EventArgs e)
        {
            Bookshop ctx = new Bookshop();
            string emailAddress = (string) Session["eadd"];
            // int ID = 2;
            User u = ctx.Users.Where(x => x.EmailAddress == emailAddress).First();
            if (u.Passcode == tbx_Password.Text)
            {
                lbl_Status.Text = "Password successfully changed";
                u.Passcode = tbx_NewPassword.Text;
                ctx.SaveChanges();
                Response.Redirect("Home.aspx");
            }
            else
            {
                lbl_Status.Text = "Password not correct, please try again";
                tbx_Password.Text = "";
                tbx_NewPassword.Text = "";
                tbx_ConfirmPassword.Text = "";
            }
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
    }
}