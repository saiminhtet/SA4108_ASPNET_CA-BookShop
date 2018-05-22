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


        protected void Page_Load(object sender, EventArgs e)
        {
            //string isbn = Request.QueryString["ISBN"];
            string isbn = "9780385376716"; //FOR TESTING ONLY 

            //Book image
            imgBook.ImageUrl = "/images/" + isbn + ".jpg";

            Bookshop ctx = new Bookshop();
            Book b = ctx.Books.Where(x => x.ISBN == isbn).First();

            //Book title
            lblBname.Text = b.Title;
            //Book author
            lblBauthor.Text = b.Author;
            //Book original price
            lblOprice.Text = b.Price.ToString();
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
            lblIsbn.Text = isbn;
            //Book Category
            int cid = b.CategoryID;
            Category c = ctx.Categories.Where(x => x.CategoryID == cid).First();
            lblCategory.Text = c.Name;
        }


        Bookshop ctx = new Bookshop();
        List<Book> bkColl;

        //Related books recommendation --- Sam's code   
        public List<Book> GetRelatedColl()
        {
            List<Book> bkColl = new List<Book>();
            Random r = new Random();
            int ind = (int)(r.NextDouble() * (ctx.Books.ToList().Count));
            if (ind == 0) ind += 1;
            bkColl.Add(ctx.Books.ToList().Find(x => x.BookID == ind));

            bool repeatBool = false;
            int temp;
            Book tempBk;
            while (!repeatBool && bkColl.Count < 4)
            {
                temp = (int)(r.NextDouble() * (ctx.Books.ToList().Count));
                if (temp == 0) temp += 1;
                tempBk = ctx.Books.ToList().Find(x => x.BookID == temp);
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

        //display method
        public string GetCatStr(int catID)
        {
            return ctx.Categories.ToList().Find(x => x.CategoryID == catID).Name.ToUpper();
        }


        public void DisplayFeaturedColl()
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

        string selectedISBN;

        protected void f1Img_Click(object sender, ImageClickEventArgs e)
        {
            selectedISBN = f1ISBN.Text;
            Response.Redirect("~/details?id=" + selectedISBN);
        }

        protected void f2Img_Click(object sender, ImageClickEventArgs e)
        {
            selectedISBN = f2ISBN.Text;
            Response.Redirect("~/details?id=" + selectedISBN);
        }

        protected void f3Img_Click(object sender, ImageClickEventArgs e)
        {
            selectedISBN = f3ISBN.Text;
            Response.Redirect("~/details?id=" + selectedISBN);
        }

        protected void f4Img_Click(object sender, ImageClickEventArgs e)
        {
            selectedISBN = f4ISBN.Text;
            Response.Redirect("~/details?id=" + selectedISBN);
        }





        protected void btnAddCart_Click(object sender, EventArgs e)
        {
            ////Modify book stock
            ////string isbn = Request.QueryString["ISBN"];
            //string isbn = "9780385376716"; //FOR TESTING ONLY 
            //Bookshop ctx = new Bookshop();
            //Book b = ctx.Books.Where(x => x.ISBN == isbn).First();
            //int oStock = b.Stock;
            //int copy = Convert.ToInt32(txbCopies.Text); //this "copy" refers to how many books the customer want to buy
            //if(copy<=oStock&&copy>0)
            //{
            //    int stock = oStock - copy;
            //    b.Stock = stock;
            //    ctx.SaveChanges();

                //Add order information to Cart, goes to Cart Page
                //Response.Redirect("~");


            //}
            //else
            //{
            //    lblStockReminder.Text = "There is only " + oStock + "left.";
            //}



        }
    }
}