<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="Accounting_Software.Welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1> Welcome to Objective Accounting</h1>

    <asp:Button ID="button_CreateUser" runat="server" Enabled="True" Visible="True" EnableTheming="False" Text="Create User" OnClick="button_CreateUser_Click" />
    <asp:Button ID="button_EditUser" runat="server" Enabled="True" Visible="True" EnableTheming="False" Text="Edit User" OnClick="button_EditUser_Click" />
</asp:Content>
