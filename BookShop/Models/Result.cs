using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookShop.Models
{
    
    public class Result
    {



        public static IQueryable<BookList> GetBooklists(string author, string title, int category)
        {
            var entities = new Bookshop();

           // IQueryable<BookList> booklist = entities.Books.Where(b => b.Author == author || b.Title == title || b.CategoryID == category);
           IQueryable<BookList> booklist = from a in entities.Books.Where(a=>a.Author == author || a.Title == title || a.CategoryID == category)
                       from b in entities.Categories
                       where a.CategoryID == b.CategoryID 
                       select new BookList
                       {
                           BookID = a.BookID,
                           Author = a.Author,
                           CategoryID = a.CategoryID,
                           CategoryName = b.Name,
                           Title = a.Title,
                           ISBN = a.ISBN,
                           Price = a.Price,
                           Stock = a.Stock
                       };
            return booklist;

        }

        public static IQueryable<BookList> GetBooklistAll()
        {
            var entities = new Bookshop();
            //IQueryable<Book> booklist = entities.Books;
            IQueryable<BookList> booklist = from a in entities.Books
                                            from b in entities.Categories
                                            where a.CategoryID == b.CategoryID
                                            select new BookList
                                            {
                                                BookID = a.BookID,
                                                Author = a.Author,
                                                CategoryID = a.CategoryID,
                                                CategoryName = b.Name,
                                                Title = a.Title,
                                                ISBN = a.ISBN,
                                                Price = a.Price,
                                                Stock = a.Stock
                                            };
          
            return booklist;

        }

        
    }
}