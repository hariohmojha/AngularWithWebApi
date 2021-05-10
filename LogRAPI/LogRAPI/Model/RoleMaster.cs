using System.ComponentModel.DataAnnotations;

namespace UserManagementAPI.Model
{
    public class RoleMaster
    {
        [Key]
        public int RoleID { get; set; }
        public string RoleName { get; set; }
        public string Discription { get; set; }
        public bool Active { get; set; }
    }
}
