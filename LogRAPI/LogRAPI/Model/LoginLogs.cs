using System;
using System.ComponentModel.DataAnnotations;

namespace UserManagementAPI.Model
{
    public class LoginLogs
    {
        [Key]
        public int ID { get; set; }
        public string Email { get; set; }
        public string password { get; set; }
        public DateTime LoginDate { get; set; }
        public bool isLogin { get; set; }
    }
}
