using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using NORTHWNDModel;

public partial class Default4 : System.Web.UI.Page
{
    NORTHWNDEntities context;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static void SaveToDb(string data)
    {
       /* NORTHWNDEntities db = new  NORTHWNDEntities ();
        Image img = new Image();
        img.ImageData = data;
        img.SaveDate = DateTime.Now;
        db.Images.AddObject(img);
        db.SaveChanges();*/
    }
    [WebMethod]
    public static void SaveAsImageFile(string data)
    {
        Guid id = Guid.NewGuid();
        string path = HttpContext.Current.Server.MapPath("~/Imagenes/" + id.ToString() + ".png");
        byte[] binaryData = Convert.FromBase64String(data);
        FileStream file = new FileStream(path, FileMode.Create);
        BinaryWriter bw = new BinaryWriter(file);
        bw.Write(binaryData);
        bw.Close();
    }
}