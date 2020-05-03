<%@ Page Title="Project 2-B: Display Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="SportsPro.ContactUs" %>

<asp:Content ID="main" ContentPlaceHolderID="mainContent" runat="server">
    <h3 class="col-sm-offset-1">How to contact us</h3>

    <div class="row">
        <div class="col-sm-offset-1 col-sm-10">
            <p>If you ever have any questions or comments about our products,<br />
            please be sure to contact us in whatever way is most convenient for you.</p>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-offset-1 col-sm-2">Phone:</div>
        <div class="col-sm-8">
            1-800-555-0400<br />
            Weekdays, 8 to 5 Pacific Time
        </div>
    </div>
    <div class="row">
        <div class="col-sm-offset-1 col-sm-2">E-mail:</div>
        <div class="col-sm-8">
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="mailto:sportspro@sportsprosoftware.com">
                sportspro@sportsprosoftware.com</asp:HyperLink>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-offset-1 col-sm-2">Fax:</div>
        <div class="col-sm-8">
            1-559-555-2732
        </div>
    </div>
    <div class="row">
        <div class="col-sm-offset-1 col-sm-2">Address:</div>
        <div class="col-sm-8">
            SportsPro Software, Inc.<br />
            1500 N. Main Street<br />
            Fresno, California 93710
        </div>
    </div>
</asp:Content>
