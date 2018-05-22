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
            if (!IsPostBack)
            {
                Session["eadd"] = "234567@a.com";
                string emailAddress = (string)Session["eadd"];
                Bookshop ctx = new Bookshop();
                User u = ctx.Users.Where(x => x.EmailAddress == emailAddress).First();
                tbx_Title.Text = u.Title;
                tbx_FirstName.Text = u.FirstName;
                tbx_LastName.Text = u.LastName;
                tbx_EmailAddress.Text = u.EmailAddress;
                tbx_ShippingAddress.Text = u.ShippingAddress;

                CreditCard cc = ctx.CreditCards.Where(a => a.UserID == u.UserID).First();
                tbx_FullName.Text = cc.FullName;
                tbx_CardNumber.Text = cc.CardNumber;
                tbx_ExpiryMonth.Text = cc.ExpiryMonth.ToString();
                tbx_ExpiryYear.Text = cc.ExpiryYear.ToString();
            }
        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {
            Bookshop ctx = new Bookshop();
            User u = ctx.Users.Where(x => x.EmailAddress == tbx_EmailAddress.Text).First();

            u.FirstName = tbx_FirstName.Text;
            u.LastName = tbx_LastName.Text;
            u.ShippingAddress = tbx_ShippingAddress.Text;
            ctx.SaveChanges();
            //string title = DropDownList1.SelectedValue;
            //string fname = tbx_FirstName.Text;
            //string lname = tbx_LastName.Text;
            //string add = tbx_ShippingAddress.Text;
            //SqlConnection connection;
            //SqlDataAdapter adapter = new SqlDataAdapter();
            //string connetionString = "Data Source=(local);Initial Catalog=Bookshop;Integrated Security=True";
            //connection = new SqlConnection(connetionString);
            //string sql = String.Format("UPDATE Users SET Title='" + DropDownList1.SelectedValue + "',FirstName='" + tbx_FirstName.Text + "', LastName='" + tbx_LastName.Text + "', ShippingAddress='" + tbx_ShippingAddress.Text +"'");
            ////"values('{0}','{1}','{2}','{3}')";
            ////title,fname, lname, add);
            //connection.Open();
            //adapter.UpdateCommand = new SqlCommand(sql, connection);
            //adapter.UpdateCommand.ExecuteNonQuery();
            lbl_Status.Text = "Your profile is updated";
            ////DropDownList1.SelectedValue = "";
            ////TextBox1.Text = "";
            ////TextBox2.Text = "";
            ////TextBox3.Text = "";
        }

        protected void btn_ChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }
    }
    }
