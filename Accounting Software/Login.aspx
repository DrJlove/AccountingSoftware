<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Accounting_Software.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .content-centered {
            margin: 0 auto;
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-centered">
           
        <asp:Label ID="label_Username" runat="server" Text="Username:"></asp:Label>
        <asp:TextBox ID="textbox_Username" runat="server"></asp:TextBox>
        <asp:Label ID="label_Password" runat="server" Text="Password:"></asp:Label>
        <asp:TextBox ID="textbox_Password" TextMode="Password" runat="server"></asp:TextBox>
           
    <!--    <asp:Button ID="button_ResetPassword" runat="server" Text="Reset Password" OnClick="button_ResetPassword_Click" />
           
        <asp:TextBox ID="textbox_PasswordReset" TextMode="Password" runat="server"></asp:TextBox> -->
           
        <asp:Button ID="button_Login" runat="server" Text="Login" OnClick="button_Login_Click" />

        <br />
        <br />
        <br />
        <asp:Label ID="labelLoginError" runat="server" ForeColor="Red"></asp:Label>

    </div>
</asp:Content>

