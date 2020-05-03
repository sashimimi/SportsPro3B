using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerMaintenance : System.Web.UI.Page
{
    protected void dtlCustomer_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblErrorMessage.Text = "A database error has occurred. "
                + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblErrorMessage.Text = "Another user may have updated that product. "
                + "Please try again.";
        else
            grdCustomers.DataBind();
    }

    protected void dtlCustomer_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblErrorMessage.Text = "A database error has occurred. "
                + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else
            grdCustomers.DataBind();
    }

    protected void dtlCustomer_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblErrorMessage.Text = "A database error has occurred. "
                + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblErrorMessage.Text = "Another user may have updated that product. "
                + "Please try again.";
        else
            grdCustomers.DataBind();
    }
}