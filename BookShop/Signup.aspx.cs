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
        
        protected void btn_Create_Click(object sender, EventArgs e)
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
                    NotifyUserError("Duplicate email address, please enter another one", "Error");
                    tbx_Email.Text = "";
                    isFound = false;
                }
                else
                {
                    NotifyUser("Account successfully created, please log in", "Successful");
                    User u = new User();
                    u.UserName = tbx_Username.Text;
                    u.UserType = "RUser";
                    u.EmailAddress = tbx_Email.Text;
                    u.Passcode = tbx_Password.Text;
                    u.DateJoined = DateTime.Today;
                    u.Title = "";
                    u.LastName = "";
                    u.FirstName = "";
                    u.ShippingAddress = "";
                    ctx.Users.Add(u);
                    ctx.SaveChanges();
                    tbx_Email.Text = "";
                    tbx_Username.Text = "";
                }
            }
            else
            {
                NotifyUserError("Please fill email address", "Error");
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