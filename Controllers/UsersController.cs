using EShopBE.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;

namespace EShopBE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {

        private readonly IConfiguration _configuration;
        public UsersController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpPost]
        [Route("registration")]
        public Response register(Users users)
        {
            DAL dal = new DAL();
            SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("EShOPCS").ToString());

            return dal.Register(users, connection);
        }

        [HttpPost]
        [Route("login")]

        public Response login(Users users)
        {
            DAL dal = new DAL();
            SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("EShOPCS").ToString());

            return dal.login(users, connection);
        }

        [HttpPost]
        [Route("viewUser")]
        public Response viewUser(Users users)
        {
            DAL dal = new DAL();
            SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("EShOPCS").ToString());

            return dal.viewUser(users, connection);
        }

        [HttpPost]
        [Route("updateProfile")]
        public Response updateProfile(Users users)
        {
            DAL dal = new DAL();
            SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("EShOPCS").ToString());

            return dal.updateProfile(users, connection);
        }
    }
}
