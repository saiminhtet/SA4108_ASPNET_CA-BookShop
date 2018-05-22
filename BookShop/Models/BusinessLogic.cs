using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Book_Shop.Models;

namespace Book_Shop
{
    public class BusinessLogic
    {
        public static void AddNewBook(string title, int catid, string isbn, string author, int stock, decimal price)
        {
            using (Bookshop entities = new Bookshop())
            {
                Book book = new Book()
                {
                    Title = title,
                    CategoryID = catid,
                    ISBN = isbn,
                    Author = author,
                    Stock = stock,
                    Price = price,
                };
                entities.Books.Add(book);
                entities.SaveChanges();
            }
        }

        public static List<Book> AllBooks()
        {
            using (Bookshop entities = new Bookshop())
            {
                return entities.Books.ToList<Book>();
            }
        }

        public static List<Category> ByCategory()
        {
            using (Bookshop entities = new Bookshop())
            {
                return entities.Categories.ToList<Category>();
            }
        }

        public static void updatebooks(int bookid, string title, int catid, string isbn, string author, int stock, decimal price)
        {
            using (Bookshop entities = new Bookshop())
            {
                Book book = entities.Books.Where(p => p.BookID == bookid).First<Book>();
                book.Title = title;
                book.ISBN = isbn;
                book.CategoryID = catid;
                book.Author = author;
                book.Stock = stock;
                book.Price = price;
                entities.SaveChanges();
            }
        }

        public static void deletebook(int bookid)
        {
            using (Bookshop entities = new Bookshop())
            {
                Book book = entities.Books.Where(p => p.BookID == bookid).First<Book>();
                entities.Books.Remove(book);
                entities.SaveChanges();
            }
        }

        public static void adddiscount(int promoid, string promoitem, DateTime startdate, DateTime enddate, int discountamt)
        {
            using (Bookshop entities = new Bookshop())
            {
                Promotion promotion = entities.Promotions.Where(x => x.PromoID == promoid).First<Promotion>();
                promotion.PromoID = promoid;
                promotion.PromoItem = promoitem;
                promotion.StartDate = startdate;
                promotion.EndDate = enddate;
                promotion.DiscountAmt = discountamt;
            }
        }
    }
}