using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonationDB.Models
{
    public class Notification
    {
        [Key] public int NotificationId { get; set; }

        [Required] public required int DonorId { get; set; }

        [Required, MaxLength(200)] public required string Title { get; set; }

        [Required, MaxLength(1000)] public required string Description { get; set; }

        public User? Donor { get; set; }
    }

}
