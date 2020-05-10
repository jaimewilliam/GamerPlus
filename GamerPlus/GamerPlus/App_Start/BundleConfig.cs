using System.Web;
using System.Web.Optimization;

namespace GamerPlus
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css"));

            bundles.Add(new StyleBundle("~/Css/gamerpluscss").Include(
                      "~/Css/Index.css",
                      "~/Css/AllGameList.css",
                      "~/Css/Carousel.css",
                      "~/Css/GameDetails.css",
                      "~/Css/GameList.css",
                      "~/Css/GamePreview.css",
                      "~/Css/GamingConsole.css",
                      "~/Css/GenreList.css",
                      "~/Css/LogoAppName.css",
                      "~/Css/_Layout.css"));

            bundles.Add(new ScriptBundle("~/bundles/gamerplusjquery").Include(
                        "~/Scripts/GPScripts/Index.js",
                        "~/Scripts/GPScripts/GenreList.js",
                        "~/Scripts/GPScripts/GameDetails.js",
                        "~/Scripts/GPScripts/Carousel.js",
                        "~/Scripts/GPScripts/GameList.js",
                        "~/Scripts/GPScripts/GamingConsole.js",
                        "~/Scripts/GPScripts/_Layout.js"));

            //BundleTable.EnableOptimizations = true;
        }
    }
}
