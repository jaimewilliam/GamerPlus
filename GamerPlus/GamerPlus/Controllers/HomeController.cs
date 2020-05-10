using GamerPlus.DataAccess;
using GamerPlus.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace GamerPlus.Controllers
{
    public class HomeController : Controller
    {
        /// <summary>
        /// Default View
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// Console List Leftside
        /// </summary>
        /// <returns></returns>
        public ActionResult GamingConsole()
        {
            IEnumerable<Console> consolename = HomeDataAccess.SelectConsole();
            return PartialView(consolename);
        }

        /// <summary>
        /// Carousel Display
        /// </summary>
        /// <param name="consoleId">
        /// consoleId from GamingConsole.cshtml, element: $(".consolname_div").find(".consolename").attr("data-consoleId");
        /// </param>
        /// <returns></returns>
        public ActionResult Carousel(int consoleId)
        {
            IEnumerable<Game> top = HomeDataAccess.SetCarousel(consoleId);
            return PartialView(top);
        }

        /// <summary>
        /// Display Logo and Application Name
        /// </summary>
        /// <returns></returns>
        public ActionResult LogoAppName()
        {
            var logoName = HomeDataAccess.DisplayNameLogo();
            return PartialView(logoName);
        }

        /// <summary>
        /// Game Genre
        /// </summary>
        /// <param name="consoleId">
        /// consoleId from GamingConsole.cshtml, element: $(".consolname_div").find(".consolename").attr("data-consoleId");
        /// </param>
        /// <param name="alpa">
        /// Index.js, element: var letterdiv
        /// </param>
        /// <returns></returns>
        public ActionResult GenreList(int consoleId, string alpa)
        {
            IEnumerable<NewGenre> newgenre;
            if (consoleId == 1)
            {
                newgenre = alpa == "All" ? HomeDataAccess.DisplayGenre().GroupBy(ng => ng.GenreIDFK).Select(ng => ng.FirstOrDefault()).OrderBy(ng => ng.GenreID)
                            : HomeDataAccess.DisplayGenre().Where(gr => gr.GenreName.StartsWith(alpa)).GroupBy(g => g.GenreIDFK).Select(g => g.FirstOrDefault()).OrderBy(ng => ng.GenreID);
                
                TempData.Remove("cId");
            }
            else
            {
                TempData["cId"] = consoleId;

                newgenre = alpa == "All" ? HomeDataAccess.DisplayGenre(consoleId).GroupBy(g => g.GenreIDFK).Select(g => g.FirstOrDefault()).OrderBy(ng => ng.GenreID)
                            : HomeDataAccess.DisplayGenre(consoleId).Where(gr => gr.GenreName.StartsWith(alpa)).GroupBy(g => g.GenreIDFK).Select(g => g.FirstOrDefault()).OrderBy(ng => ng.GenreID);
            }
            
            return PartialView(newgenre);
        }

        /// <summary>
        /// Display Games According to Genre
        /// </summary>
        /// <param name="consoleId">
        /// GenreList.cshtml, element: int cid
        /// </param>
        /// <param name="genreID">
        /// GenreList.cshtml, element: NewGenre.GenreID
        /// </param>
        /// <returns></returns>
        public ActionResult GameList(int consoleId, int genreID)
        {
            IEnumerable<Game> game = HomeDataAccess.DisplayGame(consoleId, genreID);
            return PartialView(game);
        }

        /// <summary>
        /// Display All Games
        /// </summary>
        /// <param name="consoleId">
        /// consoleId from GamingConsole.cshtml, element: $(".consolname_div").find(".consolename").attr("data-consoleId");
        /// </param>
        /// <param name="alpa">
        /// Index.js, element: var letterdiv
        /// </param>
        /// <returns></returns>
        public ActionResult AllGameList(int consoleId, string alpa)
        {
            IEnumerable<Game> allgames = HomeDataAccess.DisplayAllGame(consoleId, alpa);
            return PartialView(allgames);
        }


        /// <summary>
        /// Display Details per Game
        /// </summary>
        /// <param name="gameid">
        /// gameid from GameList.cshtml, element: $(".imagemain_div1").find(".gameimage").attr("data-gameid");
        /// </param>
        /// <returns></returns>
        public ActionResult GameDetails(int gameid)
        {
            var viewgdetail = HomeDataAccess.DisplayGamesDetails(gameid);
            return PartialView(viewgdetail);
        }

        /// <summary>
        /// GamePreview
        /// </summary>
        /// <param name="gameid">
        /// gameid from GameList.cshtml, element: $(".imagemain_div1").find(".gameimage").attr("data-gameid");
        /// </param>
        /// <returns></returns>
        public ActionResult GamePreview(int gameid)
        {
            IEnumerable<GamePreview> gameprev = HomeDataAccess.DisplayGamePreview(gameid);
            return PartialView(gameprev);
        }

    }
}