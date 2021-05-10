using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using UserManagementAPI.Context;
using UserManagementAPI.IRepository;
using UserManagementAPI.Model;
namespace UserManagementAPI.Controllers
{
    [EnableCors("MyPolicy")]
    [Route("[controller]")]
    [ApiController]
    [AllowAnonymous]
    public class RolesController : ControllerBase
    {
        private readonly IWebHostEnvironment _iwebhostenviorment;
        private readonly UsermanagementContex _usercontext;
        private readonly IRoleMasterRepository _iroleMasterRepository;
        public RolesController(IWebHostEnvironment webHostEnvironment, UsermanagementContex usercontext, IRoleMasterRepository iroleMasterRepository)
        {
            _iwebhostenviorment = webHostEnvironment;
            _usercontext = usercontext;
            _iroleMasterRepository = iroleMasterRepository;
        }

        [Route("Rolelist")]
        [HttpGet]
       
        [AllowAnonymous]
        public ActionResult Rolelist()
        {
            var _roleList = _iroleMasterRepository.GetAll();
            return Ok(_roleList);
        }
        [Route("AddRole")]
        [HttpPost]
        [AllowAnonymous]
        public IActionResult AddRole(RoleMaster _objRole)
        {

            var _userResult = _iroleMasterRepository.Insert(_objRole);
            if (_userResult != null)
            {

                return Ok(_userResult);
            }
            else
            {
                return Ok("1");
            }


        }
        [Route("RemoveRole/{RoleId}")]
        [HttpGet]
        [Authorize]
        public ActionResult RemoveRole(int roleID)
        {

            
            var _roleList = _iroleMasterRepository.Remove(roleID);
            return Ok(_roleList);
        }

       
    }
}
