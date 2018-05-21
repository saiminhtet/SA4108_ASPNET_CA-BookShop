using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Book_Shop.Models;
namespace Book_Shop
{
    public partial class RecoverPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            Bookshop ctx = new Bookshop();

            bool isFound = false;
            int count = ctx.Users.Count();
            User[] users = new User[count];
            users = ctx.Users.ToArray();
            for (int i = 0; i < count; i++)
            {
                if (tbx_Email.Text == users[i].EmailAddress.ToString())
                {
                    isFound = true;
                }
            }
            if (isFound == false)
            {
                Response.Write("<script>alert('User not found, please try again');</script>");
                tbx_Email.Text = "";
            }
            else
            {
                // send an email contain password to the user
                Response.Write("<script>alert('Please check your mail box for password');</script>");
                Response.Redirect("Login.aspx");
            }
        }
    }
}