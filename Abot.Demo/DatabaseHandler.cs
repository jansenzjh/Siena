using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HtmlAgilityPack;
using System.Configuration;
using Siena.JobModel;

class DatabaseHandler
{
    public static void SaveWebData(string linkName, string link, HtmlDocument htmlDoc)
    {
        htmlDoc.RemoveNodes(new string[] { "script", "style", "img" ,"title", "a", "head", "meta", "link"});

        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["Siena"].ConnectionString;
            conn.Open();
            // Create the command
            SqlCommand command = new SqlCommand("insert into WebData (url, html, linkname, htmltext) values(@0, @1, @2, @3)", conn);
            // Add the parameters.
            command.Parameters.Add(new SqlParameter("0", link));
            command.Parameters.Add(new SqlParameter("1", htmlDoc.DocumentNode.InnerHtml));
            command.Parameters.Add(new SqlParameter("2", linkName));
            command.Parameters.Add(new SqlParameter("3", ""));
            //command.Parameters.Add(new SqlParameter("3", htmlDoc.GetHtmlStringOnly()));
            var a = command.ExecuteNonQuery();

        }
    }

    public static void SaveJobPosting(JobPost jobPost)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["Siena"].ConnectionString;
            conn.Open();
            // Create the command
            SqlCommand command = new SqlCommand("insert into JobPost (Id, JobName, CompanyName, JobLocation, JobDescription, JobPostDate, Salary, Category, Title, Url, IsIndeed) values(@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10)", conn);
            // Add the parameters.
            command.Parameters.Add(new SqlParameter("0", jobPost.Id));
            command.Parameters.Add(new SqlParameter("1", jobPost.JobName));
            command.Parameters.Add(new SqlParameter("2", jobPost.Company));
            command.Parameters.Add(new SqlParameter("3", jobPost.JobLocation));
            command.Parameters.Add(new SqlParameter("4", jobPost.JobDescription));
            command.Parameters.Add(new SqlParameter("5", jobPost.JobPostDate));
            command.Parameters.Add(new SqlParameter("6", jobPost.Salary));
            command.Parameters.Add(new SqlParameter("7", jobPost.Category));
            command.Parameters.Add(new SqlParameter("8", jobPost.Title));
            command.Parameters.Add(new SqlParameter("9", jobPost.JobUrl.AbsoluteUri));
            command.Parameters.Add(new SqlParameter("10", jobPost.IsIndeed));
            var a = command.ExecuteNonQuery();

        }
    }
    

    public static void SaveJobDetail(JobDetail jobDetail)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["Siena"].ConnectionString;
            conn.Open();
            // Create the command
            SqlCommand command = new SqlCommand("insert into JobDetail (JobId, JobDetailContent) values(@0, @1)", conn);
            // Add the parameters.
            command.Parameters.Add(new SqlParameter("0", jobDetail.JobPostId));
            command.Parameters.Add(new SqlParameter("1", jobDetail.JobDetailContent));
            var a = command.ExecuteNonQuery();

        }
    }

}

