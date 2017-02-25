<%@ Page Title="Register | thecarplace" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h3>Registration Form</h3>
    <div id ="registration">
        <asp:Label ID="regIntroLabel" runat="server" Text="Please enter your details below:" align="center" Width="300px" Font-Bold="True" Font-Size="Large"></asp:Label><br /><br />

        <asp:Label ID="nameLabel" runat="server" Text="first name:" align="center" Width="75px"></asp:Label>
        <asp:TextBox ID="nameInput" runat="server" placeholder="John" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_firstName" runat="server" ControlToValidate="nameInput"
		    ErrorMessage="Required First Name" Width="1px" Font-Size="Small">Required!</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID ="nameRegEx" runat="server" ErrorMessage="Invalid characters" ValidationExpression="^[a-zA-Z]+$" 
            ControlToValidate="nameInput"/> <br /><br />

        <asp:Label ID="surnameLabel" runat="server" Text="surname:" align="center" Width="75px"></asp:Label>
        <asp:TextBox ID="surnameInput" runat="server" placeholder="Doe" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_surname" runat="server" ControlToValidate="surnameInput"
		    ErrorMessage="Required Surname" Width="1px" Font-Size="Small">Required!</asp:RequiredFieldValidator> 
        <asp:RegularExpressionValidator ID ="surnameRegEx" runat="server" ErrorMessage="Invalid characters" ValidationExpression="^[a-zA-Z]+$" 
            ControlToValidate="surnameInput"/>
        <br /><br />

        <asp:Label ID="passLabel" runat="server" Text="password:" align="center" Width="75px"></asp:Label>
        <asp:TextBox ID="passRegInput" runat="server" placeholder="4-15 Characters (Aa-Zz,0-9,_)" TextMode="Password" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_password" runat="server" ControlToValidate="passRegInput"
		    ErrorMessage="Required Password" Width="1px" Font-Size="Small">Required!</asp:RequiredFieldValidator> 
        <asp:RegularExpressionValidator ID ="passRegEx" runat="server" ErrorMessage="Invalid Password" 
            ValidationExpression="^[a-zA-Z]\w{3,14}$" 
            ControlToValidate="passRegInput"/><br /><br />
        <ajaxToolkit:PasswordStrength ID="PasswordStrength1" runat="server" TargetControlID="passRegInput"/>

        <asp:Label ID="emailLabel" runat="server" Text="email:" align="center" Width="75px"></asp:Label>
        <asp:TextBox ID="emailInput" runat="server" placeholder="someone@example.com" TextMode="Email" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_email" runat="server" ControlToValidate="emailInput"
		    ErrorMessage="Required Email" Width="1px" Font-Size="Small">Required!</asp:RequiredFieldValidator> <br /><br />

        <asp:Label ID="phoneLabel" runat="server" Text="phone:" align="center" Width="75px"></asp:Label>
        <asp:TextBox ID="phoneInput" runat="server" placeholder="phone number" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_phone" runat="server" ControlToValidate="phoneInput"
		    ErrorMessage="Required Phone" Width="1px" Font-Size="Small">Required!</asp:RequiredFieldValidator> 
        <asp:RegularExpressionValidator ID ="phoneRegEx" runat="server" ErrorMessage="Invalid phone number" 
            ValidationExpression="^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$" 
            ControlToValidate="phoneInput"/><br /><br />

        <asp:Label ID="addressLabel" runat="server" Text="address:" align="center" Width="75px"></asp:Label>
        <asp:TextBox ID="addressInput" runat="server" placeholder="house address" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_address" runat="server" ControlToValidate="addressInput"
		    ErrorMessage="Required Address" Width="1px" Font-Size="Small">Required!</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID ="addressRegEx" runat="server" ErrorMessage="Invalid address" ValidationExpression="^[a-zA-Z 0-9]*$" 
            ControlToValidate="addressInput"/> <br /><br />

        <asp:Label ID="captchaLabel" runat="server" Text="captcha:" Width="75px" CssClass="text-center"></asp:Label>
        <asp:TextBox ID="captchaInput" runat="server" placeholder="are you a robot?" Width="200px"></asp:TextBox>
        <asp:Label ID="captchaTextLabel" runat="server" Text="CAPTCHA TEXT HERE"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_captcha" runat="server" ControlToValidate="captchaInput"
		    ErrorMessage="Required Captcha" Width="1px" Font-Size="Small">Required!</asp:RequiredFieldValidator> <br /><br />

        <asp:ValidationSummary runat="server" ShowMessageBox="false" DisplayMode="BulletList" /> <br /><br />

            <asp:Button ID="registerBTN" runat="server" BackColor="#009933" Font-Bold="True" ForeColor="White" Text="register"
         OnClick="RegisterUser" Font-Size="Small" Height="30px" Width="275px" /> <br /> 
    </div>
</asp:Content>