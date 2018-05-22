using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using Book_Shop.Models;
namespace Book_Shop
{
    public partial class SearchResult : System.Web.UI.Page
    {
        static Cart myCart;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                myCart = (Cart)Session["cart"];
            }
        }

        public IQueryable<BookList> GetBooksList([QueryString("search")] string searchquery)
        {
            if (searchquery != "" && searchquery != null)
            {
                var resultbooks = Result.GetBooklists(searchquery);
                return resultbooks;
            }

            var books = Result.GetBooklistAll();
            return books;

        }

        protected void lvbooklist_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                if (e.CommandArgument.ToString() != "")
                {
                    Bookshop _db = new Bookshop();

                    int bookId = Convert.ToInt16(e.CommandArgument);
                    var book = _db.Books.Find(bookId);
                    string title = book.Title;
                    double price = Double.Parse(book.Price.ToString());
                    CartItem c = new CartItem(bookId, title, 1, price);
                    myCart.AddToCart(c);

                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["cart"] = myCart;
            Response.Redirect("~/MyCart.aspx");
        }
    }
}