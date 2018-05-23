using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Book_Shop.Models;
namespace Book_Shop
{
    public partial class CheckOut : System.Web.UI.Page
    {
        static string useremail;
        static int userid;

        static Cart myCart;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bookshop ctx = new Bookshop();
                useremail = Session["eadd"].ToString();
                if (useremail == null) Response.Redirect("~/Login.aspx");
                if (ctx.Users.ToList().Find(x => x.EmailAddress == useremail) != null)
                {
                    userid = ctx.Users.ToList().Find(x => x.EmailAddress == useremail).UserID;
                    CheckExistingCredit(userid);
                    DDL_Month_Year_Bind();
                    myCart = (Cart)Session["cart"];
                    BindGrid();
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                    //Session["lastPage"] = this.Page.Title;
                }
            }

        }

        private void BindGrid()
        {
            lvorder.DataSource = myCart.GetCartItems();
            lvorder.DataBind();
        }

        private void CheckExistingCredit(int userid)
        {
            List<CreditCard> Cards = CheckOutProcess.GetCreditCard(userid);
            if (Cards.Count == 0)
            {
                btn_checkout_cardn0.Visible = false;
            }
            else
            {

                RadioButtonListCCard.DataSource = Cards.ToList();
                RadioButtonListCCard.DataTextField = "CardNumber";
                RadioButtonListCCard.DataValueField = "CardID";
                RadioButtonListCCard.DataBind();

                btn_checkout.Visible = false;
            }
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

        private void ClearText()
        {
            txt_card_no.Text = "";
            txt_cvc.Text = "";
            txt_holdername.Text = "";
            ddlexpmonth.SelectedValue = "1";
            ddlexpyear.SelectedValue = "2018";
        }
        protected void btn_purchase_Click(object sender, EventArgs e)
        {
            bool cvcIsInt = false;
            int cvc;
            cvcIsInt = Int32.TryParse(txt_cvc.Text, out cvc);
            if (cvcIsInt)
            {
                string name = txt_holdername.Text;
                string cardno = txt_card_no.Text;
                int month = Int16.Parse(ddlexpmonth.SelectedValue);
                int year = Int16.Parse(ddlexpyear.SelectedValue);
                cvc = Int16.Parse(txt_cvc.Text);

                try
                {
                    CheckOutProcess.AddCardInfo(userid, name, cardno, month, year, cvc);
                    ClearText();

                }
                catch (Exception exp)
                {
                    Response.Write(exp.ToString());
                }
                Session["cardno"] = cardno;
                Response.Redirect("~/OrderSummary.aspx");
            }
            else
            {
                txt_cvc.Text = "";
            }
        }     

        protected void btnbtn_selectcard_Click(object sender, EventArgs e)
        {
            string cardno = RadioButtonListCCard.SelectedItem.ToString();
            Session["cardno"] = cardno;
            Response.Redirect("~/OrderSummary.aspx");
        }
    }
}