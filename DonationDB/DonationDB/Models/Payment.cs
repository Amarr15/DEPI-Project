using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonationDB.Models
{
    
    public class Payment
    {
        [Key] public int PaymentID { get; set; }

        [Required, MaxLength(50)] public required string PaymentMethod { get; set; }

        public ICollection<Donation> Donations { get; set; } = [];
    }

}
