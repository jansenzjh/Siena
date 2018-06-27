using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using HtmlAgilityPack;
using System.Data.SqlClient;
using Siena;
using Siena.Share;
using System.Configuration;
using Siena.JobModel;

class JobCrawler
{
    public Uri UrlToCrawl { get; set; }
    public List<LinkObject> JobLinks { get; set; }

    public int sleepingTime = 750;
    public string Domain
    {
        get
        {
            return ConfigurationManager.AppSettings["Domain"];
        }
    }

    public string JobCategory { get; set; } = "";
    public string JobTitle { get; set; } = "";

    public JobCrawler()
    {
        this.JobLinks = new List<LinkObject>();
    }

    public JobCrawler(Uri url, string category = "", string title = "")
    {
        this.UrlToCrawl = url;
        this.JobLinks = new List<LinkObject>();
        this.JobCategory = category;
        this.JobTitle = title;
    }


    public void DoTheCrawl()
    {
        var doc = HTMLHandler.GetHtml(this.UrlToCrawl.AbsoluteUri);
        //Get all the downloadable link
        HtmlNodeCollection collection = doc.DocumentNode.SelectNodes("//div[contains(@class,'result') and contains(@class, 'row')]");
        if (collection != null && collection.Count > 0)
        {
            foreach (HtmlNode obj in collection)
            {
                JobPost jp = new JobPost(obj) { Category = this.JobCategory, Title = this.JobTitle };
                if (!string.IsNullOrEmpty(jp.JobName))
                {

                    if (jp.IsIndeed)
                    {
                        //TODO: get indeed data
                        var jobDoc = HTMLHandler.GetHtml(jp.JobUrl.AbsoluteUri);
                        HtmlNode node = jobDoc.DocumentNode.SelectSingleNode("//span[contains(@id,'job_summary')]");
                        if (node != null && node.InnerHtml.Length > 0)
                        {
                            var jobDtl = new JobDetail(jp.Id, node.InnerHtml);
                            //save the post
                            jp.Save();
                            jobDtl.Save();
                        }
                    }
                    else
                    {
                        //TODO: get outside link and update jobPost
                        jp.JobUrl = new Uri(jp.JobUrl.AbsoluteUri.GetFinalRedirect());
                        //Save the post only
                        jp.Save();
                    }


                    Console.WriteLine(string.Format("{0} - {1}", jp.JobName, jp.JobLocation));
                }

                Thread.Sleep(sleepingTime);

            }
        }
            


        //JobLinks = GetValidLinks(doc.DocumentNode.SelectNodes("//a[@href]"));

        foreach (LinkObject link in JobLinks)
        {
            //Process link data
            ProcessLink(link);
            Thread.Sleep(sleepingTime);
        }

        Thread.Sleep(sleepingTime);
    }

    private void ProcessLink(LinkObject link)
    {
        if (link.Url.AbsolutePath.Contains("indeed"))
        {
            IndeedHandler.ProcessLink(link);
        }
    }

    

    

    
}
