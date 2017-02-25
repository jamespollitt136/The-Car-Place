<%@ Page Title="List advert | thecarplace" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="listCar.aspx.cs" Inherits="listCar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h3>List an Advertisement</h3>
    <div id="uploadForm">
        <asp:Label ID="typeLbl" runat="server" CssClass="text-center" Text="type:" Width="75px"></asp:Label>
        <asp:TextBox ID="typeInput" runat="server" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_type" runat="server" ControlToValidate="typeInput"
		    ErrorMessage="Required Type" Width="1px" Font-Size="Small">Required!</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID ="typeRegEx" runat="server" ErrorMessage="Invalid characters" ValidationExpression="^[a-zA-Z]+$" 
            ControlToValidate="typeInput"/>
        <br />
        <br />

        <asp:Label ID="makeLbl" runat="server" CssClass="text-center" Text="make:" Width="75px"></asp:Label>
        <asp:TextBox ID="makeInput" runat="server" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_make" runat="server" ControlToValidate="makeInput"
		    ErrorMessage="Required Make" Width="1px" Font-Size="Small">Required!</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID ="makeRegEx" runat="server" ErrorMessage="Invalid characters" ValidationExpression="^[a-zA-Z]+$" 
            ControlToValidate="makeInput"/><br /><br />

        <asp:Label ID="modelLbl" runat="server" CssClass="text-center" Text="model:" Width="75px"></asp:Label>
        <asp:TextBox ID="modelInput" runat="server" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_model" runat="server" ControlToValidate="modelInput"
		    ErrorMessage="Required Model" Width="1px" Font-Size="Small">Required!</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID ="modelRegEx" runat="server" ErrorMessage="Invalid characters" ValidationExpression="^[a-zA-Z]+$" 
            ControlToValidate="modelInput"/><br /><br />

        <asp:Label ID="colourLbl" runat="server" CssClass="text-center" Text="colour:" Width="75px"></asp:Label>
        <asp:TextBox ID="colourInput" runat="server" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_colour" runat="server" ControlToValidate="colourInput"
		    ErrorMessage="Required Colour" Width="1px" Font-Size="Small">Required!</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID ="colourRegEx" runat="server" ErrorMessage="Invalid characters" ValidationExpression="^[a-zA-Z]+$" 
            ControlToValidate="colourInput"/><br /><br />

        <asp:Label ID="priceLbl" runat="server" CssClass="text-center" Text="price:" Width="75px"></asp:Label>
        <asp:TextBox ID="priceInput" runat="server" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_price" runat="server" ControlToValidate="priceInput"
		    ErrorMessage="Required Price" Width="1px" Font-Size="Small">Required!</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID ="priceRegEx" runat="server" ErrorMessage="Invalid characters" ValidationExpression="^[0-9]+$"
            ControlToValidate="priceInput"/><br /><br />

        <asp:Label ID="yearLbl" runat="server" CssClass="text-center" Text="year:" Width="75px"></asp:Label>
        <asp:TextBox ID="yearInput" runat="server" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_year" runat="server" ControlToValidate="yearInput"
		    ErrorMessage="Required Year" Width="1px" Font-Size="Small">Required!</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID ="yearRegEx" runat="server" ErrorMessage="Invalid characters" ValidationExpression="^[0-9]+$"
            ControlToValidate="priceInput"/><br /><br />

        <asp:Label ID="locationLbl" runat="server" CssClass="text-center" Text="location:" Width="75px"></asp:Label>
        <asp:TextBox ID="locationInput" runat="server" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_location" runat="server" ControlToValidate="locationInput"
		    ErrorMessage="Required Location" Width="1px" Font-Size="Small">Required!</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID ="locationRegEx" runat="server" ErrorMessage="Invalid characters" ValidationExpression="^[a-zA-Z]+$" 
            ControlToValidate="locationInput"/><br /><br />

        <asp:Label ID="usedLbl" runat="server" CssClass="text-center" Text="used:" Width="75px"></asp:Label>
        <asp:TextBox ID="usedInput" runat="server" Width="150px"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_used" runat="server" ControlToValidate="usedInput"
		    ErrorMessage="Required Used" Width="1px" Font-Size="Small">Required!</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID ="usedRegEx" runat="server" ErrorMessage="Invalid characters" ValidationExpression="^[a-zA-Z]+$" 
            ControlToValidate="usedInput"/><br /><br />

        <asp:Button ID="uploadBTN" runat="server" BackColor="#009933" CssClass="text-center" Font-Bold="True" 
            ForeColor="White" Text="upload" Width="225px" OnClick="uploadBTN_Click" /><br />

        <asp:Label ID="messageLbl" runat="server" Text=""></asp:Label>      

    </div>
</asp:Content>

