using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Book_Shop
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
           
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["UserID"] = 0;
            Session["ISBN"] = "";
            Session["Title"] = "Black Edge"; //Black Edge
            Session["Category"] = "2";
            Session["Author"] = "Rick Riordan"; //Rick Riordan

            // Session Variables Initialization
            Session["bkTitle"] = "";
            Session["bkCat"] = "";
            Session["bkAuthor"] = "";
            Session["bkISBN"] = "";
            Session["cart"] = new Cart();

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}