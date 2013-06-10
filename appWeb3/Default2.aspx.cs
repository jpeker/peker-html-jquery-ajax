using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NORTHWNDModel;

public partial class Default2 : System.Web.UI.Page
{
    NORTHWNDEntities context;
    protected void Page_Load(object sender, EventArgs e)
    {
        Grilla();
    }
    private void Grilla()
    { 
        
        if (context == null) context = new NORTHWNDEntities();
        GridView1.DataSource = context.Employees;
        GridView1.DataBind();
    
    }
}