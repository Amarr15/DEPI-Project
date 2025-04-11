using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonationDB.Models
{

    public class Activity
    {
        [Key]
        public int ActivityID { get; set; }

        [Required, MaxLength(200)]
        public required string Title { get; set; }

        [Required]
        public required string Description { get; set; }

        [Required, MaxLength(100)]
        public required string Category { get; set; }

        public decimal TargetAmount { get; set; }

        public decimal CollectedAmount { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        [Required, MaxLength(50)]
        public required string Status { get; set; }

        public int ReportID { get; set; }
        public Report? Report { get; set; }

        public ICollection<Donation> Donations { get; set; } = [];
    }

}
