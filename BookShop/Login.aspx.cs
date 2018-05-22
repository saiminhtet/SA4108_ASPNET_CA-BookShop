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

        protected void Login11_Authenticate(object sender, AuthenticateEventArgs e)
        {
            Bookshop ctx = new Bookshop();

            bool isFound = false;
            int count = ctx.Users.Count();
            User[] users = new User[count];
            users = ctx.Users.ToArray();
            for (int i = 0; i < count; i++)
            {
                if (lgn.UserName == users[i].EmailAddress)
                {
                    isFound = true;
                }
            }
            if (isFound == false)
            {
                lgn.UserName = "";
            }
            else
            {
                User u = ctx.Users.Where(x => x.EmailAddress == lgn.UserName).First();
                Session["eadd"] = u.EmailAddress;
                if (u.Passcode != lgn.Password)
                {
                    lgn.UserName = "";
                }
                else if (u.Passcode == lgn.Password && u.UserType == "Owner")
                {
                    Response.Redirect("Dashboard.aspx");
                }
                else if (u.Passcode == lgn.Password && u.UserType == "RUser")
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }

        protected void btn_RecoverPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("RecoverPassword.aspx");
        }

        protected void btn_Signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }
    }
}