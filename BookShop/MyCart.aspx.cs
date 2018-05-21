using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookShop
{
    public partial class MyCart : System.Web.UI.Page
    {
        int qty;
        static Cart myCart;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                myCart = (Cart)Session["cart"];
                BindGrid();
            }
        }
        private void BindGrid()
        {
            gvCart.DataSource = myCart.GetCartItems();
            gvCart.DataBind();
        }
        protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow &&
            (e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                TextBox tbx = e.Row.FindControl("TextBox1") as TextBox;
                if (tbx != null) tbx.Text = qty.ToString();
            }
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow row = gvCart.Rows[e.NewEditIndex];
            qty = Convert.ToInt32((row.FindControl("Label3") as Label).Text);
            gvCart.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvCart.Rows[e.RowIndex];
            int bkID = Convert.ToInt32(gvCart.DataKeys[e.RowIndex].Values[0]);
            string title = (row.FindControl("Label2") as Label).Text;
            qty = Convert.ToInt32((row.FindControl("TextBox1") as TextBox).Text);
            double price = double.Parse((row.FindControl("Label4") as Label).Text);
            CartItem itm = new CartItem(bkID, title, qty, price);
            myCart.UpdateCart(itm);
            gvCart.EditIndex = -1;
            BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            gvCart.EditIndex = -1;
            BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int bkID = Convert.ToInt32(gvCart.DataKeys[e.RowIndex].Values[0]);
            myCart.RemoveFromCart(bkID);
            BindGrid();
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Session["cart"] = myCart;
            Response.Redirect("~/Checkout");
        }
    }
}