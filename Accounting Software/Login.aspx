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
        <input id="Text1" type="text" placeholder="Username" />
        <input id="Text2" type="password" placeholder="Password" />
        <asp:Button ID="button_Login" runat="server" Text="Login" OnClick="button_Login_Click" />
&nbsp;</div>
</asp:Content>

