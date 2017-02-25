<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login_success.aspx.cs" Inherits="login_success" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Login Successful!

       Redirecting to home page...
    </p>
    <p>&nbsp;</p>
    <p>
        <asp:Label ID="userSessLabel" runat="server" Text="User: "></asp:Label>
    </p>

    
</asp:Content>

