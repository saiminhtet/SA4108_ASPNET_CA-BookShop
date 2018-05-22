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
            string[] title = { "Mr", "Ms" };
            if (!IsPostBack)
            {

                DropDownList1.DataSource = title;
                DropDownList1.DataBind();
            }

            //Session["eadd"] = "234567@a.com";
            string emailAddress = (string)Session["eadd"];
            Bookshop ctx = new Bookshop();
            User u = ctx.Users.Where(x => x.EmailAddress == emailAddress).First();

            Bookshop ctx1 = new Bookshop();







            if (Session["First Name"] != null)
            {
                TextBox1.Text = u.FirstName;
            }
            if (Session["Last Name"] != null)
            {
                TextBox2.Text = u.LastName;
            }

            if (Session["Email Address"] != null)
            {
                Label4.Text = u.EmailAddress;
            }
            if (Session["Shipping Address"] != null)
            {

                TextBox3.Text = u.ShippingAddress;
            }
            if (Session["Full Name"] != null)
            {
                Label6.Text = Session["Full Name"].ToString();
            }

            //if (Session["Card Number"] != null)
            //{
            //    Label7.Text = Session["Card Number"].ToString();
            //}
            //if (Session["Expiry Date"] != null)
            //{
            //    Label8.Text = Session["Expiry Date"].ToString();
            //}






        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {
            string title = DropDownList1.SelectedValue;
            string fname = TextBox1.Text;
            string lname = TextBox2.Text;
            string add = TextBox3.Text;
            SqlConnection connection;
            SqlDataAdapter adapter = new SqlDataAdapter();
            string connetionString = "Data Source=(local);Initial Catalog=Bookshop;Integrated Security=True";
            connection = new SqlConnection(connetionString);
            string sql = String.Format("UPDATE Users SET Title='" + DropDownList1.SelectedValue + "',FirstName='" + TextBox1.Text + "', LastName='" + TextBox2.Text + "', ShippingAddress='" + TextBox3.Text +"'");
            //"values('{0}','{1}','{2}','{3}')";
            //title,fname, lname, add);
            connection.Open();
            adapter.UpdateCommand = new SqlCommand(sql, connection);
            adapter.UpdateCommand.ExecuteNonQuery();
            lbl_Status.Text = "Your profile is updated";
            //DropDownList1.SelectedValue = "";
            //TextBox1.Text = "";
            //TextBox2.Text = "";
            //TextBox3.Text = "";
        } }
    }
