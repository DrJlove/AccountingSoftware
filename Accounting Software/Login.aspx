<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Accounting_Software.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .content-centered {
            margin: 0 auto;
            width: 100px;
        }
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            text-align: center;
            margin-left: 160px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
    </p>
    <p>
        &nbsp;</p>
    <p class="auto-style1">
        Log In</p>
    <p class="auto-style1">
        <asp:Label ID="Label1" runat="server" BackColor="White" BorderColor="White" BorderWidth="5px" Text="Username:"></asp:Label>
&nbsp;
        <asp:TextBox ID="UsernameTxt" runat="server"></asp:TextBox>
    </p>
    <p class="auto-style1">
        &nbsp;<asp:Label ID="Label2" runat="server" BackColor="White" BorderColor="White" BorderWidth="5px" Text="Password:"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="PasswordTxt" runat="server" TextMode="Password"></asp:TextBox>
    </p>
    <p class="auto-style2">
        <asp:Button ID="LoginButton" runat="server" OnClick="LoginButton_Click" Text="Log In" />
    </p>
    <p class="auto-style1">
        <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" Text="Error Text"></asp:Label>
    </p>
    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style1">
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

