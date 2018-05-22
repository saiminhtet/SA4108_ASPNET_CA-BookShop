using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Shop
{
    public partial class session : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Title"] != null)
            {
                Label1.Text = Session["Title"].ToString();
            }
            if (Session["First Name"] != null)
            {
                Label2.Text = Session["First Name"].ToString();
            }
            if (Session["Last Name"] != null)
            {
                Label3.Text = Session["Last Name"].ToString();
            }

            if (Session["Email Address"] != null)
            {
                Label4.Text = Session["Email Address"].ToString();
            }
            if (Session["Shipping Address"] != null)
            {

                Label5.Text = Session["Shipping Address"].ToString();
            }
            if (Session["Full Name"] != null)
            {
                Label6.Text = Session["Full Name"].ToString();
            }
           
            if (Session["Card Number"] != null)
            {
                Label7.Text = Session["Card Number"].ToString();
            }
            if (Session["Expiry Date"] != null)
            {
                Label8.Text = Session["Expiry Date"].ToString();
            }






            }
    }
}