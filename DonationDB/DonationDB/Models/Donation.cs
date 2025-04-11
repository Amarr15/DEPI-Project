using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonationDB.Models
{
    public class Donation
    {
        [Key]
        public int DonationID { get; set; }

        public int DonorID { get; set; }

        public int PaymentID { get; set; }

        public int ActivityID { get; set; }

        public decimal Amount { get; set; }

        public DateTime DonationDate { get; set; }

        [Required, MaxLength(50)]
        public required string Status { get; set; }

        public User? Donor { get; set; }
        public Payment? Payment { get; set; }
        public Activity? Activity { get; set; }
    }

}
