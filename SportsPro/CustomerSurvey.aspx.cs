﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

namespace SportsPro
{
    public partial class CustomerSurvey : System.Web.UI.Page
    {
        private DataView incidentsTable;

        protected void btnGetIncidents_Click(object sender, EventArgs e)
        {
            incidentsTable = (DataView)
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            incidentsTable.RowFilter = $"CustomerID = {txtCustomerID.Text} And DateClosed Is Not Null";

            if (incidentsTable.Count > 0)
            {
                DisplayClosedIncidents();
                EnableControls(true);
                lstIncidents.Focus();
            }
            else
            {
                lblNoIncidents.Text = "There are no incidents for that customer.";
                EnableControls(false);
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
            rblResponseTime.Enabled = enable;
            rblEfficiency.Enabled = enable;
            rblResolution.Enabled = enable;
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
                }
                else
                {
                    survey.Contact = false;
                }

                Session.Add("Contact", survey.Contact);
                Response.Redirect("~/CustomerSupport/SurveyComplete");
            }
        }
    }
}