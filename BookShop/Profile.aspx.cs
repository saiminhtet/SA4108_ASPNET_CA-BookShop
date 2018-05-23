using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Book_Shop.Models;
using System.Data;
using System.Data.SqlClient;

namespace Book_Shop
{
    public partial class session : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Bookshop ctx = new Bookshop();
            string emailAddress = (string)Session["eadd"];
            if (emailAddress == "")
            {
                Response.Redirect("Home.aspx");
            }

            if (!IsPostBack)
            {
                emailAddress = (string)Session["eadd"];
                User u = ctx.Users.Where(x => x.EmailAddress == emailAddress).First();
                tbx_Title.Text = u.Title;
                tbx_FirstName.Text = u.FirstName;
                tbx_LastName.Text = u.LastName;
                lbl_EmailAddress.Text = u.EmailAddress;
                tbx_ShippingAddress.Text = u.ShippingAddress;
                tbx_UserName.Text = u.UserName;

                if ((string)Session["profileChanged"] == "true")
                {
                    NotifyUser("Your profile is updated", "Successful");
                }
            }
        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {
            Bookshop ctx = new Bookshop();
            User u = ctx.Users.Where(x => x.EmailAddress == lbl_EmailAddress.Text).First();

            u.Title = tbx_Title.Text;
            u.FirstName = tbx_FirstName.Text;
            u.LastName = tbx_LastName.Text;
            u.ShippingAddress = tbx_ShippingAddress.Text;
            u.UserName = tbx_UserName.Text;

            ctx.SaveChanges();
            Session["profileChanged"] = "true";
            NotifyUser("Your profile is updated", "Successful");
            Response.Redirect("Profile.aspx");
        }

        protected void btn_ChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }

        protected void NotifyUser(string msg, string type)
        {
            Page.ClientScript.RegisterStartupScript
                (this.GetType(),
                "toastr_message",
                "toastr.success('" + msg + "', '" + type + "')", true);
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(5000);
            Response.Redirect("Home.aspx");
        }
    }
}
