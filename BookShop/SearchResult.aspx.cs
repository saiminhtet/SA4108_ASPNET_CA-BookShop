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
        //static string search;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                myCart = (Cart)Session["cart"];
                Session["searchstring"] = Request.QueryString["search"];

                if ((string)Session["addok"] == "true")
                {
                    NotifyUser("Added item to cart successfully", "Success");
                }
                if ((string)Session["addng"] == "true")
                {
                    NotifyUser("Unable to add item to cart", "Error");
                }


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

        protected void NotifyUser(string msg, string type)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.success('" + msg + "', '" + type + "')", true);
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
                    string temp = myCart.AddToCart(c);
                    Session["cart"] = myCart;

                    if (temp == Cart.AddToCartOK)
                    {
                        Session["addok"] = "true";
                        Response.Redirect("~/SearchResult?search=" + (string)Session["searchstring"]);
                    }
                    //NotifyUser("Added item to cart successfully", "Success");
                    else if (temp == Cart.AddToCartNG)
                    {
                        Session["addng"] = "true";
                        Response.Redirect("~/SearchResult?search=" + (string)Session["searchstring"]);
                    }
                    //NotifyUser("Unable to add item to cart", "Error");


                }
            }
        }


    }
}