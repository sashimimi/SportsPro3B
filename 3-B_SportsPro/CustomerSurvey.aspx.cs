using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CustomerSurvey : System.Web.UI.Page
{
    private DataView incidentsTable;

    protected void btnGetIncidents_Click(object sender, EventArgs e)
    {
        incidentsTable = (DataView)
            AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        incidentsTable.RowFilter = "CustomerID = " + txtCustomerID.Text
            + " And DateClosed Is Not Null";
        if (incidentsTable.Count > 0)
        {
            this.DisplayClosedIncidents();
            this.EnableControls(true);
            lstIncidents.Focus();
        }
        else
        {
            lblNoIncidents.Text = "There are no incidents for that customer.";
            this.EnableControls(false);
        }
    }

    private void DisplayClosedIncidents()
    {
        lstIncidents.Items.Add(new ListItem("--Select an incident--", "None"));
        foreach (DataRowView row in incidentsTable)
        {
            Incident incident = new Incident();
            incident.IncidentID = Convert.ToInt32(row["IncidentID"]);
            incident.ProductCode = row["ProductCode"].ToString();
            incident.DateClosed = Convert.ToDateTime(row["DateClosed"]);
            incident.Title = row["Title"].ToString();
            lstIncidents.Items.Add(new ListItem(
                incident.CustomerIncidentDisplay(), incident.IncidentID.ToString()));
        }
        lstIncidents.SelectedIndex = 0;
        lblNoIncidents.Text = "";
    }

    private void EnableControls(bool enable)
    {
        lstIncidents.Enabled = enable;
        lblHeading.Enabled = enable;
        lblResponseTime.Enabled = enable;
        rblResponseTime.Enabled = enable;
        lblEfficiency.Enabled = enable;
        rblEfficiency.Enabled = enable;
        lblResolution.Enabled = enable;
        rblResolution.Enabled = enable;
        lblComments.Enabled = enable;
        txtComments.Enabled = enable;
        chkContact.Enabled = enable;
        rdoContactByEmail.Enabled = enable;
        rdoContactByPhone.Enabled = enable;
        btnSubmit.Enabled = enable;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Survey survey = new Survey();
            survey.CustomerID = Convert.ToInt32(txtCustomerID.Text);
            survey.IncidentID = Convert.ToInt32(lstIncidents.SelectedValue);
            if (rblResponseTime.SelectedIndex != -1)
            {
                survey.ResponseTime = Convert.ToInt32(rblResponseTime.SelectedValue);
            }
            if (rblEfficiency.SelectedIndex != -1)
            {
                survey.TechEfficiency = Convert.ToInt32(rblEfficiency.SelectedValue);
            }
            if (rblResolution.SelectedIndex != -1)
            {
                survey.Resolution = Convert.ToInt32(rblResolution.SelectedValue);
            }
            survey.Comments = txtComments.Text;
            if (chkContact.Checked)
            {
                survey.Contact = true;
                if (rdoContactByEmail.Checked)
                    survey.ContactBy = "Email";
                else
                    survey.ContactBy = "Phone";
                Session.Add("Contact", true);
            }
            else
            {
                survey.Contact = false;
                Session.Add("Contact", false);
            }
            Response.Redirect("SurveyComplete.aspx");
        }
    }
}
