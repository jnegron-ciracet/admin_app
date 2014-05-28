using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace admin_app.Test
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            
        }
       
        protected void Button1_Click(object sender, EventArgs e)
        {
                        
        }           

        protected void UpdatePanel1_Load(object sender, EventArgs e)
        {
            //MessageBox.Show("UpdatePanel1_Load");
            this.WebChartControl1.Width = new Unit(HiddenField1.Value);            
        }               
    }
}