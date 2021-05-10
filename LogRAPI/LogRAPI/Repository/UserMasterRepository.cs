using System;
using System.Collections.Generic;
using System.Linq;
using UserManagementAPI.Context;
using UserManagementAPI.IRepository;
using UserManagementAPI.Model;
using UserManagementAPI.ViewModel;

namespace UserManagementAPI.Repository
{
    public class UserMasterRepository : IUserMasterRepository
    {
        private readonly UsermanagementContex _usermanagementContex;
        public UserMasterRepository(UsermanagementContex usermanagementContex)
        {
            _usermanagementContex = usermanagementContex;
        }

        public IEnumerable<UserVM> GetAll()
        {
            var allUserList = from um in _usermanagementContex.UserMaster
                              join rm in _usermanagementContex.RoleMaster on um.UserType equals rm.RoleID
                              select new UserVM
                              {
                                  UserId = um.UserId,
                                 Name = um.FirstName + "" + um.LastName,
                                  RoleName = rm.RoleName,
                                  Email = um.Email,
                                  MobileNo = um.MobileNo,
                                  Active=um.Active



                              };
            return allUserList;
        }



        public UserMaster GetById(Guid UserId)
        {
            var _userDetail = _usermanagementContex.UserMaster.Where(x => x.UserId == UserId).FirstOrDefault();
            return _userDetail;

        }



        public string Insert(UserMaster user)
        {
            if (!IsExists(user.UserId, user.Email))
            {
                if (user.UserId == new Guid())
                {

                   
                    _usermanagementContex.UserMaster.Add(user);
                    _usermanagementContex.SaveChanges();
                    return "1";
                }
                else
                {
                    var _userDetail = _usermanagementContex.UserMaster.Where(x => x.UserId == user.UserId).FirstOrDefault();
                    if (_userDetail != null)
                    {
                      
                        _userDetail.FirstName = user.FirstName;
                        _userDetail.LastName = user.LastName;
                        _userDetail.MobileNo = user.MobileNo;
                        _userDetail.Password = user.Password;
                        _userDetail.UserType = user.UserType;
                        _userDetail.Email = user.Email;
                        _userDetail.UserName = user.UserName;
                        _userDetail.Active=user.Active;
                        
                        _usermanagementContex.SaveChanges();
                        return "2";
                    }
                    return "0";
                }
            }
            return "3";
        }

        public bool IsExists(Guid UserId, string email)
        {
            var _user = _usermanagementContex.UserMaster.Where(x => x.Email.ToLower() == email.ToLower() && x.UserId != UserId).Any();
            return _user;
        }

        public UserMaster Login(string email, string password)
        {
            UserMaster obj = new UserMaster();

            if (!IsBlocked(email))
            {
                var _user = _usermanagementContex.UserMaster.Where(x => x.Email.ToLower() == email.ToLower() || x.UserName.ToLower() == email.ToLower() ).Where(x=>x.Password == password).Where(x=>x.Active == true).FirstOrDefault();

                LoginLogs objlogin = new LoginLogs();
                objlogin.Email = email;
                objlogin.password = password;
                objlogin.LoginDate = DateTime.Now;

                if (_user != null)
                {
                    objlogin.isLogin = true;
                    _usermanagementContex.LoginLogs.Add(objlogin);
                    _usermanagementContex.SaveChanges();
                }
                else
                {
                    var isExists = _usermanagementContex.UserMaster.Where(x => x.Email.ToLower() == email.ToLower() || x.UserName.ToLower() == email.ToLower()).FirstOrDefault();

                    if (isExists != null)
                    {
                        objlogin.isLogin = false;
                        _usermanagementContex.LoginLogs.Add(objlogin);
                        _usermanagementContex.SaveChanges();
                    }

                }
                return _user;
            }
            else
            {
                obj.Email = "blocked";
                return obj;
            }
        }



        public bool IsBlocked(string email)
        {
            var isblocked = _usermanagementContex.LoginLogs.Where(s => s.Email.ToLower() == email.ToLower() && s.isLogin == false).Where(x => x.LoginDate >= DateTime.Now.AddMinutes(-10) && x.LoginDate <= DateTime.Now).Count();
            if (isblocked >= 3)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public UserVM UserProfile(Guid _userId)
        {
            var _userDetail = (from um in _usermanagementContex.UserMaster where um.UserId == _userId
                              join rm in _usermanagementContex.RoleMaster on um.UserType equals rm.RoleID  
                              select new UserVM
                              {
                                  UserId = um.UserId,
                                  Name = um.FirstName + "" + um.LastName,
                                  RoleName = rm.RoleName,
                                  Email = um.Email,
                                  MobileNo = um.MobileNo,
                                  UserName=um.UserName

                              }).FirstOrDefault();
            return _userDetail;
        }



    }
}
