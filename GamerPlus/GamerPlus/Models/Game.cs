//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GamerPlus.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Game
    {
        public int GameID { get; set; }
        public string GameTitle { get; set; }
        public Nullable<decimal> Price { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
        public Nullable<int> ConsoleID_FK { get; set; }
        public Nullable<int> DevID_FK { get; set; }
        public Nullable<int> BestSelling { get; set; }
        public Nullable<int> GenreID_FK { get; set; }
        public string System_Requirements { get; set; }
    }
}