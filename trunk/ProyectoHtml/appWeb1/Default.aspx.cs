using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string GetAudio()
    {
        //write logic to return random audio file
        return "Medios/12 La luz y la ilusion.mp3";
    }
    [WebMethod]
    public static string GetVideo()
    {
        //write logic to return random video file
        return "Medios/pepe.mp4";
    }
}