<%@ Page Title="Member | thecarplace" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="memberPage.aspx.cs" Inherits="memberPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="memberPage">
        <asp:Label ID="memberTitleLbl" runat="server" Text="Hello, " Font-Bold="True" Width="500px"></asp:Label><br /><br />
        <a href="wishlist.aspx"><asp:Label ID="wishlistLinkLbl" runat="server" Text="Your Wishlist"></asp:Label></a><br />
        <a href="listCar.aspx"><asp:Label ID="uploadLinkLbl" runat="server" Text="Sell Your Car"></asp:Label></a><br /><br />
        <asp:Button ID="signOutBTN" runat="server" Text="log out" OnClick="signOutBTN_Click" BackColor="#CC0000" Font-Bold="True" 
            ForeColor="White" Font-Size="Small" Height="30px" Width="88px"/>
    </div>
</asp:Content>

