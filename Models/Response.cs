namespace EShopBE.Models
{
    public class Response
    {
        internal object listUsers;

        public int StatusCode { get; set; }
        public string StatusMessage { get; set; }
        public List<Users> ListUsers { get; set; }
        public Users user { get; set; }
        public List<Shoppings> ListShoppings { get; set; }
        public Shoppings shopping { get; set; }
        public List<Cart> ListCart { get; set; }
        public List<Orders> ListOrders { get; set; }
        public Orders order { get; set; }
        public List<OrderItems> ListItems { get; set; }
        public OrderItems orderItem { get; set; }
    }
}


