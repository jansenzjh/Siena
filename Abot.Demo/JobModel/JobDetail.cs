using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Siena.JobModel
{
    class JobDetail
    {
        public Guid Id { get; set; }
        public Guid JobPostId { get; set; }
        public string JobDetailContent { get; set; }


        public JobDetail() { }

        public JobDetail(Guid postId, string content)
        {
            JobPostId = postId;
            JobDetailContent = content;
        }

        public void Save()
        {
            
            try
            {
                DatabaseHandler.SaveJobDetail(this);
            }
            catch (Exception e)
            {
                Console.WriteLine("error " + e.StackTrace + Environment.NewLine + e.Message);
            }
        }
    }

}
