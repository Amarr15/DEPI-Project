using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonationDB.Models
{
    public enum UserType
    {
        Donor,
        Admin
    }


    public class User
    {
        [Key]
        public int UserId { get; set; }

        [Required, MaxLength(100), MinLength(6)]
        public required string UserName { get; set; }

        [Required, EmailAddress, MaxLength(100)]
        public required string Email { get; set; }

        [Required, Phone, MaxLength(20)]
        public required string Phone { get; set; }

        [Required, MaxLength(100), MinLength(6)]
        public required string Password { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        public DateTime? LastLogout { get; set; }

        public DateTime DateOfBirth { get; set; }

        [Required]
        public required UserType UserType { get; set; }

        public ICollection<Notification> Notifications { get; set; } = [];

        public ICollection<Donation> Donations { get; set; } = [];
    }

}