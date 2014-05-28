using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using ClassLibrary1.Dashboard;

namespace admin_app.Dashboard
{
    public partial class dash : System.Web.UI.Page
    {
        /* Class Field Declaration Area */        
        User_BusinessLayer bmet = new User_BusinessLayer();
        List<UserFields> userList = null;
        UserPicture bmet_picture = new UserPicture();
        Overalls_BusinessLayer objOverall = new Overalls_BusinessLayer();        
        static int count = 0;

        public dash()
        {
            this.userList = bmet.getBMET();
        }       

        protected void Page_Load(object sender, EventArgs e)
        {            
            //Time.Now formated            
            //lblDate.Text = DateTime.Now.ToString("ddd MMMM d, yyyy");

            //Current Month Opened PMs
            lblOpenPM.Text = objOverall.getOpenedPMs(30).ToString();
            lblMonth1.Text = DateTime.Now.ToString("MMMM");

            //Current Month Opened PMs Priorities
            lblOpenedPriorities.Text = objOverall.getOpenedPMs(31).ToString();
            lblMonth2.Text = DateTime.Now.ToString("MMMM");

            //Total Pending PickUp
            lblPendingPickUp1.Text = objOverall.getPendingPickUp().ToString();

            //Monthly PM Compliance Percentage
            lblMonthlyPMCompliance1.Text = objOverall.getPMComplianceOverall().ToString();            

            //YTD Priority Compliance Percentage
            lblYTDPriorityCompliance.Text = objOverall.getYTDPrioritiesCompliance().ToString();

            //Monthly PM Compliance Percentage
            lblPMCompliance.Text = objOverall.getPMComplianceOverall().ToString();
            lblMonthlyPMCompliance2.Text = objOverall.getPMComplianceOverall().ToString();

            //Total Pending PickUp
            lblPendingPickUp2.Text = objOverall.getPendingPickUp().ToString();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {            
            if (count == this.userList.Count())
            {
                count = 0; //Reset count
            }
            else
            {                
                ASPxBinaryImage1.Value = bmet_picture.getPicture(this.userList[count].bmet_id);
                Label1.Text = this.userList[count].bmet_name.ToString();
                lblUserOverall.Text = objOverall.getUserCompliance(this.userList[count].bmet_id).ToString();
                SqlDataSource1.SelectParameters[0].DefaultValue = this.userList[count].bmet_id.ToString();
                SqlDataSource2.SelectParameters[0].DefaultValue = this.userList[count].bmet_id.ToString();
                count++;                
            }
        }

        protected void UpdatePanel2_Load(object sender, EventArgs e)
        {
            //System.Threading.Thread.Sleep(2000);// Intentionally pauses server-side processing

            this.WebChartControl3.Width = new Unit(hidden_chrt1Width.Value);
            this.WebChartControl4.Width = new Unit(hidden_chrt2Width.Value);
            this.WebChartControl5.Width = new Unit(hidden_chrt3Width.Value);

            double chrt1, chrt2;
            chrt1 = Convert.ToInt32(hidden_chrt4Width.Value) * .28;
            chrt2 = Convert.ToInt32(hidden_chrt4Width.Value) * .68;          

            this.WebChartControl1.Width = new Unit(chrt1.ToString());
            this.WebChartControl2.Width = new Unit(chrt2.ToString());

            this.WebChartControl6.Width = new Unit(hidden_chrt5Width.Value);
        }

        protected void WebChartControl3_CustomCallback(object sender, DevExpress.XtraCharts.Web.CustomCallbackEventArgs e)
        {
            MessageBox.Show("hello world");
        }
    }
}