using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GamerPlus.Models
{
    public class NewGenre
    {
        public int GenreID { get; set; }
        public string GenreName { get; set; }
        public int? ConsoleID { get; set; }
        public int? GenreIDFK { get; set; }
    }
}