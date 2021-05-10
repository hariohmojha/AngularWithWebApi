using System;
using System.Collections.Generic;
using UserManagementAPI.Model;
using UserManagementAPI.ViewModel;

namespace UserManagementAPI.IRepository
{
    public interface IUserMasterRepository
    {
        public string Insert(UserMaster user);
        public UserMaster GetById(Guid Id);
        public IEnumerable<UserVM> GetAll();
        public bool IsExists(Guid UserId, string email);
        public UserMaster Login(string email, string password);
        public UserVM UserProfile(Guid UserId);

    }
}
