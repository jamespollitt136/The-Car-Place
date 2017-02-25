<%@ Page Title="Home | thecarplace" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="intro" runat="server">
        <p>Welcome to thecarplace. Please <a href="register.aspx">sign up</a> or <a href="login.aspx">sign in</a>.</p>
    </div>

    <div id="search">
        <asp:Panel ID="contentPanel" runat="server" Width="1340px" Height="330px" BackImageUrl="~/images/lexcarsbg.jpg" Wrap="False"> <br />
            <div id ="searchDiv">
                <asp:Panel ID="searchPanel" runat="server" Width="290px" Height="300px" BackColor="White" BorderColor="#333333" BorderStyle="Solid" BorderWidth="2px">
                <asp:Label ID="findLabel" runat="server" CssClass="text-center" Width="290px" Font-Bold="True" Font-Size="Medium" 
                    Text="find your perfect car:"></asp:Label><br /><br />
                
                <asp:Label ID="usedLabel" runat="server" CssClass="text-center" Text="show:" Width="75px"></asp:Label>
                <asp:DropDownList ID="usedDropDown" runat="server" Width="200px" DataSourceID="usedDataSource" DataTextField="used" DataValueField="used" OnSelectedIndexChanged="usedDropDown_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="usedDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [used] FROM [Cars]"></asp:SqlDataSource>
                    <br /><br />

                <asp:Label ID="makeLabel" runat="server" CssClass="text-center" Text="make:" Width="75px"></asp:Label>
                <asp:DropDownList ID="makeDropDown" runat="server" Width="200px" DataSourceID="makeDataSource" DataTextField="make" DataValueField="make" OnSelectedIndexChanged="makeDropDown_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    <asp:SqlDataSource ID="makeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [make] FROM [Cars]"></asp:SqlDataSource>
                    <br /><br />

                <asp:Label ID="yearLabel" runat="server" CssClass="text-center" Text="year:" Width="75px"></asp:Label>
                <asp:DropDownList ID="yearDropDown" runat="server" Width="200px" DataSourceID="yearDataSource" DataTextField="regYear" DataValueField="regYear" OnSelectedIndexChanged="yearDropDown_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    <asp:SqlDataSource ID="yearDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [regYear] FROM [Cars]"></asp:SqlDataSource>
                    <br /><br />

                <asp:Label ID="locationLabel" runat="server" CssClass="text-center" Text="location:" Width="75px"></asp:Label>
                <asp:TextBox ID="locationInput" runat="server" width="200px" OnTextChanged="locationInput_TextChanged"></asp:TextBox><br /><br />

                <asp:Button ID="searchBTN" runat="server" Text="search" BackColor="#009933" Font-Bold="True" 
                    ForeColor="White" Font-Size="Small" Height="30px" Width="277px" OnClick="searchBTN_Click"/>
            </asp:Panel>
            </div>   
        </asp:Panel>
    </div>
    <br /> <br />
    <div id="searchResults">
        <asp:Label ID="errorMsgLabel" runat="server"></asp:Label>
        <br />
    </div>
</asp:Content>