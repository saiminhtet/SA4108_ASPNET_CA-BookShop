using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Book_Shop.Models;

namespace Book_Shop
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                Bookshop ctx = new Bookshop();
            if (tbx_Email.Text != "")
            {
                bool isFound = false;
                int count = ctx.Users.Count();
                User[] users = new User[count];
                users = ctx.Users.ToArray();
                for (int i = 0; i < count; i++)
                {
                    if (tbx_Email.Text == users[i].EmailAddress)
                    {
                        isFound = true;
                    }
                }
                if (isFound == true)
                {
                    lbl_Status.Text = "Duplicate email address, please enter another one";
                    tbx_Email.Text = "";
                    isFound = false;
                }
                else
                {
                    lbl_Status.Text = "Account successfully created, please log in";
                    User u = new User();
                    u.UserName = tbx_Username.Text;
                    u.UserType = "RUser";
                    u.EmailAddress = tbx_Email.Text;
                    u.Passcode = tbx_Password.Text;
                    u.DateJoined = DateTime.Today;
                    ctx.Users.Add(u);
                    ctx.SaveChanges();
                    tbx_Email.Text = "";
                    tbx_Username.Text = "";
                }
            }
            else
            {
                lbl_Status.Text = "Please fill email address";
            }
            
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btn_GoToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}