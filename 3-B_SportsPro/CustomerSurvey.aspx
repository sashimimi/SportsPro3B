<%@ Page Language="C#" Title="Project 2-A: Survey Customer" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerSurvey.aspx.cs" Inherits="CustomerSurvey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style3
        {
            width: 140px;
        }
        .style4
        {
            width: 470px;
        }
        .style5
        {
            width: 16px;
        }
        .style6
        {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    Enter your customer ID: &nbsp;&nbsp;
    <asp:TextBox ID="txtCustomerID" runat="server" Width="72px"></asp:TextBox>&nbsp;
    <asp:Button ID="btnGetIncidents" runat="server" Text="Get Incidents" 
        ValidationGroup="CustomerID" onclick="btnGetIncidents_Click" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomerID"
        Display="Dynamic" ErrorMessage="You must enter a customer ID." 
        ValidationGroup="CustomerID" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCustomerID"
        Display="Dynamic" ErrorMessage="Customer ID must be an integer." Operator="DataTypeCheck"
        Type="Integer" ValidationGroup="CustomerID" ForeColor="Red"></asp:CompareValidator><br />
    <asp:Label ID="lblNoIncidents" runat="server" ForeColor="Red"></asp:Label><br />
                <asp:ListBox ID="lstIncidents" runat="server" Width="448px" Enabled="False"></asp:ListBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="You must select an incident." ControlToValidate="lstIncidents" 
        InitialValue="None" Width="192px" Display="Dynamic" Enabled="False" 
        ValidationGroup="Submit" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/TechSupport.mdb"
        SelectCommand="SELECT [CustomerID], [ProductCode], [DateOpened], [Title], [DateClosed], [TechID], [IncidentID] FROM [Incidents] ORDER BY [DateClosed]">
    </asp:AccessDataSource>
    <br />
    <br />
    <asp:Label ID="lblHeading" runat="server" Font-Bold="True" Text="Please rate this incident by the following categories:" Enabled="False"></asp:Label><br />
    <table>
        <tr>
            <td class="style3" valign="top">
                <asp:Label ID="lblResponseTime" runat="server" Text="Response time:" Enabled="False"></asp:Label></td>
            <td class="style4">
                <asp:RadioButtonList ID="rblResponseTime" runat="server" RepeatDirection="Horizontal"
                    Width="470px" Enabled="False">
                    <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                    <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                    <asp:ListItem Value="3">Satisfied</asp:ListItem>
                    <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td class="style3" valign="top">
                <asp:Label ID="lblEfficiency" runat="server" Text="Technician efficiency:" Width="136px" Enabled="False"></asp:Label></td>
            <td class="style4">
                <asp:RadioButtonList ID="rblEfficiency" runat="server" RepeatDirection="Horizontal"
                    Width="470px" Enabled="False">
                <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                <asp:ListItem Value="3">Satisfied</asp:ListItem>
                <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
            </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td class="style3" valign="top">
                <asp:Label ID="lblResolution" runat="server" Text="Problem resolution:" Enabled="False"></asp:Label></td>
            <td class="style4"><asp:RadioButtonList ID="rblResolution" runat="server" RepeatDirection="Horizontal"
                    Width="470px" Enabled="False">
                <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                <asp:ListItem Value="3">Satisfied</asp:ListItem>
                <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
            </asp:RadioButtonList></td>
        </tr>
    </table>
    <br />
    <table>
        <tr>
            <td class="style3" valign="top">
                <asp:Label ID="lblComments" runat="server" Text="Additional comments:" Width="136px" Enabled="False"></asp:Label></td>
            <td class="style4">
                <asp:TextBox ID="txtComments" runat="server" Rows="4" TextMode="MultiLine" Width="470px" Enabled="False"></asp:TextBox></td>
        </tr>
    </table>
    <br />
    <asp:CheckBox ID="chkContact" runat="server" Text="Please contact me to discuss this incident" Enabled="False" /><br />
    <table>
        <tr>
            <td class="style5">
            </td>
            <td class="style6">
                <asp:RadioButton ID="rdoContactByEmail" runat="server" GroupName="Contact" Text="Contact by email"
                    Width="136px" Enabled="False" /><br />
                <asp:RadioButton ID="rdoContactByPhone" runat="server" GroupName="Contact" Text="Contact by phone"
                    Width="136px" Enabled="False" /></td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" Enabled="False" 
        ValidationGroup="Submit" onclick="btnSubmit_Click" /><br />
</asp:Content>
