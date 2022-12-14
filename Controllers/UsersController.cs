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
            SqlConnection connection = new SqlConnection(_configuration.GetValue<string>("EShOPCS"));

            return dal.Register(users, connection);
        }

        [HttpPost]
        [Route("login")]

        public Response login(string email, string password)
        {
            DAL dal = new DAL();
            SqlConnection connection = new SqlConnection(_configuration.GetValue<string>("EShOPCS"));

            return dal.login(email, password, connection);
        }

        [HttpPost]
        [Route("viewUser")]
        public Response viewUser(int userId)
        {
            DAL dal = new DAL();
            SqlConnection connection = new SqlConnection(_configuration.GetValue<string>("EShOPCS"));

            return dal.viewUser(userId, connection);
        }

        [HttpPost]
        [Route("updateProfile")]
        public Response updateProfile(Users users)
        {
            DAL dal = new DAL();
            SqlConnection connection = new SqlConnection(_configuration.GetValue<string>("EShOPCS"));

            return dal.updateProfile(users, connection);
        }
    }
}
