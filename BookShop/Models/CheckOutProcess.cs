using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_Shop.Models
{
    public class CheckOutProcess
    {
        public static void AddCardInfo(int userid, string cardholdername, string cardno, int expmonth, int expyear, int cvc_code)
        {
            using (Bookshop entities = new Bookshop())
            {
                CreditCard creditCard = new CreditCard()
                {
                    CardID = entities.CreditCards.Count() > 0 ? entities.CreditCards.Max(c => c.CardID) + 1 : 1, 
                    UserID = userid,
                    FullName = cardholdername,
                    CardNumber = cardno,
                    ExpiryMonth = expmonth,
                    ExpiryYear = expyear,
                    SecurityNumber = cvc_code

                };
                entities.CreditCards.Add(creditCard);
                entities.SaveChanges();

            }
        }

        public static List<CreditCard> GetCreditCard(int userid)
        {
            using (Bookshop entities = new Bookshop())
            {
                List<CreditCard> creditcardlist = entities.CreditCards.Where(c => c.UserID == userid).ToList<CreditCard>();
                return creditcardlist;
            }
        }
    }
}