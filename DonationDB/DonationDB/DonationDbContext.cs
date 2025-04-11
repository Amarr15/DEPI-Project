using DonationDB.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonationDB
{
    class DonationDbContext(DbContextOptions options) : DbContext(options)
    {




        public DbSet<User> Users { get; set; }
        public DbSet<Report> Reports { get; set; }
        public DbSet<Payment> Payments { get; set; }
        public DbSet<Notification> Notifications { get; set; }
        public DbSet<Donation> Donations { get; set; }
        public DbSet<Activity> Activities { get; set; }
    }
}
