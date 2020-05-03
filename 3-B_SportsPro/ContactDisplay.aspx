<%@ Page Language="C#" Title="Project 1-B: Create Contact List" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ContactDisplay.aspx.cs" Inherits="ContactDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style3
        {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    Contact list:<br />
    <table>
        <tr>
            <td class="style3">
                <asp:ListBox ID="lstContacts" runat="server" Height="120px" Width="440px"></asp:ListBox></td>
            <td class="style3">
                <asp:Button ID="btnRemove" runat="server" Text="Remove Contact" Width="120px" 
                    onclick="btnRemove_Click" /><br />
                <br />
                <asp:Button ID="btnEmpty" runat="server" Text="Empty List" Width="120px" 
                    onclick="btnEmpty_Click" /></td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnSelect" runat="server" Text="Select Additional Customers" PostBackUrl="~/CustomerDisplay.aspx" Width="184px" /><br />
</asp:Content>
