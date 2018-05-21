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
        }

        protected void btn_Change_Click(object sender, EventArgs e)
        {
            Bookshop ctx = new Bookshop();
            int ID = (int) Session["UserID"];
            // int ID = 2;
            User u = ctx.Users.Where(x => x.UserID == ID).First();
            if (u.Passcode == tbx_Password.Text)
            {
                Response.Write("<script>alert('Password successfully changed');</script>");
                u.Passcode = tbx_NewPassword.Text;
                ctx.SaveChanges();
                Response.Redirect("Home.aspx");
            }
            else
            {
                Response.Write("<script>alert('Password not correct, please try again');</script>");
                tbx_Password.Text = "";
                tbx_NewPassword.Text = "";
                tbx_ConfirmPassword.Text = "";
            }
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}