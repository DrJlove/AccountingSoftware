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
           
        <asp:Button ID="button_Login" runat="server" Text="Login" OnClick="button_Login_Click" />

        </br>
        </br>
        </br>



        <asp:Button ID="button_CreateUser" runat="server" Enabled="False" EnableTheming="False" Text="Create User" OnClick="button_CreateUser_Click" />
        <asp:Button ID="button_EditUser" runat="server" Enabled="False" EnableTheming="False" Text="Edit User" />
    </div>
</asp:Content>

