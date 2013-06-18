using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcApplication1.Controllers
{
    public class ChartController : Controller
    {
        //
        // GET: /Chart/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public JsonResult SaveChart(string data, ChartMaster master, ChartDetail[] details)
        {
            Guid id = Guid.NewGuid();
            string path = HttpContext.Server.MapPath("~/images/" + id.ToString() + ".png");
            byte[] binaryData = Convert.FromBase64String(data);
            FileStream file = new FileStream(path, FileMode.Create);
            BinaryWriter bw = new BinaryWriter(file);
            bw.Write(binaryData);
            bw.Close();
            Html5PruebaEntities db = new Html5PruebaEntities();
            master.Id = id.GetHashCode();
            master.ImageUrl = "~/images/" + id.ToString() + ".png";
            db.ChartMaster.Add(master);
            foreach (ChartDetail detail in details)
            {
                detail.ChartId = master.Id;
                db.ChartDetail.Add(detail);
            }
            db.SaveChanges();
            return Json("Chart saved in the database!");
        }

    }
}
