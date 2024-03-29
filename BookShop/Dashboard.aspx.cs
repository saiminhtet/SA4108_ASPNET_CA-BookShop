﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Book_Shop.Models;
namespace Book_Shop
{
    public partial class Dashboard : System.Web.UI.Page
    {
        public object Table1 { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdatePanel1.Visible = false;
                UpdatePanel2.Visible = false;
                GridView1.Visible = false;
                bindgrid();
                Button1.Visible = false;
            }
        }

        private void bindgrid()
        {
            GridView1.DataSource = BusinessLogic.AllBooks();
            GridView1.DataBind();
        }
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int BookID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            BusinessLogic.deletebook(BookID);
            bindgrid();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            bindgrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            bindgrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int bookid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            decimal price = Convert.ToDecimal((row.FindControl("TextBox1") as TextBox).Text);
            int stock = Convert.ToInt32((row.FindControl("TextBox2") as TextBox).Text);
            string author = (row.FindControl("TextBox3") as TextBox).Text;
            string isbn = (row.FindControl("TextBox4") as TextBox).Text;
            int catid = Convert.ToInt32((row.FindControl("TextBox5") as TextBox).Text);
            string title = (row.FindControl("TextBox6") as TextBox).Text;
            BusinessLogic.updatebooks(bookid, title, catid, isbn, author, stock, price);
            GridView1.EditIndex = -1;
            bindgrid();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string title = TextBox12.Text;
            int catid = Convert.ToInt32(TextBox13.Text);
            string fName = FileUpload1.FileName;
            string isbn = "NA";
            if (fName != null) isbn = fName.Substring(0,fName.Length - 4); // TextBox14.Text;
            string author = TextBox15.Text;
            int stock = Convert.ToInt32(TextBox16.Text);
            decimal price = Convert.ToDecimal(TextBox21.Text);
            if (FileUpload1.HasFile)
            {
                Label12.Text = "Image Uploaded";
                Label12.ForeColor = System.Drawing.Color.ForestGreen;
                try
                {
                    FileUpload1.SaveAs(Server.MapPath("images/") + fName);
                    Response.Clear();
                    try
                    {
                        BusinessLogic.AddNewBook(title, catid, isbn, author, stock, price);
                        Response.Clear();
                    }
                    catch (Exception exp)
                    {
                        Response.Write(exp.ToString());
                        Response.Clear();
                    }
                    List<Book> q = new List<Book>();
                    q.Add(BusinessLogic.AllBooks().Last());
                    GridView3.DataSource = q;
                    GridView3.DataBind();
                    bindgrid();
                    GridView3.Visible = true;
                    Response.Clear();
                }
                catch (Exception exp)
                {
                    Response.Write(exp.ToString());
                    Response.Clear();
                }
            }
            else
            {
                Label12.Text = "Please Select your file";
                Label12.ForeColor = System.Drawing.Color.Red;
                Response.Clear();
            }
            Response.Clear();
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string temp = RadioButtonList1.SelectedValue;
            if (temp == "Title")
            {
                ListBox1.Visible = true;
                ListBox1.DataSource = BusinessLogic.AllBooks();
                ListBox1.DataTextField = "Title";
                ListBox1.DataValueField = "BookID";
                ListBox1.DataBind();
            }
            if (temp == "Author")
            {
                ListBox1.Visible = true;
                ListBox1.DataSource = BusinessLogic.AllBooks();
                ListBox1.DataTextField = "Author";
                ListBox1.DataValueField = "BookID";
                ListBox1.DataBind();
            }
            if (temp == "Category")
            {
                ListBox1.Visible = true;
                ListBox1.DataSource = BusinessLogic.ByCategory();
                ListBox1.DataTextField = "Name";
                ListBox1.DataValueField = "CategoryID";
                ListBox1.DataBind();
            }
            if (temp=="Storewide")
            {
                ListBox1.Visible = false;
            }
            TextBox17.Visible = true;
            TextBox18.Visible = true;
            TextBox20.Visible = true;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            foreach (var i in ListBox1.GetSelectedIndices())
            {
                string Scope = RadioButtonList1.SelectedValue;
                string PromotionalItem = ListBox1.Items[i].ToString();
                if (Scope == "Storewide") PromotionalItem = "N/A";
                DateTime StartDate = Convert.ToDateTime(TextBox17.Text);
                DateTime EndDate = Convert.ToDateTime(TextBox18.Text);
                int Discount = Convert.ToInt32(TextBox20.Text);
                BusinessLogic.adddiscount(Scope, PromotionalItem, StartDate, EndDate, Discount);

                var promotionlist = BusinessLogic.GetPromotionbyScope(Scope);

                GridView2.DataSource = promotionlist;
                GridView2.DataBind();
               
            }


        }

        protected void Add_Btn_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            UpdatePanel1.Visible = true;
            UpdatePanel2.Visible = false;
            Button1.Visible = true;
        }

        protected void MngBook_Btn_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            GridView3.Visible = false;
            UpdatePanel1.Visible = false;
            UpdatePanel2.Visible = false;
            Button1.Visible = false;
        }

        protected void MngPromo_Btn_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView3.Visible = false;
            UpdatePanel2.Visible = true;
            UpdatePanel1.Visible = false;
            Button1.Visible = false;
        }
    }
}