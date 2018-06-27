using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HtmlAgilityPack;
using System.Threading.Tasks;

namespace Siena.Share
{
    class LinkObject
    {
        public string LinkName { get; set; }
        public Uri Url { get; set; }
        public HtmlNode LinkNode { get; set; }
        public string Domain { get; set; }

        public LinkObject(string linkName = "", Uri url = null, HtmlNode node = null, string domain = "")
        {
            this.LinkName = linkName;
            this.Url = url;
            this.LinkNode = node;
            this.Domain = domain;
        }
    }
}
