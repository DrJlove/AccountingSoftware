<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminControlPage.aspx.cs" Inherits="Accounting_Software.AdminControlPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .auto-style12 {
            text-align: center;
        }
        .auto-style5 {
            height: 23px;
            width: 212px;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style7 {
            width: 565px;
            text-align: right;
        }
        .auto-style13 {
            width: 212px;
            text-align: center;
        }
        .auto-style11 {
            text-align: left;
        }
        .auto-style8 {
            width: 565px;
            text-align: right;
            height: 26px;
        }
        .auto-style9 {
            width: 212px;
            height: 26px;
            text-align: center;
        }
        .auto-style10 {
            height: 26px;
        }
        .auto-style18 {
            width: 565px;
            text-align: center;
            height: 23px;
        }
        .auto-style17 {
            width: 212px;
            text-align: right;
        }
        .auto-style14 {
            width: 565px;
            text-align: center;
            height: 30px;
        }
        .auto-style15 {
            width: 212px;
            height: 30px;
            text-align: right;
        }
        .auto-style16 {
            height: 30px;
        }
        .auto-style19 {
            width: 565px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
    </p>
    <p class="auto-style12">
        Modify a User Below</p>
    <p>
        <asp:Button ID="button_ReturnFromModify" runat="server" OnClick="button_ReturnFromModify_Click" Text="Return" />
    </p>
    <table style="width: 100%;">
        <tr>
            <td class="auto-style18"></td>
            <td class="auto-style5"></td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style7">Select User:</td>
            <td class="auto-style13">
                <asp:DropDownList ID="UserDropDownList" runat="server">
                </asp:DropDownList>
            </td>
            <td class="auto-style11">
                <asp:Button ID="LoadUserButton" runat="server" OnClick="LoadUserButton_Click" Text="Load User" />
            </td>
        </tr>
        <tr>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style13">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style13">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">User ID:</td>
            <td class="auto-style13">
                <asp:TextBox ID="UserIDTextbox" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">First name:</td>
            <td class="auto-style13">
                <asp:TextBox ID="FirstnameTextbox" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">Last name:</td>
            <td class="auto-style13">
                <asp:TextBox ID="LastnameTextbox" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">Username:</td>
            <td class="auto-style13">
                <asp:TextBox ID="UsernameTextbox" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">Password:</td>
            <td class="auto-style9">
                <asp:TextBox ID="PasswordTextbox" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:Label ID="label_FormatPassword" runat="server" ForeColor="Red"></asp:Label>
                </td>
        </tr>
        <tr>
            <td class="auto-style8">Email:</td>
            <td class="auto-style9">
                <asp:TextBox ID="EmailTextbox" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">Role:</td>
            <td class="auto-style9">
                <asp:DropDownList ID="RoleDropDown" runat="server">
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>Manager</asp:ListItem>
                    <asp:ListItem>Accountant</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style10"></td>
        </tr>
        <tr>
            <td class="auto-style7">Active:</td>
            <td class="auto-style13">
                <asp:CheckBox ID="ActiveCheckBox" runat="server" />
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style18"></td>
            <td class="auto-style5"></td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style17">
                <asp:Button ID="ClearFieldsButton" runat="server" OnClick="ClearFieldsButton_Click" Text="Clear Fields" Width="108px" />
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style14"></td>
            <td class="auto-style15">
                <asp:Button ID="AddUserButton" runat="server" OnClick="AddUserButton_Click" Text="Add User" Width="108px" />
            </td>
            <td class="auto-style16"></td>
        </tr>
        <tr>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style17">
                <asp:Button ID="UpdateUserButton" runat="server" OnClick="UpdateUserButton_Click" Text="Update User" Width="108px" />
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style13">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style13">
                <asp:Label ID="ChangesLabel" runat="server" Text="Changes Saved Successfully"></asp:Label>
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style13">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
    </table>
    <p>
        &nbsp;</p>
    <p>
    </p>
</asp:Content>
