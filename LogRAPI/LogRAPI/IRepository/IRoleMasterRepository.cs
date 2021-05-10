using System.Collections.Generic;
using UserManagementAPI.Model;

namespace UserManagementAPI.IRepository
{
    public interface IRoleMasterRepository
    {
        public List<RoleMaster> GetAll();
        public RoleMaster GetRoleByID(int ID);
        public string Insert(RoleMaster _rolemaster);
        public bool IfExists(int roleID, string roleName);
        public string Remove(int roleId);

    }
}
