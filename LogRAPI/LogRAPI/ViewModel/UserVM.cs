using System;

namespace UserManagementAPI.ViewModel
{
    public class UserVM
    {
        public Guid UserId { get; set; }
        public string Name { get; set; }

        public string Email { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string MobileNo { get; set; }
        public int UserType { get; set; }
        public string RoleName { get; set; }
        public bool Active { get; set; }
    }
}
