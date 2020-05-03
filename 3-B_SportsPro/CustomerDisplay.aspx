<%@ Page Language="C#" Title="Project 1-B: Create Contact List" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerDisplay.aspx.cs" Inherits="CustomerDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style3
        {
            width: 72px;
        }
        .style4
        {
            width: 170px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    Select a customer:&nbsp;
    <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="AccessDataSource1"
        DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True">
    </asp:DropDownList>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/TechSupport.mdb"
        SelectCommand="SELECT * FROM [Customers] ORDER BY [Name]">
    </asp:AccessDataSource>
    <br />
    <br />
    <table>
        <tr>
            <td class="style3">
                Address:</td>
            <td class="style4">
                <asp:Label ID="lblAddress" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="style3">
                </td>
            <td class="style4">
                <asp:Label ID="lblCityStateZip" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="style3">
                Phone:</td>
            <td class="style4">
                <asp:Label ID="lblPhone" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="style3">
                Email:</td>
            <td class="style4">
                <asp:Label ID="lblEmail" runat="server"></asp:Label></td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnAdd" runat="server" Text="Add to Contact List" Width="144px" 
        onclick="btnAdd_Click" />&nbsp;
    <asp:Button ID="btnDisplay" runat="server" PostBackUrl="~/ContactDisplay.aspx" Text="Display Contact List"
        Width="144px" /><br />
    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label><br />
</asp:Content>
