using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;
using Book_Shop.Models;

namespace Book_Shop
{
    public partial class home : System.Web.UI.Page
    {
        string selectedISBN;
        static Cart myCart;
        const string bkCoverDir = "~/images/";

        Bookshop ctx = new Bookshop();
        List<Book> bkColl;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bkColl = GetFeaturedColl();
                DisplayFeaturedColl();
                myCart = (Cart)Session["cart"];
            }
        }

        protected void NotifyUser(string msg, string type)
        {
            Page.ClientScript.RegisterStartupScript
                (this.GetType(),
                "toastr_message",
                "toastr.success('" + msg + "', '" + type + "')", true);
        }
        protected void AddItem(int bkID, string title, double price)
        {
            CartItem c = new CartItem(bkID, title, 1, price);
            string temp = myCart.AddToCart(c);
            if (temp == Cart.AddToCartOK)
                NotifyUser("Added item to cart successfully", "Success");
            else if (temp == Cart.AddToCartNG)
                NotifyUser("Unable to add item to cart", "Error");
            Session["cart"] = myCart;
        }
        protected void f1BtnBuy_Click(object sender, EventArgs e)
        {
            string strPrice = f1Price.Text;
            int bkID = GetBkID(f1ISBN.Text);
            string title = f1Title.Text;
            double price = Double.Parse(strPrice.Substring(1, strPrice.Length - 1));
            AddItem(bkID, title, price);
        }

        protected void f2BtnBuy_Click(object sender, EventArgs e)
        {
            string strPrice = f2Price.Text;
            int bkID = GetBkID(f2ISBN.Text);
            string title = f2Title.Text;
            double price = Double.Parse(strPrice.Substring(1, strPrice.Length - 1));
            AddItem(bkID, title, price);
        }

        protected void f3BtnBuy_Click(object sender, EventArgs e)
        {
            string strPrice = f3Price.Text;
            int bkID = GetBkID(f3ISBN.Text);
            string title = f3Title.Text;
            double price = Double.Parse(strPrice.Substring(1, strPrice.Length - 1));
            AddItem(bkID, title, price);
        }

        protected void f4BtnBuy_Click(object sender, EventArgs e)
        {
            string strPrice = f4Price.Text;
            int bkID = GetBkID(f4ISBN.Text);
            string title = f4Title.Text;
            double price = Double.Parse(strPrice.Substring(1, strPrice.Length - 1));
            AddItem(bkID, title, price);
        }

        protected void f5BtnBuy_Click(object sender, EventArgs e)
        {
            string strPrice = f5Price.Text;
            int bkID = GetBkID(f5ISBN.Text);
            string title = f5Title.Text;
            double price = Double.Parse(strPrice.Substring(1, strPrice.Length - 1));
            AddItem(bkID, title, price);
        }

        protected void f6BtnBuy_Click(object sender, EventArgs e)
        {
            string strPrice = f6Price.Text;
            int bkID = GetBkID(f6ISBN.Text);
            string title = f6Title.Text;
            double price = Double.Parse(strPrice.Substring(1, strPrice.Length - 1));
            AddItem(bkID, title, price);
        }

        public List<Book> GetFeaturedColl()
        {
            System.Diagnostics.Debug.WriteLine("new round");
            List<Book> bkColl = new List<Book>();
            Random r = new Random();
            int ind = (int)(r.NextDouble() * (ctx.Books.ToList().Count));
            if (ind == 0) ind += 1;
            bkColl.Add(ctx.Books.ToList()[ind]);
            System.Diagnostics.Debug.WriteLine("index: " + ind);

            bool repeatBool = false;
            int temp;
            Book tempBk;
            while (!repeatBool && bkColl.Count < 6)
            {
                temp = (int)(r.NextDouble() * (ctx.Books.ToList().Count));
                System.Diagnostics.Debug.WriteLine("temp: " + temp);
                if (temp == 0) temp += 1;
                if (ctx.Books.ToList()[temp] != null)
                {
                    tempBk = ctx.Books.ToList()[temp];

                    for (int i = 0; i < bkColl.Count; i++)
                    {
                        System.Diagnostics.Debug.WriteLine("check: " + bkColl[i].BookID);
                        if (tempBk.BookID == bkColl[i].BookID)
                        {
                            repeatBool = true;
                            break;
                        }
                    }
                    if (!repeatBool) bkColl.Add(tempBk);
                    else repeatBool = false;
                }
            }
            return bkColl;
        }
        public string GetCatStr(int catID)
        {
            return ctx.Categories.ToList().Find(x => x.CategoryID == catID).Name.ToUpper();
        }
        public int GetBkID(string isbn)
        {
            return ctx.Books.ToList().Find(x => x.ISBN == isbn).BookID;
        }
        public void DisplayFeaturedColl()
        {
            int i = 0;
            f1Img.ImageUrl = bkCoverDir + bkColl[i].ISBN + ".jpg";
            f1Title.Text = bkColl[i].Title;
            f1Author.Text = bkColl[i].Author;
            f1Cat.Text = GetCatStr(bkColl[i].CategoryID);
            f1Price.Text = $"{bkColl[i].Price:c}";
            f1ISBN.Text = bkColl[i].ISBN;
            i += 1;

            f2Img.ImageUrl = bkCoverDir + bkColl[i].ISBN + ".jpg";
            f2Title.Text = bkColl[i].Title;
            f2Author.Text = bkColl[i].Author;
            f2Cat.Text = GetCatStr(bkColl[i].CategoryID);
            f2Price.Text = $"{bkColl[i].Price:c}";
            f2ISBN.Text = bkColl[i].ISBN;
            i += 1;

            f3Img.ImageUrl = bkCoverDir + bkColl[i].ISBN + ".jpg";
            f3Title.Text = bkColl[i].Title;
            f3Author.Text = bkColl[i].Author;
            f3Cat.Text = GetCatStr(bkColl[i].CategoryID);
            f3Price.Text = $"{bkColl[i].Price:c}";
            f3ISBN.Text = bkColl[i].ISBN;
            i += 1;

            f4Img.ImageUrl = bkCoverDir + bkColl[i].ISBN + ".jpg";
            f4Title.Text = bkColl[i].Title;
            f4Author.Text = bkColl[i].Author;
            f4Cat.Text = GetCatStr(bkColl[i].CategoryID);
            f4Price.Text = $"{bkColl[i].Price:c}";
            f4ISBN.Text = bkColl[i].ISBN;
            i += 1;

            f5Img.ImageUrl = bkCoverDir + bkColl[i].ISBN + ".jpg";
            f5Title.Text = bkColl[i].Title;
            f5Author.Text = bkColl[i].Author;
            f5Cat.Text = GetCatStr(bkColl[i].CategoryID);
            f5Price.Text = $"{bkColl[i].Price:c}";
            f5ISBN.Text = bkColl[i].ISBN;
            i += 1;

            f6Img.ImageUrl = bkCoverDir + bkColl[i].ISBN + ".jpg";
            f6Title.Text = bkColl[i].Title;
            f6Author.Text = bkColl[i].Author;
            f6Cat.Text = GetCatStr(bkColl[i].CategoryID);
            f6Price.Text = $"{bkColl[i].Price:c}";
            f6ISBN.Text = bkColl[i].ISBN;
            i += 1;
        }

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

        protected void f5Img_Click(object sender, ImageClickEventArgs e)
        {
            selectedISBN = f5ISBN.Text;
            Response.Redirect("~/details.aspx?isbn=" + selectedISBN);
        }

        protected void f6Img_Click(object sender, ImageClickEventArgs e)
        {
            selectedISBN = f6ISBN.Text;
            Response.Redirect("~/details.aspx?isbn=" + selectedISBN);
        }
    }
}