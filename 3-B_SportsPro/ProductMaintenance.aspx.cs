using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductMaintenance : System.Web.UI.Page
{
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["ProductCode"].DefaultValue = txtProductCode.Text;
        SqlDataSource1.InsertParameters["Name"].DefaultValue = txtName.Text;
        SqlDataSource1.InsertParameters["Version"].DefaultValue = txtVersion.Text;
        SqlDataSource1.InsertParameters["ReleaseDate"].DefaultValue = txtReleaseDate.Text;
        try
        {
            SqlDataSource1.Insert();
            txtProductCode.Text = "";
            txtName.Text = "";
            txtVersion.Text = "";
            txtReleaseDate.Text = "mm/dd/yy";
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = "A database error has occurred. "
                + "Message: " + ex.Message;
        }
    }

    protected void grdProducts_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblErrorMessage.Text = "A database error has occurred. "
                + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblErrorMessage.Text = "Another user may have updated this product. "
                + "Please try again.";
        }
    }

    protected void grdProducts_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblErrorMessage.Text = "A database error has occurred. "
                + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblErrorMessage.Text = "Another user may have updated that product. "
                + "Please try again.";
        }
    }
}