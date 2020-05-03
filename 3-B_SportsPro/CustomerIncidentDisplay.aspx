<%@ Title="Project 3-A: Display Customer Incidents" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerIncidentDisplay.aspx.cs" Inherits="CustomerIncidentDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 600px;
        }
        .style2
        {
            width: 210px;
        }
        .style3
        {
            width: 170px;
        }
        .style4
        {
            width: 110px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
    Select a customer:&nbsp;
    <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="SqlDataSource1"
        DataTextField="Name" DataValueField="CustomerID" Width="141px" AutoPostBack="True">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>"
        SelectCommand="SELECT [CustomerID], [Name] FROM [Customers] ORDER BY [Name]">
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:DataList ID="dlIncidents" runat="server" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" BorderColor="Blue" BorderWidth="1px">
        <ItemTemplate>
            <table class="style1">
                <tr>
                    <td class="style2">
                        <asp:Label ID="lblProduct" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </td>
                    <td class="style3">
                        <asp:Label ID="lblTechnician" runat="server" Text='<%# Eval("TechName") %>'></asp:Label>
                    </td>
                    <td class="style4">
                        <asp:Label ID="lblDateOpened" runat="server" Text='<%# Eval("DateOpened", "{0:d}") %>'></asp:Label>
                    </td>
                    <td class="style4">
                        <asp:Label ID="lblDateClosed" runat="server" Text='<%# Eval("DateClosed", "{0:d}") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <HeaderTemplate>
            <table class="style1">
                <tr>
                    <td class="style2" valign="top">Product/<br />Incident</td>
                    <td class="style3" valign="top">Tech name</td>
                    <td class="style4" valign="top">Date opened</td>
                    <td class="style4" valign="top">Date closed</td>
                </tr>
            </table>
        </HeaderTemplate>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <AlternatingItemStyle BackColor="White" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" />
        <ItemStyle BackColor="#EFF3FB" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" />
        <HeaderStyle BackColor="Blue" Font-Bold="True" ForeColor="White" Font-Italic="False" Font-Names="Arial" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" />
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>"
        SelectCommand="SELECT Products.Name, Technicians.Name AS TechName,
                              Incidents.DateOpened, Incidents.DateClosed,
                              Incidents.Description
                       FROM Incidents
                       INNER JOIN Technicians
                          ON Incidents.TechID = Technicians.TechID
                       INNER JOIN Products
                          ON Incidents.ProductCode = Products.ProductCode
                       WHERE (Incidents.CustomerID = @CustomerID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCustomers" Name="CustomerID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>