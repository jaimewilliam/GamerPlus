
namespace GamerPlus.Models
{
    public class NewGame
    {
        public int GameID { get; set; }
        public string GameTitle { get; set; }
        public decimal? Price { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
        public string System_Req { get; set; }

        public string ConsoleName { get; set; }

        public string DeveloperName { get; set; }
    }
}