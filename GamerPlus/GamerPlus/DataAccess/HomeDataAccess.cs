using GamerPlus.Models;
using System.Collections.Generic;
using System.Linq;

namespace GamerPlus.DataAccess
{
    public class HomeDataAccess
    {
        private static GamerPlusEntities Db = new GamerPlusEntities();

        /// <summary>
        /// Retrieve Console List
        /// </summary>
        /// <returns></returns>
        public static IEnumerable<Console> SelectConsole()
        {
            IEnumerable<Console> consoles = Db.Consoles.ToList();
            return consoles;
        }

        /// <summary>
        /// Retrieve Games
        /// </summary>
        /// <param name="consoleId">
        /// Home/Carousel, int consoleId
        /// </param>
        /// <returns></returns>
        public static IEnumerable<Game> SetCarousel(int consoleId)
        {
            IEnumerable<Game> top = consoleId == 1 ? Db.Games.OrderByDescending(b => b.BestSelling).Take(4).ToList()
                        : Db.Games.Where(i => i.ConsoleID_FK == consoleId).OrderByDescending(b => b.BestSelling).Take(4).ToList();
            return top;
        }

        /// <summary>
        /// Retrieve NameLogoes
        /// </summary>
        /// <returns></returns>
        public static NameLogo DisplayNameLogo()
        {
            var logoName = Db.NameLogoes.FirstOrDefault();
            return logoName;
        }

        /// <summary>
        /// Retrieve Genre
        /// </summary>
        /// <returns></returns>
        public static IEnumerable<NewGenre> DisplayGenre()
        {
            IEnumerable<NewGenre> newgenre = (from gr in Db.Genres
                                              join g in Db.Games on gr.GenreID equals g.GenreID_FK
                                              select new NewGenre
                                              {
                                                  GenreID = gr.GenreID,
                                                  GenreName = gr.GenreName,
                                                  ConsoleID = g.ConsoleID_FK,
                                                  GenreIDFK = g.GenreID_FK
                                              }).ToList();
            
            return newgenre;
        }

        /// <summary>
        /// Retrieve Genre by consolId
        /// </summary>
        /// <param name="consoleId">
        /// Home/GenreList, int consoleId
        /// </param>
        /// <returns></returns>
        public static IEnumerable<NewGenre> DisplayGenre(int consoleId)
        {
            IEnumerable<NewGenre> newgenre = (from gr in Db.Genres
                                              join g in Db.Games on gr.GenreID equals g.GenreID_FK
                                              where g.ConsoleID_FK == consoleId
                                              select new NewGenre
                                              {
                                                  GenreID = gr.GenreID,
                                                  GenreName = gr.GenreName,
                                                  ConsoleID = g.ConsoleID_FK,
                                                  GenreIDFK = g.GenreID_FK
                                              }).ToList();

            return newgenre;
        }


        /// <summary>
        /// Retrieve Games
        /// </summary>
        /// <param name="consoleId">
        /// Home/GameList, int consoleId
        /// </param>
        /// <param name="genreID">
        /// Home/GameList, int genreID
        /// </param>
        /// <returns></returns>
        public static IEnumerable<Game> DisplayGame(int consoleId, int genreID)
        {
            IEnumerable<Game> game = consoleId == 1 ? Db.Games.Where(i => i.GenreID_FK == genreID).OrderBy(t => t.GameTitle).ToList()
                        : Db.Games.Where(i => i.ConsoleID_FK == consoleId && i.GenreID_FK == genreID).OrderBy(t => t.GameTitle).ToList();
            return game;
        }

        /// <summary>
        /// Retrieve Games
        /// </summary>
        /// <param name="consoleId">
        /// Home/AllGameList, int consoleId
        /// </param>
        /// <param name="alpa">
        /// Home/AllGameList, string alpa
        /// </param>
        /// <returns></returns>
        public static IEnumerable<Game> DisplayAllGame(int consoleId, string alpa)
        {
            IEnumerable<Game> allgames;
            if (consoleId == 1)
            {
                allgames = alpa == "All" ? Db.Games.OrderBy(t => t.GameTitle).ToList()
                    : Db.Games.Where(a => a.GameTitle.StartsWith(alpa)).OrderBy(t => t.GameTitle).ToList();
            }
            else
            {
                allgames = alpa == "All" ? Db.Games.Where(ci => ci.ConsoleID_FK == consoleId).OrderBy(t => t.GameTitle).ToList()
                    : Db.Games.Where(ci => ci.ConsoleID_FK == consoleId && ci.GameTitle.StartsWith(alpa)).OrderBy(t => t.GameTitle).ToList();
            }
            return allgames;
        }

        /// <summary>
        /// Retrieve Games, Consoles, Developers
        /// </summary>
        /// <param name="gameid">
        /// Home/GameDetails, int gameid
        /// </param>
        /// <returns></returns>
        public static NewGame DisplayGamesDetails(int gameid)
        {
            var viewgdetail = (from g in Db.Games
                               join c in Db.Consoles on g.ConsoleID_FK equals c.Console_ID
                               join d in Db.Developers on g.DevID_FK equals d.DevID
                               where g.GameID == gameid
                               select new NewGame
                               {
                                   GameID = g.GameID,
                                   GameTitle = g.GameTitle,
                                   Price = g.Price,
                                   Image = g.Image,
                                   Description = g.Description,
                                   System_Req = g.System_Requirements,
                                   ConsoleName = c.ConsoleName,
                                   DeveloperName = d.DeveloperName
                               }).FirstOrDefault();
            return viewgdetail;
        }

        /// <summary>
        /// Retrieve GamePreview
        /// </summary>
        /// <param name="gameid">
        /// Home/GamePreview, int gameid
        /// </param>
        /// <returns></returns>
        public static IEnumerable<GamePreview> DisplayGamePreview(int gameid)
        {
            IEnumerable<GamePreview> gameprev = Db.GamePreviews.Where(i => i.GameID_FK == gameid).OrderByDescending(p => p.PreviewType).ToList();
            return gameprev;
        }
    }
}