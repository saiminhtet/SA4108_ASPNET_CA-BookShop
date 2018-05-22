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

            // Session["eadd"] = "234567@a.com";

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
            User u = ctx.Users.Where(x => x.EmailAddress == emailAddress).First();
            if (u.Passcode == tbx_Password.Text)
            {
                if (tbx_Password.Text == tbx_NewPassword.Text)
                {
                    NotifyUser("New password cannot be the same as old password", "Error");

                    // lbl_Status.Text = "New password cannot be the same as old password";
                    tbx_Password.Text = "";
                    tbx_NewPassword.Text = "";
                    tbx_ConfirmPassword.Text = "";
                }
                else
                {
                    lbl_Status.Text = "Password successfully changed";
                    u.Passcode = tbx_NewPassword.Text;
                    ctx.SaveChanges();
                    Response.Redirect("Home.aspx");
                }
            }
            else
            {
                lbl_Status.Text = "Original password not correct, please try again";
                tbx_Password.Text = "";
                tbx_NewPassword.Text = "";
                tbx_ConfirmPassword.Text = "";
            }
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
        protected void NotifyUser(string msg, string type)
        {
            Page.ClientScript.RegisterStartupScript
                (this.GetType(),
                "toastr_message",
                "toastr.success('" + msg + "', '" + type + "')", true);
        }
    }
}