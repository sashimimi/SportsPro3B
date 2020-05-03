<%@ Page Title="Project 3-C: Maintain Customers" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerMaintenance.aspx.cs" Inherits="CustomerMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 375px;
        }
        .style2
        {
            width: 15px;
        }
        .style3
        {
            width: 255px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
    <table>
        <tr>
            <td class="style1" valign="top">
                <asp:GridView ID="grdCustomers" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" DataKeyNames="CustomerID"
                    DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="375px" SelectedIndex="0" PageSize="8" AllowSorting="True">
                    <PagerSettings Mode="NextPreviousFirstLast" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                            <ItemStyle Width="160px" />
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                            <ItemStyle Width="110px" />
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State">
                            <ItemStyle Width="45px" />
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" >
                            <ItemStyle Width="60px" />
                        </asp:CommandField>
                    </Columns>
                    <RowStyle BackColor="#EFF3FB" Font-Size="Small" />
                    <EditRowStyle BackColor="#2461BF" />
                    <SelectedRowStyle BackColor="CornflowerBlue" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="Blue" Font-Names="Arial" Font-Size="Small" ForeColor="White"
                        HorizontalAlign="Center" />
                    <HeaderStyle BackColor="Blue" Font-Bold="True" Font-Names="Arial" Font-Size="Small"
                        ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>"
                    SelectCommand="SELECT [CustomerID], [Name], [City], [State] FROM [Customers] ORDER BY [Name]">
                </asp:SqlDataSource>
            </td>
            <td class="style2"></td>
            <td class="style3" valign="top">
                <asp:DetailsView ID="dtlCustomer" runat="server" 
                    DataSourceID="SqlDataSource2" Height="50px"
                    Width="255px" AutoGenerateRows="False" BackColor="White" 
                    BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                    CellSpacing="2" GridLines="None" onitemdeleted="dtlCustomer_ItemDeleted" 
                    oniteminserted="dtlCustomer_ItemInserted" 
                    onitemupdated="dtlCustomer_ItemUpdated">
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <EditRowStyle BackColor="CornflowerBlue" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" ForeColor="Black" Font-Size="Small" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <Fields>
                        <asp:BoundField DataField="CustomerID" HeaderText="ID:" InsertVisible="False"
                            ReadOnly="True" SortExpression="CustomerID">
                            <HeaderStyle Width="65px" />
                            <ItemStyle Width="190px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Name:" SortExpression="Name">
                            <HeaderStyle Width="65px" />
                            <ItemStyle Width="190px" />
                            <ControlStyle Width="180px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Address" HeaderText="Address:" SortExpression="Address">
                            <HeaderStyle Width="65px" />
                            <ItemStyle Width="190px" />
                            <ControlStyle Width="180px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="City" HeaderText="City:" SortExpression="City">
                            <HeaderStyle Width="65px" />
                            <ItemStyle Width="190px" />
                            <ControlStyle Width="180px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="State" HeaderText="State:" SortExpression="State">
                            <HeaderStyle Width="65px" />
                            <ItemStyle Width="190px" />
                            <ControlStyle Width="40px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ZipCode" HeaderText="Zip code:" SortExpression="ZipCode">
                            <HeaderStyle Width="65px" />
                            <ItemStyle Width="190px" />
                            <ControlStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Phone" HeaderText="Phone:" SortExpression="Phone">
                            <HeaderStyle Width="65px" />
                            <ItemStyle Width="190px" />
                            <ControlStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="Email:" SortExpression="Email">
                            <HeaderStyle Width="65px" />
                            <ItemStyle Width="190px" />
                            <ControlStyle Width="180px" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True"
                            ShowInsertButton="True" />
                    </Fields>
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" 
                    DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [Phone] = @original_Phone AND [Email] = @original_Email"
                    InsertCommand="INSERT INTO [Customers] ([Name], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (@Name, @Address, @City, @State, @ZipCode, @Phone, @Email)"
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT [CustomerID], [Name], [Address], [City], [State], [ZipCode], [Phone], [Email] FROM [Customers] WHERE ([CustomerID] = @CustomerID)"
                    UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Phone] = @Phone, [Email] = @Email WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [Phone] = @original_Phone AND [Email] = @original_Email">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CustomerID" Type="Int32" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_State" Type="String" />
                        <asp:Parameter Name="original_ZipCode" Type="String" />
                        <asp:Parameter Name="original_Phone" Type="String" />
                        <asp:Parameter Name="original_Email" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="State" Type="String" />
                        <asp:Parameter Name="ZipCode" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="original_CustomerID" Type="Int32" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_State" Type="String" />
                        <asp:Parameter Name="original_ZipCode" Type="String" />
                        <asp:Parameter Name="original_Phone" Type="String" />
                        <asp:Parameter Name="original_Email" Type="String" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="grdCustomers" Name="CustomerID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="State" Type="String" />
                        <asp:Parameter Name="ZipCode" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <asp:Label ID="lblErrorMessage" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

