using EShopBE.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;

namespace EShopBE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ShoppingsController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public ShoppingsController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpPost]
        [Route("addToCart")]
        public Response addToCart(Cart cart)
        {
            DAL dal = new DAL();
            SqlConnection connection = new SqlConnection(_configuration.GetValue<string>("EShOPCS"));

            return dal.addToCart(cart, connection);
        }

        [HttpPost]
        [Route("placeOrder")]
        public Response placeOrder(Users users)
        {
            DAL dal = new DAL();
            SqlConnection connection = new SqlConnection(_configuration.GetValue<string>("EShOPCS"));

            return dal.placeOrder(users, connection);
        }

        [HttpPost]
        [Route("orderList")]
        public Response orderList(Users users)
        {
            DAL dal = new DAL();
            SqlConnection connection = new SqlConnection(_configuration.GetValue<string>("EShOPCS"));

            return dal.orderList(users, connection);
        }
    }
}
