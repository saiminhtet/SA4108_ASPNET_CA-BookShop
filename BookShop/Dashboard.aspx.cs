using System;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && true)
            {
                DropDownList1.DataSource = BusinessLogic.ByCategory();
                DropDownList1.DataTextField = "Name";
                DropDownList1.DataValueField = "CategoryID";
                DropDownList1.DataBind();
                ListBox1.DataSource = BusinessLogic.AllBooks();
                ListBox1.DataTextField = "Title";
                ListBox1.DataValueField = "BookID";
                ListBox1.DataBind();
                ListBox1.DataSource = BusinessLogic.AllBooks();
                ListBox1.DataTextField = "Author";
                ListBox1.DataValueField = "BookID";
                ListBox1.DataBind();
                bindgrid();
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
            BusinessLogic.updatebooks(bookid,title,catid,isbn,author,stock,price);
            GridView1.EditIndex = -1;
            bindgrid();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string title = TextBox12.Text;
            int catid = Convert.ToInt32(TextBox13.Text);
            string isbn = TextBox14.Text;
            string author = TextBox15.Text;
            int stock = Convert.ToInt32(TextBox16.Text);
            decimal price = Convert.ToDecimal(TextBox21.Text);
            try
            {
                BusinessLogic.AddNewBook(title, catid, isbn, author, stock, price);
            }
            catch (Exception exp)
            {
                Response.Write(exp.ToString());
            }
        }
    }
}