using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using EShopBE.Models;
using Microsoft.Extensions.Configuration;
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
            SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("EShOPCS").ToString());
            Response response = dal.addToCart(cart, connection);
            return response;
        
        
        }

        [HttpPost]
        [Route("placeOrder")]
        public Response placeOrder(Users users)
        {
            DAL dal = new DAL();
            SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("EShOPCS").ToString());
            Response response = dal.placeOrder(users, connection);
            return response;


        }
        [HttpPost]
        [Route("orderList")]
        public Response orderList(Users users)
        {
            DAL dal = new DAL();
            SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("EShOPCS").ToString());
            Response response = dal.orderList(users, connection);
            return response;


        }


    }
}
