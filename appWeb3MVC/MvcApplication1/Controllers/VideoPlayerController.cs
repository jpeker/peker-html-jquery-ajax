using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcApplication1.Controllers
{
    public class VideoPlayerController : Controller
    {
        //
        // GET: /VideoPlayer/

        public ActionResult Index()
        {
            return View();
        }
        public JsonResult GetPlayList()
        {
           VideoDbEntities db = new VideoDbEntities();

            var data = db.Video;

            return Json(data.ToArray());

        }
    }
}
