using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookShop.Models;
namespace BookShop
{
    public partial class _Default : Page
    {
        static string author;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                author = Session["Author"].ToString();



            }

        }

        //public List<Book> GetBooksList()
        //{

        //    //List<Book> books = Result.GetBooklists(author).ToList();
        //    //return books;
        //}

    }
}