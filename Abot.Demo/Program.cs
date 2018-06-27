
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using HtmlAgilityPack;
using System.Threading;
using System.Configuration;
using System.Linq;


namespace Siena
{
    class Program
    {
        static void Main(string[] args)
        {
            bool flag = true;
            var catData = new CategoriesProcess();
            while (flag)
            {
                catData.StartCrawler();
            }

            Console.Read();
        }
     
    }
}
