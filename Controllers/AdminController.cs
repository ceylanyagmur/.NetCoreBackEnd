using EShopBE.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;

namespace EShopBE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdminController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public AdminController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpPost]
        [Route("addUpdateShopping")]
        public Response addUpdateShopping(Shoppings shoppings)
        {
            DAL dal = new DAL();
            SqlConnection connection = new SqlConnection(_configuration.GetValue<string>("EShOPCS"));

            return dal.addUpdateShopping(shoppings, connection);
        }

        [HttpGet]
        [Route("userList")]
        public Response userList()
        {
            DAL dal = new DAL();
            SqlConnection connection = new SqlConnection(_configuration.GetValue<string>("EShOPCS"));

            return dal.UserList(new Users(), connection);
        } 
    }
}
