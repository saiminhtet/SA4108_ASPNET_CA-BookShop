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
                    NotifyUserError("New password cannot be the same as old password", "Error");
                    tbx_Password.Text = "";
                    tbx_NewPassword.Text = "";
                    tbx_ConfirmPassword.Text = "";
                }
                else
                {
                    NotifyUser("Password successfully changed", "Successful");
                    u.Passcode = tbx_NewPassword.Text;
                    ctx.SaveChanges();
                }
            }
            else
            {
                NotifyUserError("Original password not correct, please try again", "Error");
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
        protected void NotifyUserError(string msg, string type)
        {
            Page.ClientScript.RegisterStartupScript
                (this.GetType(),
                "toastr_message",
                "toastr.error('" + msg + "', '" + type + "')", true);
        }
    }
}