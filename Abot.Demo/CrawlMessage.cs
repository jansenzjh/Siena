using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

class CrawlMessage
{
    public string LogMessage { get; set; }
    public string StackMessage { get; set; }
    public string Parameter { get; set; }

    public CrawlMessage() { }

    public CrawlMessage(string log = "", string stack = "", string param = "")
    {
        this.LogMessage = log;
        this.StackMessage = stack;
        this.Parameter = param;
    }

    public void SaveMessage()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["Siena"].ConnectionString;
                conn.Open();
                // Create the command
                SqlCommand command = new SqlCommand("insert into MessageLog values(@0, @1, @2)", conn);
                // Add the parameters.
                command.Parameters.Add(new SqlParameter("0", this.LogMessage));
                command.Parameters.Add(new SqlParameter("1", this.StackMessage));
                command.Parameters.Add(new SqlParameter("2", this.Parameter));
                var a = command.ExecuteNonQuery();

            }
        }
        catch (Exception e)
        {
            Console.WriteLine("error " + e.StackTrace + Environment.NewLine + e.Message);
        }
        
    }
}

