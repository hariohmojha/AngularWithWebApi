using Microsoft.EntityFrameworkCore;
using UserManagementAPI.Model;

namespace UserManagementAPI.Context
{
    public class UsermanagementContex : DbContext
    {
        public UsermanagementContex(DbContextOptions<UsermanagementContex> options) : base(options)
        {

        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {


        }
        public DbSet<UserMaster> UserMaster { get; set; }
        public DbSet<RoleMaster> RoleMaster { get; set; }
        public DbSet<LoginLogs> LoginLogs { get; set; }
    }
}
