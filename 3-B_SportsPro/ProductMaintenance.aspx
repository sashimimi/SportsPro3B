<%@ Page Title="Project 3-B: Maintain Products" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProductMaintenance.aspx.cs" Inherits="ProductMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100px;
        }
        .style2
        {
            width: 4px;
        }
        .style3
        {
            width: 274px;
        }
        .style4
        {
            color: #0000FF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
    <asp:GridView ID="grdProducts" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ProductCode" DataSourceID="SqlDataSource1" 
        BorderColor="Blue" BorderWidth="1px" CellPadding="4" 
        ForeColor="#333333" GridLines="None" Width="710px" 
        onrowdeleted="grdProducts_RowDeleted" onrowupdated="grdProducts_RowUpdated">
        <Columns>
            <asp:TemplateField HeaderText="Product code" SortExpression="ProductCode">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductCode") %>'></asp:Label>
                </EditItemTemplate>
                <ItemStyle Width="100px" />
                <HeaderStyle HorizontalAlign="Left" />
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProductCode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGridName" runat="server" Text='<%# Bind("Name") %>' Width="175px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtGridName"
                        ErrorMessage="Name is a required field." ValidationGroup="Edit" Display="Dynamic">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemStyle Width="200px" />
                <HeaderStyle HorizontalAlign="Left" />
                <ItemTemplate>
                    <asp:Label ID="lblGridName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Version" SortExpression="Version">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGridVersion" runat="server" Text='<%# Bind("Version") %>' Width="45px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtGridVersion"
                        Display="Dynamic" ErrorMessage="Version is a required field." ValidationGroup="Edit">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="txtGridVersion"
                        Display="Dynamic" ErrorMessage="Version must be a decimal value." Operator="DataTypeCheck"
                        Type="Double" ValidationGroup="Edit">*</asp:CompareValidator>
                </EditItemTemplate>
                <ItemStyle Width="65px" />
                <HeaderStyle HorizontalAlign="Left" />
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Version") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Release date" SortExpression="ReleaseDate">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGridDate" runat="server" Text='<%# Bind("ReleaseDate", "{0:d}") %>'
                        Width="80px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtGridDate"
                        ErrorMessage="Release date is a required field." ValidationGroup="Edit" Display="Dynamic">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtGridDate"
                        Display="Dynamic" ErrorMessage="Invalid date format." Operator="DataTypeCheck"
                        Type="Date" ValidationGroup="Edit">*</asp:CompareValidator>
                </EditItemTemplate>
                <ItemStyle Width="105px" />
                <HeaderStyle HorizontalAlign="Left" />
                <ItemTemplate>
                    <asp:Label ID="lblGridDate" runat="server" Text='<%# Bind("ReleaseDate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowEditButton="True" ValidationGroup="Edit" />
            <asp:CommandField ButtonType="Button" CausesValidation="False" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" Font-Size="Small" />
        <EditRowStyle BackColor="CornflowerBlue" ForeColor="White" Font-Size="Small" Font-Bold="True" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="Blue" Font-Bold="True" Font-Names="Arial" Font-Size="Small"
            ForeColor="White" />
        <AlternatingRowStyle BackColor="White" Font-Size="Small" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [ProductCode], [Name], [ReleaseDate], [Version] FROM [Products] ORDER BY [ProductCode]"
        InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [ReleaseDate], [Version]) VALUES (@ProductCode, @Name, @ReleaseDate, @Version)"
        UpdateCommand="UPDATE [Products] SET [Name] = @Name, [ReleaseDate] = @ReleaseDate, [Version] = @Version WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [ReleaseDate] = @original_ReleaseDate AND [Version] = @original_Version"
        DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [ReleaseDate] = @original_ReleaseDate AND [Version] = @original_Version">
        <DeleteParameters>
            <asp:Parameter Name="original_ProductCode" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
            <asp:Parameter Name="original_Version" Type="Decimal" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
            <asp:Parameter Name="Version" Type="Decimal" />
            <asp:Parameter Name="original_ProductCode" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
            <asp:Parameter Name="original_Version" Type="Decimal" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductCode" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
            <asp:Parameter Name="Version" Type="Decimal" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Please correct the following errors:"
        ValidationGroup="Edit" Width="275px" ForeColor="Red" />
    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label><br />
    <br />
    <span class="style4">
    To add a new product, enter the product information and click Add Product.</span><br />
    <br />
    <table>
        <tr>
            <td class="style1">Product code:</td>
            <td class="style1">
                <asp:TextBox ID="txtProductCode" runat="server" Width="100px"></asp:TextBox>
            </td>
            <td class="style2"></td>
            <td class="style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtProductCode"
                    ErrorMessage="Product code is a required field." Display="Dynamic" ValidationGroup="Add">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">Name:</td>
            <td class="style1">
                <asp:TextBox ID="txtName" runat="server" Width="210px"></asp:TextBox>
            </td>
            <td class="style2"></td>
            <td class="style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtName"
                    ErrorMessage="Name is a required field." Display="Dynamic" ValidationGroup="Add">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">Version:</td>
            <td class="style1">
                <asp:TextBox ID="txtVersion" runat="server" Width="100px"></asp:TextBox>
            </td>
            <td class="style2"></td>
            <td class="style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtVersion"
                    Display="Dynamic" ErrorMessage="Version is a required field." ValidationGroup="Add">
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtVersion"
                    Display="Dynamic" ErrorMessage="Version must be a decimal value." Operator="DataTypeCheck"
                    Type="Double" ValidationGroup="Add">
                </asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">Release date:</td>
            <td class="style1">
                <asp:TextBox ID="txtReleaseDate" runat="server" Width="100px">mm/dd/yy</asp:TextBox>
            </td>
            <td class="style2"></td>
            <td class="style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtReleaseDate"
                    Display="Dynamic" ErrorMessage="Date is a required field." InitialValue="mm/dd/yy" ValidationGroup="Add">
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtReleaseDate"
                    Display="Dynamic" ErrorMessage="Invalid date format." Operator="DataTypeCheck"
                    Type="Date" ValidationGroup="Add">
                </asp:CompareValidator>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnAdd" runat="server" Text="Add Product" ValidationGroup="Add" 
        onclick="btnAdd_Click" /><br />
</asp:Content>

