using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonationDB.Models
{
    public class Report
    {
        [Key] public int ReportID { get; set; }

        [Required, MaxLength(200)] public required string Title { get; set; }

        [Required] public required string Description { get; set; }

        public ICollection<Activity> Activities { get; set; } = [];
    }
}
