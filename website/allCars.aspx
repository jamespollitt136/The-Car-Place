<%@ Page Title="Listings | thecarplace" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="allCars.aspx.cs" Inherits="allCars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id ="allListingsIntro">
        <h3>all cars @ thecarplace</h3>
        <p>this page lists all listings to narrow your search go <a href="index.aspx">here</a>.</p>
        <p>&nbsp;</p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
                CellSpacing="2" DataSourceID="allCarsDataSource" Font-Names="Tahoma" ForeColor="Black" Width="861px">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                    <asp:BoundField DataField="make" HeaderText="make" SortExpression="make" />
                    <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" />
                    <asp:BoundField DataField="colour" HeaderText="colour" SortExpression="colour" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="regYear" HeaderText="regYear" SortExpression="regYear" />
                    <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
                    <asp:CheckBoxField DataField="used" HeaderText="used" SortExpression="used" />
                    <asp:HyperLinkField HeaderText="Wishlist" NavigateUrl="wishlist.aspx" Text="Add to Wishlist"/>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="Gray" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
        </p>
    </div>

    </asp:Content>

