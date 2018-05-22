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
                tbx_EmailAddress.Text = u.EmailAddress;
                tbx_ShippingAddress.Text = u.ShippingAddress;
            }
        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {
            Bookshop ctx = new Bookshop();
            User u = ctx.Users.Where(x => x.EmailAddress == tbx_EmailAddress.Text).First();

            u.Title = tbx_Title.Text;
            u.FirstName = tbx_FirstName.Text;
            u.LastName = tbx_LastName.Text;
            u.ShippingAddress = tbx_ShippingAddress.Text;

            ctx.SaveChanges();
            NotifyUser("Your profile is updated", "Successful");
            lbl_Status.Text = "Your profile is updated";
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
    }
}
