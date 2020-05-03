<%@ Page Language="C#" Title="Project 2-A: Survey Customer" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SurveyComplete.aspx.cs" Inherits="SurveyComplete" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <asp:Label ID="lblMessage" runat="server" ForeColor="Black"></asp:Label><br />
    <br />
    <asp:Button ID="Button1" runat="server" PostBackUrl="~/CustomerSurvey.aspx" Text="Return to Survey" /><br />
</asp:Content>
