namespace EShopBE.Models
{
    public class Users
    {
        public int ID { get; set; }
        public string FirsName { get; set; }
        public string LastName { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public decimal Fund { get; set; }
        public string Type { get; set; }
        public int Status { get; set; }
        public DateTime CreatedOn { get; set; }

    }
}