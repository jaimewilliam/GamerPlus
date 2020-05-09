using GamerPlus.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GamerPlus.DataAccess
{
    public class HomeDataAccess
    {
        private static GamerPlusEntities Db = new GamerPlusEntities();

        public static IEnumerable<Models.Console> SelectConsole()
        {
            IEnumerable<Models.Console> consoles = Db.Consoles.ToList();
            return consoles;
        }

        public static IEnumerable<Game> SetCarousel(int consoleId)
        {
            IEnumerable<Game> top;
            if (consoleId == 1)
            {
                top = Db.Games.OrderByDescending(b => b.BestSelling).Take(4).ToList();
            }
            else
            {
                top = Db.Games.Where(i => i.ConsoleID_FK == consoleId).OrderByDescending(b => b.BestSelling).Take(4).ToList();
            }
            return top;
        }

        public static NameLogo DisplayNameLogo()
        {
            var logoName = Db.NameLogoes.FirstOrDefault();
            return logoName;
        }

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

        public static IEnumerable<Game> DisplayGame(int consoleId, int genreID)
        {
            IEnumerable<Game> game;
            if (consoleId == 1)
            {
                game = Db.Games.Where(i => i.GenreID_FK == genreID).OrderBy(t => t.GameTitle).ToList();
            }
            else
            {
                game = Db.Games.Where(i => i.ConsoleID_FK == consoleId && i.GenreID_FK == genreID).OrderBy(t => t.GameTitle).ToList();
            }
            return game;
        }

        public static IEnumerable<Game> DisplayAllGame(int consoleId, string alpa)
        {
            IEnumerable<Game> allgames;
            if (consoleId == 1)
            {
                if (alpa == "All")
                {
                    allgames = Db.Games.OrderBy(t => t.GameTitle).ToList();
                }
                else
                {
                    allgames = Db.Games.Where(a => a.GameTitle.StartsWith(alpa)).OrderBy(t => t.GameTitle).ToList();
                }

            }
            else
            {
                if (alpa == "All")
                {
                    allgames = Db.Games.Where(ci => ci.ConsoleID_FK == consoleId).OrderBy(t => t.GameTitle).ToList();
                }
                else
                {
                    allgames = Db.Games.Where(ci => ci.ConsoleID_FK == consoleId && ci.GameTitle.StartsWith(alpa)).OrderBy(t => t.GameTitle).ToList();
                }

            }
            return allgames;
        }

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

        public static IEnumerable<GamePreview> DisplayGamePreview(int gameid)
        {
            IEnumerable<GamePreview> gameprev = Db.GamePreviews.Where(i => i.GameID_FK == gameid).OrderByDescending(p => p.PreviewType).ToList();
            return gameprev;
        }
    }
}