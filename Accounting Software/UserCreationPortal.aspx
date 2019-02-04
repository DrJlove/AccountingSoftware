<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="UserCreationPortal.aspx.cs" Inherits="Accounting_Software.UserCreationPortal" %>

<asp:Content ID="topbit" ContentPlaceHolderID="head" runat="server">
    <style>
        .content-centered {
            margin: 0 auto;
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="bodybit" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [UserTable]"></asp:SqlDataSource>--%>
    <asp:Label ID="label_FirstName" runat="server" Text="First Name:"></asp:Label>
    <asp:TextBox ID="input_FirstName" ToolTip="Input First Name" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="label_LastName" runat="server" Text="Last Name:"></asp:Label>
    <asp:TextBox ID="input_LastName" ToolTip="Input Last Name" runat="server"></asp:TextBox>
    <br />
    <asp:DropDownList runat="server" AutoPostBack="true" ID="dropdown_Role">
        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
        <asp:ListItem Text="Manager" Value="Manager"></asp:ListItem>
        <asp:ListItem Text="Accountant" Value="Accountant"></asp:ListItem>
    </asp:DropDownList>
    <asp:DropDownList runat="server" AutoPostBack="true" ID="dropdown_Active">
        <asp:ListItem Text="Active" Value="Yes"></asp:ListItem>
        <asp:ListItem Text="Inactive" Value="No"></asp:ListItem>
    </asp:DropDownList>
    <br />
    <asp:Label ID="label_UserName" runat="server" Text="User Name:"></asp:Label>
    <asp:TextBox ID="input_UserName" ToolTip="Input UserName" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="label_Password" runat="server" Text="Password:"></asp:Label>
    <asp:TextBox ID="input_Password" ToolTip="Input Password" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="button_Submit" Text="hi" runat="server" OnClick="submit_Button_Click" />
</asp:Content>
