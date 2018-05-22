using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Book_Shop.Models;

namespace Book_Shop
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_RecoverPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("RecoverPassword.aspx");
        }

        protected void btn_Signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            Bookshop ctx = new Bookshop();

            bool isFound = false;
            int count = ctx.Users.Count();
            User[] users = new User[count];
            users = ctx.Users.ToArray();
            for (int i = 0; i < count; i++)
            {
                if (tbx_EmailAdress.Text == users[i].EmailAddress)
                {
                    isFound = true;
                }
            }
            if (isFound == false)
            {
                tbx_EmailAdress.Text = "";
                tbx_Password.Text = "";
                lbl_Status.Text = "Wrong email address or password, please try again";
            }
            else
            {
                User u = ctx.Users.Where(x => x.EmailAddress == tbx_EmailAdress.Text).First();
                Session["eadd"] = u.EmailAddress;
                if (u.Passcode != tbx_Password.Text)
                {
                    tbx_EmailAdress.Text = "";
                    tbx_Password.Text = "";
                    lbl_Status.Text = "Wrong email address or password, please try again";
                }
                else
                {
                    if (u.Passcode == tbx_Password.Text && u.UserType == "Owner")
                        Response.Redirect("Dashboard.aspx");
                    else if (u.Passcode == tbx_Password.Text && u.UserType == "RUser")
                        Response.Redirect("Home.aspx");
                }
            }
        }
    }
}