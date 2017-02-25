<%@ Page Title="Login | thecarplace." Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Login Form</h1>

    <div id="loginForm">
        <p>Please enter your details below.</p>
        
        <asp:Label ID="usernameLabel" runat="server" Text="username:" Width="75px" CssClass="text-center"></asp:Label>
        <asp:TextBox ID="usernameInput" runat="server" TextMode="Email" placeholder="someone@example.com" Width="200px"></asp:TextBox><br /><br />
        
        <asp:Label ID="passwordLabel" runat="server" Text="password:" Width="75px" CssClass="text-center"></asp:Label>
        <asp:TextBox ID="passwordInput" runat="server" TextMode="Password" placeholder="password" Width="200px"></asp:TextBox><br /><br />

        <asp:Button ID="loginBTN" runat="server" Text="log in" OnClick="loginBTN_Click" BackColor="#009933" Font-Bold="True" 
            ForeColor="White" Font-Size="Small" Height="30px" Width="275px"/>
    </div>
</asp:Content>
