using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Siena.Share;
using HtmlAgilityPack;

namespace Siena
{
    static class IndeedHandler
    {
        public static bool IsIndeedInsideLink(Uri url)
        {
            return url.AbsoluteUri.Contains("/company/");
        }

        public static void ProcessLink(LinkObject link)
        {
            if (IsIndeedInsideLink(link.Url))
            {
                //
            }
            //var htmlDoc = HTMLHandler.GetHtml(url.Url.AbsoluteUri);
            //DatabaseHandler.SaveWebData(link.Key, link.Value, htmlDoc);
        }

        public static bool IsLinkValid(string url)
        {
            return url.Contains("rc/clk?") || url.Contains("/company/");
        }
    }
}
