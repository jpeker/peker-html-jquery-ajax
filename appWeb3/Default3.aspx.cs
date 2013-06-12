using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Dll.Items.Add(new ListItem("Celcius","C"));
        this.Dll.Items.Add(new ListItem("Fahrenheit", "F"));

    }
}