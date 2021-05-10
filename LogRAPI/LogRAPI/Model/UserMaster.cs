using System;
using System.ComponentModel.DataAnnotations;

namespace UserManagementAPI.Model
{
    public class UserMaster
    {
        [Key]
        public Guid UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string MobileNo { get; set; }
        public int UserType { get; set; }
        public bool Active { get; set; }
    }
}
