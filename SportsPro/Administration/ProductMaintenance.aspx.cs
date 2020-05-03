using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/**
 * SportsPro3B
 * Mimi Lam
 * 2/19/2020
 **/

namespace SportsPro.Administration
{
    public partial class ProductMaintenance : System.Web.UI.Page
    {
        protected void grdProducts_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
                lblError.Text = ConcurrencyErrorMessage();
            else
            {
                grdProducts.DataBind();
                lblError.Text = "";
            }
        }

        protected void grdProducts_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
                lblError.Text = ConcurrencyErrorMessage();
            else
            {
                grdProducts.DataBind();
                lblError.Text = "";
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.InsertParameters;
                parameters["ProductCode"].DefaultValue = txtProductCode.Text;
                parameters["Name"].DefaultValue = txtName.Text;
                parameters["Version"].DefaultValue = txtVersion.Text;
                parameters["ReleaseDate"].DefaultValue = txtReleaseDate.Text;

                try
                {
                    SqlDataSource1.Insert();
                    txtProductCode.Text = "";
                    txtName.Text = "";
                    txtVersion.Text = "";
                    txtReleaseDate.Text = "";
                    lblError.Text = "";
                }
                catch (Exception ex)
                {
                    lblError.Text = DatabaseErrorMessage(ex.Message);
                }
            }
        }

        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }
        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated that category. Please try again";
        }
    }
}