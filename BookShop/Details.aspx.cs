using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Book_Shop.Models;
namespace Book_Shop
{
    public partial class details : System.Web.UI.Page
    {
        List<Book> bkColl;
        static Cart myCart;
        Book b;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                myCart = (Cart)Session["cart"];
                string isbn = Request.QueryString["isbn"];

                Bookshop ctx = new Bookshop();
                if (isbn == null)
                    b = ctx.Books.ToList().First();
                else
                    b = ctx.Books.Where(x => x.ISBN == isbn).First();

                //Book image
                imgBook.ImageUrl = "~/images/" + b.ISBN + ".jpg";
                //Book title
                lblBname.Text = b.Title;
                //Book author
                lblBauthor.Text = b.Author;
                //Book original price
                lblOprice.Text = "S$" + b.Price.ToString();
                //Book stock
                if (b.Stock > 0)
                {
                    lblStock.Text = b.Stock.ToString() + " copies available";
                }
                else
                {
                    lblStock.Text = "Not Available Now";
                    btnAddCart.Visible = false;
                }
                //Book ISBN
                lblIsbn.Text = b.ISBN;


                //Book Category
                int cid = b.CategoryID;
                Category c = ctx.Categories.Where(x => x.CategoryID == cid).First();
                lblCategory.Text = c.Name;

                //Sam's method
                bkColl = GetRelatedColl();
                DisplayRelatedColl();
            }
            
        }

        //Related books recommendation --- Sam's code
        Bookshop ctx = new Bookshop();
        //List<Book> bkColl;
        public List<Book> GetRelatedColl()
        {
            List<Book> bkColl = new List<Book>();
            Random r = new Random();
            int ind = (int)(r.NextDouble() * (ctx.Books.ToList().Count));
            if (ind == 0) ind += 1;
            bkColl.Add(ctx.Books.ToList()[ind]);

            bool repeatBool = false;
            int temp;
            Book tempBk;
            while (!repeatBool && bkColl.Count < 4)
            {
                temp = (int)(r.NextDouble() * (ctx.Books.ToList().Count));
                if (temp == 0) temp += 1;
                tempBk = ctx.Books.ToList()[temp];
                for (int i = 0; i < bkColl.Count; i++)
                {
                    if (tempBk.BookID == bkColl[i].BookID)
                    {
                        repeatBool = true;
                        break;
                    }
                }
                if (!repeatBool) bkColl.Add(tempBk);
                else repeatBool = false;
            }
            return bkColl;
        }

        //Display the related book --- Sam's code
        public string GetCatStr(int catID)
        {
            return ctx.Categories.ToList().Find(x => x.CategoryID == catID).Name.ToUpper();
        }

        public void DisplayRelatedColl()
        {
            int i = 0;
            f1Img.ImageUrl = "~/images/" + bkColl[i].ISBN + ".jpg";
            f1Title.Text = bkColl[i].Title;
            f1Author.Text = bkColl[i].Author;
            f1Cat.Text = GetCatStr(bkColl[i].CategoryID);
            f1Price.Text = $"{bkColl[i].Price:c}";
            f1ISBN.Text = bkColl[i].ISBN;
            i += 1;

            f2Img.ImageUrl = "~/images/" + bkColl[i].ISBN + ".jpg";
            f2Title.Text = bkColl[i].Title;
            f2Author.Text = bkColl[i].Author;
            f2Cat.Text = GetCatStr(bkColl[i].CategoryID);
            f2Price.Text = $"{bkColl[i].Price:c}";
            f2ISBN.Text = bkColl[i].ISBN;
            i += 1;

            f3Img.ImageUrl = "~/images/" + bkColl[i].ISBN + ".jpg";
            f3Title.Text = bkColl[i].Title;
            f3Author.Text = bkColl[i].Author;
            f3Cat.Text = GetCatStr(bkColl[i].CategoryID);
            f3Price.Text = $"{bkColl[i].Price:c}";
            f3ISBN.Text = bkColl[i].ISBN;
            i += 1;

            f4Img.ImageUrl = "~/images/" + bkColl[i].ISBN + ".jpg";
            f4Title.Text = bkColl[i].Title;
            f4Author.Text = bkColl[i].Author;
            f4Cat.Text = GetCatStr(bkColl[i].CategoryID);
            f4Price.Text = $"{bkColl[i].Price:c}";
            f4ISBN.Text = bkColl[i].ISBN;
            i += 1;
        }

        //click on image to go to book details page
        string selectedISBN;
        protected void f1Img_Click(object sender, ImageClickEventArgs e)
        {
            selectedISBN = f1ISBN.Text;
            Response.Redirect("~/details.aspx?isbn=" + selectedISBN);
        }

        protected void f2Img_Click(object sender, ImageClickEventArgs e)
        {
            selectedISBN = f2ISBN.Text;
            Response.Redirect("~/details.aspx?isbn=" + selectedISBN);
        }

        protected void f3Img_Click(object sender, ImageClickEventArgs e)
        {
            selectedISBN = f3ISBN.Text;
            Response.Redirect("~/details.aspx?isbn=" + selectedISBN);
        }

        protected void f4Img_Click(object sender, ImageClickEventArgs e)
        {
            selectedISBN = f4ISBN.Text;
            Response.Redirect("~/details.aspx?isbn=" + selectedISBN);
        }

        protected void NotifyUser(string msg, string type)
        {
            Page.ClientScript.RegisterStartupScript
                (this.GetType(),
                "toastr_message",
                "toastr.success('" + msg + "', '" + type + "')", true);
        }
        protected void AddItem(int bkID, string title, int qty, double price)
        {
            CartItem c = new CartItem(bkID, title, qty, price);
            string temp = myCart.AddToCart(c);
            if (temp == Cart.AddToCartOK)
                NotifyUser("Added item to cart successfully", "Success");
            else if (temp == Cart.AddToCartNG)
                NotifyUser("Unable to add item to cart", "Error");
            Session["cart"] = myCart;
        }
        public int GetBkID(string isbn)
        {
            return ctx.Books.ToList().Find(x => x.ISBN == isbn).BookID;
        }
        protected void btnAddCart_Click(object sender, EventArgs e)
        {
            string strPrice = f4Price.Text;
            int bkID = GetBkID(f4ISBN.Text);
            string title = f4Title.Text;
            double price = Double.Parse(strPrice.Substring(1, strPrice.Length - 1));
            int qty = Convert.ToInt32(txbCopies.Text);
            AddItem(bkID, title, qty, price);

            ////Limit the copy number a customer can buy according to the stock
            //string bkID = Request.QueryString["BookID"];
            //int bookID = Convert.ToInt32(bkID);
            ////string isbn = "9780385376716"; //FOR TESTING ONLY 
            //Bookshop ctx = new Bookshop();
            //Book b = ctx.Books.Where(x => x.BookID == bookID).First();
            //int oStock = b.Stock;
            //int copy = Convert.ToInt32(txbCopies.Text); //this "copy" refers to how many books the customer want to buy
            //if (copy <= oStock && copy > 0)
            //{
            //    //Add to cart
            //    string bkPrice = lblOprice.Text;
            //    double totalPrice = Double.Parse(bkPrice)*copy;
            //    //int bookID = b.BookID;
            //    string bktitle = lblBname.Text;
            //    CartItem c = new CartItem(bookID, bktitle, copy, totalPrice);
            //    myCart.AddToCart(c);
            //    Session["cart"] = myCart;

            //    lblAddCartReminder.Text = "Already Added Into Your Cart";
            //}
            //else
            //{
            //    lblAddCartReminder.Text = "Please enter a number less than the available copies.";
            //}

        }

    }
}