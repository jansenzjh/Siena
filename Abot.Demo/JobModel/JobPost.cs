using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HtmlAgilityPack;

namespace Siena.JobModel
{
    class JobPost
    {
        public Guid Id { get; set; }
        public string Company { get; set; } = "";
        public string JobName { get; set; } = "";
        public string JobLocation { get; set; } = "";
        public string JobDescription { get; set; } = "";
        public DateTime JobPostDate { get; set; }
        public string Salary { get; set; } = "";
        public string Skills { get; set; } = "";
        public string Category { get; set; } = "";
        public string Title { get; set; } = "";
        public Uri JobUrl { get; set; }
        public bool IsIndeed { get; set; } = false;

        public JobPost() { }

        public JobPost(HtmlNode node)
        {
            //Get links
            Id = Guid.NewGuid();
            var link = HTMLHandler.GetValidLinks(node.SelectNodes(".//a[@href]"), IsValid).FirstOrDefault();
            if(link != null)
            {
                JobName = link.InnerText;
                JobUrl = new Uri(System.Configuration.ConfigurationManager.AppSettings["Domain"] + link.GetAttributeValue("href", ""));
                if (node.SelectSingleNode(".//span[contains(@class,'company')]//span") != null)
                {
                    Company = node.SelectSingleNode(".//span[contains(@class,'company')]//span").InnerText.RemoveAllNextLineCharacters();
                }
                if (node.SelectSingleNode(".//span[contains(@class,'location')]//span") != null)
                {
                    JobLocation = node.SelectSingleNode(".//span[contains(@class,'location')]//span").InnerText.RemoveAllNextLineCharacters();
                }
                if (node.SelectSingleNode(".//td[contains(@class, 'snip')]//nobr") != null)
                {
                    Salary = node.SelectSingleNode(".//td[contains(@class, 'snip')]//nobr").InnerText.RemoveAllNextLineCharacters();
                }
                if (node.SelectSingleNode(".//span[contains(@class, 'summary')]") != null)
                {
                    this.JobDescription = node.SelectSingleNode(".//span[contains(@class, 'summary')]").InnerText.RemoveAllNextLineCharacters();
                }
                JobPostDate = DateTime.Now;
                IsIndeed = IndeedHandler.IsIndeedInsideLink(JobUrl);

            }


        }

        public bool IsValid(HtmlNode node)
        {
            var att = node.GetAttributeValue("href", "");
            return IndeedHandler.IsLinkValid(att);
        }

        public void Save()
        {
            try
            {
                DatabaseHandler.SaveJobPosting(this);
            }
            catch (Exception e)
            {
                Console.WriteLine("error " + e.StackTrace + Environment.NewLine + e.Message);
            }
            
        }
    }

}

