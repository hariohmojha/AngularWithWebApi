using System.Collections.Generic;
using System.Linq;
using UserManagementAPI.Context;
using UserManagementAPI.IRepository;
using UserManagementAPI.Model;

namespace UserManagementAPI.Repository
{
    public class RoleMasterRepository : IRoleMasterRepository
    {
        private readonly UsermanagementContex _usermanagementcontext;
        public RoleMasterRepository(UsermanagementContex usermanagementcontext)
        {
            _usermanagementcontext = usermanagementcontext;
        }

        public List<RoleMaster> GetAll()
        {
            var roleList = _usermanagementcontext.RoleMaster.Where(x => x.Active == true).ToList();
            return roleList;
        }


        public RoleMaster GetRoleByID(int ID)
        {
            var roleDetail = _usermanagementcontext.RoleMaster.Where(x => x.RoleID == ID).FirstOrDefault();
            return roleDetail;
            ;
        }

        public bool IfExists(int roleID, string roleName)
        {
            throw new System.NotImplementedException();
        }

        public string Insert(RoleMaster _rolemaster)
        {

            if (_rolemaster.RoleID == 0)
            {
                _rolemaster.Active = true;
                _usermanagementcontext.RoleMaster.Add(_rolemaster);
                _usermanagementcontext.SaveChanges();
                return "1";
            }
            else
            {
                var _roledetail = _usermanagementcontext.RoleMaster.Where(x => x.RoleID == _rolemaster.RoleID).FirstOrDefault();
                _roledetail.RoleName = _rolemaster.RoleName;
                _roledetail.Discription = _rolemaster.Discription;
                _usermanagementcontext.SaveChanges();
                return "2";
            };
        }


        public string Remove(int roleID)
        {
            var role = _usermanagementcontext.RoleMaster.Where(x => x.RoleID == roleID).FirstOrDefault();
            if (role != null)
            {
                role.Active = false;
                _usermanagementcontext.SaveChanges();

                return "Role deleted successfully!!";
            }
            else
            {
                return "no role found!!";
            }

        }
    }
}
