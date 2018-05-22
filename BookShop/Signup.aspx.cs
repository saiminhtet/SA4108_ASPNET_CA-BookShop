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
            if (tbx_Username.Text != "" && tbx_Email.Text != "" && tbx_Password.Text != "" && tbx_Password.Text == tbx_PasswordConfirmation.Text)
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
                    //Response.Write("<script>alert('Duplicate email address, please enter another one');</script>");
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
                }
            }
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}