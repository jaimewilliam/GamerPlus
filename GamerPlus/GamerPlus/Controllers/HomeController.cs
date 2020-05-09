using GamerPlus.DataAccess;
using GamerPlus.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GamerPlus.Controllers
{
    public class HomeController : Controller
    {
        GamerPlusEntities Db = new GamerPlusEntities();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GamingConsole()
        {
            IEnumerable<Models.Console> consolename = HomeDataAccess.SelectConsole();
            return PartialView(consolename);
        }

        //public ActionResult CarouselBootstrap()
        //{
        //    ViewBag.Message = "Your contact page.";

        //    return PartialView();
        //}

        public ActionResult Carousel(int consoleId)
        {
            IEnumerable<Game> top = HomeDataAccess.SetCarousel(consoleId);
            return PartialView(top);
        }

        public ActionResult LogoAppName()
        {
            var logoName = HomeDataAccess.DisplayNameLogo();
            return PartialView(logoName);
        }

        public ActionResult GenreList(int consoleId, string alpa)
        {
            //var genre = Db.Genres.ToList();
            IEnumerable<NewGenre> newgenre;
            if (consoleId == 1)
            {
                if (alpa == "All")
                {
                    newgenre = HomeDataAccess.DisplayGenre().GroupBy(ng => ng.GenreIDFK).Select(ng => ng.FirstOrDefault()).OrderBy(ng => ng.GenreID);
                }
                else
                {
                    newgenre = HomeDataAccess.DisplayGenre().Where(gr => gr.GenreName.StartsWith(alpa)).GroupBy(g => g.GenreIDFK).Select(g => g.FirstOrDefault()).OrderBy(ng => ng.GenreID);
                }
                
                TempData.Remove("cId");

                //var list = from l in newgenre
                //           group l by l.GenreIDFK
                //           into groups
                //           select groups.OrderBy(p => p.GenreIDFK).ToList();

            }
            else
            {
                
                TempData["cId"] = consoleId;
                //TempData.Keep();

                if (alpa == "All")
                {
                    newgenre = HomeDataAccess.DisplayGenre(consoleId).GroupBy(g => g.GenreIDFK).Select(g => g.FirstOrDefault()).OrderBy(ng => ng.GenreID);
                }
                else
                {
                    newgenre = HomeDataAccess.DisplayGenre(consoleId).Where(gr => gr.GenreName.StartsWith(alpa)).GroupBy(g => g.GenreIDFK).Select(g => g.FirstOrDefault()).OrderBy(ng => ng.GenreID);
                }
            }
            
            return PartialView(newgenre);
        }

        public ActionResult GameList(int consoleId, int genreID)
        {
            IEnumerable<Game> game = HomeDataAccess.DisplayGame(consoleId, genreID);
            return PartialView(game);
        }

        public ActionResult AllGameList(int consoleId, string alpa)
        {
            IEnumerable<Game> allgames = HomeDataAccess.DisplayAllGame(consoleId, alpa);
            return PartialView(allgames);
        }

        public ActionResult GameDetails(int gameid)
        {
            //var viewgdetail = Db.Games.Where(i => i.GameID == gameid).FirstOrDefault();

            var viewgdetail = HomeDataAccess.DisplayGamesDetails(gameid);
            return PartialView(viewgdetail);
        }

        public ActionResult GamePreview(int gameid)
        {
            IEnumerable<GamePreview> gameprev = HomeDataAccess.DisplayGamePreview(gameid);
            return PartialView(gameprev);
        }

    }
}