using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;

class CategoriesProcess
{
    public const int EVERY_PAGE_COUNT = 750;
    public List<JobCategoryProcess> Categories { get; set; }
    public string ConnectionString { get; set; }

    public CategoriesProcess(){
        this.LoadData();
    }

    public void StartCrawler()
    {   
        foreach (var cat in this.Categories)
        {
            foreach (JobTitleProcess title in cat.Titles)
            {

                while (title.PageCount < EVERY_PAGE_COUNT)
                {
                    if (title.PageCount == 0)
                    {
                        title.PageCount += 10;
                        new JobCrawler(cat.CategoryUrl, cat.Category, title.Title).DoTheCrawl();
                    }
                    else
                    {
                        title.PageCount += 10;
                        new JobCrawler(title.GetTitleUrlWithPaging(), cat.Category, title.Title).DoTheCrawl();
                    }

                }
            }
        }
    }

    private void LoadData()
    {
        var connection = ConfigurationManager.ConnectionStrings["Siena"].ConnectionString;
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = connection;
            conn.Open();
            // Create the command
            SqlCommand select = new SqlCommand("select Category, Title from JobCategories", conn);
            SqlDataReader reader = select.ExecuteReader();


            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    var cat = reader["Category"].ToString();
                    var tle = reader["Title"].ToString();

                    if (this.Categories == null)
                    {
                        this.Categories = new List<JobCategoryProcess>();
                        JobCategoryProcess catModel = new JobCategoryProcess(cat);
                        catModel.Titles.Add(new JobTitleProcess(tle));
                        this.Categories.Add(catModel);
                    }
                    else if (this.Categories.Where(x => x.Category.Equals(cat)).Count() == 0)
                    {
                        JobCategoryProcess jc = new JobCategoryProcess(cat);
                        jc.Titles.Add(new JobTitleProcess(tle));
                        this.Categories.Add(jc);
                    }
                    else if (this.Categories != null && this.Categories.Where(x => x.Category.Equals(cat)).Count() > 0)
                    {
                        this.Categories.Where(x => x.Category.Equals(cat)).FirstOrDefault().Titles.Add(new JobTitleProcess(tle));
                    }
                }

                reader.Close();
            }

        }

    }


}

class JobCategoryProcess
{
    public string Category { get; set; }
    public List<JobTitleProcess> Titles { get; set; }
    public Uri CategoryUrl { get; set; }

    public JobCategoryProcess(string category)
    {
        this.Category = category;
        this.Titles = new List<JobTitleProcess>();
        this.CategoryUrl = GetCategoryUrl(category);
    }

    public Uri GetCategoryUrl(string category)
    {
        return new Uri(string.Format("http://www.indeed.com/q-{0}-jobs.html", ShareHelper.FillSpace(category, "-")));
    }

}

class JobTitleProcess
{
    public string Title { get; set; }
    public int PageCount { get; set; }
    public string TitleUrl { get; set; }

    public JobTitleProcess() { }
    public JobTitleProcess(string title)
    {
        this.Title = title;
    }
    
    public Uri GetTitleUrlWithPaging()
    {
        return new Uri(string.Format("https://www.indeed.com/jobs?q={0}&start={1}", ShareHelper.FillSpace(this.Title, "+"), this.PageCount.ToString()));
    }
}
