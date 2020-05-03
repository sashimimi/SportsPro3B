<%@ Page Title="3-B: Maintain products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductMaintenance.aspx.cs" Inherits="SportsPro.Administration.ProductMaintenance" %>

<asp:Content ID="main" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">

        <%-- Products GridView --%>
        <div class="col-sm-12 table-responsive">
            <!-- GridView control can go here -->
            <asp:GridView ID="grdProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductCode" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped table-condensed" OnRowUpdated="grdProducts_RowUpdated" OnRowDeleted="grdProducts_RowDeleted">
                <Columns>
                    <asp:TemplateField HeaderText="Product Code" SortExpression="ProductCode">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductCode") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-xs-10">
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-xs-2">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Product Name is a required field." Text="*" CssClass="text-danger" ControlToValidate="TextBox1" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Version" SortExpression="Version">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-xs-10">
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Version") %>' CssClass="form-control" MaxLength="3"></asp:TextBox>
                                </div>
                                <div class="col-xs-2">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Version is a required field." Text="*" CssClass="text-danger" ControlToValidate="TextBox2" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Version") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Release Date" SortExpression="ReleaseDate">
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-xs-10">
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ReleaseDate", "{0:d}") %>' CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-xs-2">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Release date is a required field." Text="*" CssClass="text-danger" ControlToValidate="TextBox3" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Release date is not a valid date." Text="*" CssClass="text-danger" ControlToValidate="TextBox3" Type="Date" Operator="DataTypeCheck" ValidationGroup="Edit"></asp:CompareValidator>
                                </div>
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("ReleaseDate", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ValidationGroup="Edit" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

            <%-- Sql data source --%>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate" InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (@ProductCode, @Name, @Version, @ReleaseDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Products] ORDER BY [ProductCode]" UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Version] = @Version, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate">
                <DeleteParameters>
                    <asp:Parameter Name="original_ProductCode" Type="String" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Version" Type="Decimal" />
                    <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductCode" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Version" Type="Decimal" />
                    <asp:Parameter Name="ReleaseDate" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Version" Type="Decimal" />
                    <asp:Parameter Name="ReleaseDate" Type="DateTime" />
                    <asp:Parameter Name="original_ProductCode" Type="String" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Version" Type="Decimal" />
                    <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>

    <%-- Validation summary and message label --%>
    <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
    <asp:ValidationSummary ID="vsEdit" runat="server" CssClass="text-danger" EnableViewState="False" HeaderText="Please correct the following errors." ValidationGroup="Edit" />
    <asp:ValidationSummary ID="vsAdd" runat="server" CssClass="text-danger" EnableViewState="False" ValidationGroup="Add" HeaderText="Please correct the following errors."/>

    <br />
    <br />
    <asp:Label ID="lblAddMessage" runat="server" Text="To add a new product, enter the product information and click Add Product"></asp:Label>
    <br />
    <br />

    <div class="row">
        <div class="col-sm-2">
            <asp:Label ID="lblProductCode" runat="server" Text="Product code:"></asp:Label>
        </div>
        <div class="col-sm-4">
            <%-- Product code text box --%>
            <asp:TextBox ID="txtProductCode" runat="server" CssClass="form-control"></asp:TextBox>        

        </div>
        <div class="col-sm-6">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Product code is a required field." Text="*" ControlToValidate="txtProductCode" CssClass="text-danger" ValidationGroup="Add"></asp:RequiredFieldValidator>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-sm-2">
            <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
        </div>
        <div class="col-sm-6">
            <%-- Name text box --%>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Product name is a required field." Text="*" ControlToValidate="txtName" CssClass="text-danger" ValidationGroup="Add"></asp:RequiredFieldValidator>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-sm-2">
            <asp:Label ID="lblVersion" runat="server" Text="Version:"></asp:Label>
        </div>
        <div class="col-sm-4">
            <%-- Version text box --%>
            <asp:TextBox ID="txtVersion" runat="server" CssClass="form-control" MaxLength="3"></asp:TextBox>
        </div>
        <div class="col-sm-6">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Version is a required field." Text="*" ControlToValidate="txtVersion" CssClass="text-danger" ValidationGroup="Add"></asp:RequiredFieldValidator>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-sm-2">
            <asp:Label ID="lblReleaseDate" runat="server" Text="Release date:"></asp:Label>
        </div>
        <div class="col-sm-4">
            <%-- Release date text box --%>
            <asp:TextBox ID="txtReleaseDate" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-6">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Release date is a required field." Text="*" ControlToValidate="txtReleaseDate" CssClass="text-danger" ValidationGroup="Add"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Release date is not a valid date." Text="*" CssClass="text-danger" ControlToValidate="txtReleaseDate" Type="Date" Operator="DataTypeCheck" ValidationGroup="Add"></asp:CompareValidator>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-4">
            <%-- Add button --%>
            <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="btn btn-primary" OnClick="btnAddProduct_Click" ValidationGroup="Add" />
        </div>
        <div class="col-sm-6"></div>
    </div>

</asp:Content>
