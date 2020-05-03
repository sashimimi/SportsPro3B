<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: x-large;
            font-weight: bold;
        }
        .style2
        {
         width: 44px;
        }
        .style3
        {
            width: 300px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
    <span class="style1">How to contact us</span><br /><br />
    If you ever have any questions or comments about our products,<br />
    please be sure to contact us in whatever way is most convenient for you.<br />
    <br />
    <table cellpadding="4" style="width: 344px;">
        <tr>
            <td class="style2" valign="top">Phone:</td>
            <td class="style3">
                1-800-555-0400<br />
                Weekdays, 8 to 5 Pacific Time
            </td>
        </tr>
        <tr>
            <td class="style2">E-mail:</td>
            <td class="style3">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="mailto:sportspro@sportsprosoftware.com">
                    sportspro@sportsprosoftware.com</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="style2">Fax:</td>
            <td class="style3">1-559-555-2732</td>
        </tr>
        <tr>
            <td class="style2" valign="top">Address:</td>
            <td class="style3">
                SportsPro Software, Inc.<br />
                1500 N. Main Street<br />
                Fresno, California 93710
            </td>
        </tr>
    </table>
</asp:Content>

