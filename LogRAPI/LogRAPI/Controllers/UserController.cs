using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;
using UserManagementAPI.Context;
using UserManagementAPI.IRepository;
using UserManagementAPI.Model;
using UserManagementAPI.Utility;

namespace UserManagementAPI.Controllers
{
    [EnableCors("MyPolicy")]
    [Route("[controller]")]
    [ApiController]
    [AllowAnonymous]
    public class UserController : ControllerBase
    {
        private readonly IWebHostEnvironment _iwebhostenviorment;
        private readonly UsermanagementContex _usercontext;
        private readonly IUserMasterRepository _iuserMasterRepository;

        public UserController(IWebHostEnvironment webHostEnvironment, UsermanagementContex usercontext, IUserMasterRepository iuserMasterRepository)
        {
            _iwebhostenviorment = webHostEnvironment;
            _usercontext = usercontext;
            _iuserMasterRepository = iuserMasterRepository;
        }

        [Route("UserList")]
        [HttpGet]
        [AllowAnonymous]
        public ActionResult UserList()
        {
            var _userlist = _iuserMasterRepository.GetAll().ToList();
            return Ok(_userlist);
        }
        [Route("UserLogin")]
        [HttpPost]
        [AllowAnonymous]
        public IActionResult UserLogin(UserMaster user)
        {

            var _userResult = _iuserMasterRepository.Login(user.Email, user.Password);
            if (_userResult != null)
            {
                if (_userResult.Email == "blocked")
                {
                    string mailbody = EmailTemplate.Userblocked().ToString();
                    Email.SendEmail("haiohm007@gmail.com", "User.Email ", mailbody);

                    return Ok("0");
                }
                return Ok(_userResult);
            }
            else
            {
                return Ok("1");
            }


        }

        [Route("AddUser")]
        [HttpPost]
        [Authorize]
        public IActionResult AddUser(UserMaster _objuser)
        {
            var user = _iuserMasterRepository.Insert(_objuser);


            return Ok(user);

        }
        [Route("{UserDetail}/{userID}")]
        [HttpGet]
        [AllowAnonymous]
        public IActionResult UserDetail(Guid UserId)
        {
            var user = _iuserMasterRepository.GetById(UserId);
            if (user != null)
            {
                return Ok(user);
            }
            else
            {
                return BadRequest();
            }


        }
        [Route("UserProfile/{UserId}")]
        [HttpGet]
        [AllowAnonymous]
        public IActionResult UserProfile(Guid userId)
        {
            var user = _iuserMasterRepository.UserProfile(userId);
            return Ok(user);
        }


    }
    
   

}