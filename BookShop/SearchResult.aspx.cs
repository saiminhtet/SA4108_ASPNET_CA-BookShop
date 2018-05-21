using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.Models;
namespace BookShop
{
    public partial class SearchResult : System.Web.UI.Page
    {
        string author;
        string title;
        string category;
        static Cart myCart;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                author = Session["Author"].ToString();
                title = Session["Title"].ToString();
                category = Session["Category"].ToString();
                myCart = new Cart();
            }
           
        }

        public IQueryable<BookList> GetBooksList()
        {

            int categoryId = 0;
            if (category != "" || author != "" || title != "")
            {
                categoryId = Convert.ToInt16(category);
                var resultbooks = Result.GetBooklists(author, title, categoryId);
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