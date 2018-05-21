using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Shop
{
    public partial class CheckOut : System.Web.UI.Page
    {
        
        static Cart myCart = new Cart();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DDL_Month_Year_Bind();
                myCart = (Cart)Session["cart"];
                BindGrid();
            }  
            
        }

        private void BindGrid()
        {
            lvorder.DataSource = myCart.GetCartItems();
            lvorder.DataBind();
        }

        private void DDL_Month_Year_Bind()
        {
            DateTimeFormatInfo info = DateTimeFormatInfo.GetInstance(null);

            for (int i = 1; i < 13; i++)
            {
                ddlexpmonth.Items.Add(new ListItem(info.GetMonthName(i), i.ToString()));
            }

            for (int j = 2018; j < 2030; j++)
            {
                ddlexpyear.Items.Add(new ListItem(j.ToString()));
            }
        }

        protected void btn_purchase_Click(object sender, EventArgs e)
        {
           
        }
    }
}