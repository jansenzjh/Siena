using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Net;
using System.IO;
using HtmlAgilityPack;

static class HTMLHandler
{
    public static string GetFinalRedirect(this string url)
    {
        if (string.IsNullOrWhiteSpace(url))
            return url;

        int maxRedirCount = 8;  // prevent infinite loops
        string newUrl = url;
        do
        {
            HttpWebRequest req = null;
            HttpWebResponse resp = null;
            try
            {
                req = (HttpWebRequest)HttpWebRequest.Create(url);
                req.Method = "HEAD";
                req.AllowAutoRedirect = false;
                req.Method = "GET";
                resp = (HttpWebResponse)req.GetResponse();
                switch (resp.StatusCode)
                {
                    case HttpStatusCode.OK:
                        return newUrl;
                    case HttpStatusCode.Redirect:
                    case HttpStatusCode.MovedPermanently:
                    case HttpStatusCode.RedirectKeepVerb:
                    case HttpStatusCode.RedirectMethod:
                        newUrl = resp.Headers["Location"];
                        if (newUrl == null)
                            return url;

                        if (newUrl.IndexOf("://", System.StringComparison.Ordinal) == -1)
                        {
                            // Doesn't have a URL Schema, meaning it's a relative or absolute URL
                            Uri u = new Uri(new Uri(url), newUrl);
                            newUrl = u.ToString();
                        }
                        break;
                    default:
                        return newUrl;
                }
                url = newUrl;
            }
            catch (WebException)
            {
                // Return the last known good URL
                return newUrl;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                if (resp != null)
                    resp.Close();
            }
        } while (maxRedirCount-- > 0);

        return newUrl;
    }

    public static string DownloadHTML(string url)
    {
        Console.WriteLine(url);
        try
        {
            return DownloadWebPage(url);
        }
        catch (Exception ex)
        {
            Console.WriteLine("Exception Throw! " + ex.Message);
            Thread.Sleep(1000);
            return DownloadWebPage(url);
        }
    }

    public static HtmlDocument RemoveNode(this HtmlDocument doc, string nodeName)
    {
        doc.DocumentNode.Descendants()
            .Where(n => n.Name == nodeName)
            .ToList()
            .ForEach(n => n.Remove());
        return doc;
    }

    public static HtmlDocument RemoveNodes(this HtmlDocument doc, string[] nodeNames)
    {
        if(nodeNames.Length > 0)
        {
            foreach(string nodeName in nodeNames)
            {
                doc = RemoveNode(doc, nodeName);
            }
        }
        return doc;
    }

    public static string GetHtmlStringOnly(this HtmlDocument doc)
    {
        string returnStr = "";
        var nodes = doc.DocumentNode.SelectNodes("//text()");
        if (nodes != null && nodes.Count > 0)
        foreach (HtmlNode node in doc.DocumentNode.SelectNodes("//text()"))
        {
            if (!string.IsNullOrEmpty(node.InnerText) && !string.IsNullOrWhiteSpace(node.InnerHtml))
            {
                returnStr += node.InnerText.ReplaceAllString('\u0009'.ToString(), "").ReplaceAllString("\r", "").ReplaceAllString("  ", "") + Environment.NewLine;
            }

        }
        return returnStr;
    }

    public static string DownloadWebPage(string url)
    {
        try
        {
            return _DownloadWebPage(url);
        }
        catch(Exception e)
        {
            try
            {
                return _DownloadWebPage(url);
            }
            catch (Exception ex)
            {
                new CrawlMessage(ex.Message, ex.StackTrace, url).SaveMessage();
                return ex.Message;
            }
        }
        
    }

    public static HtmlDocument GetHtml(string url)
    {
        var htmlContent = DownloadHTML(url);
        HtmlDocument doc = new HtmlDocument();
        doc.LoadHtml(htmlContent);
        return doc;
    }



    public static List<HtmlNode> GetValidLinks(HtmlNodeCollection collection, Func<HtmlNode, bool> criteria)
    {
        List<HtmlNode> returnList = new List<HtmlNode>();
        foreach (HtmlNode node in collection)
        {
            //var att = node.GetAttributeValue("href", "");
            //var name = node.InnerText;
            

            if (criteria(node))
            {
                returnList.Add(node);
            }
        }
        return returnList;
    }

    private static string _DownloadWebPage(string url)
    {
        HttpWebRequest webReq = (HttpWebRequest)HttpWebRequest.Create(url);
        webReq.CookieContainer = new CookieContainer();
        webReq.Method = "GET";
        webReq.Accept = "text/html";
        webReq.Headers.Add("niceboat", "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36");

        using (WebResponse response = webReq.GetResponse())
        {
            using (Stream stream = response.GetResponseStream())
            {
                StreamReader reader = new StreamReader(stream);
                return reader.ReadToEnd();
            }
        }
    }
}

