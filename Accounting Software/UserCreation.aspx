<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserCreation.aspx.cs" Inherits="Accounting_Software.UserCreation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            text-align: center;
            margin-left: 400px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
            text-align: right;
            width: 395px;
        }
        .auto-style7 {
            height: 26px;
            text-align: center;
            width: 186px;
        }
        .auto-style8 {
            width: 186px;
        }
        .auto-style9 {
            text-align: center;
            width: 186px;
        }
        .auto-style10 {
            width: 395px;
        }
        .auto-style11 {
            text-align: right;
            width: 395px;
        }
        .auto-style12 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
    </p>
    <p class="auto-style3">
        Create a New User Below</p>
    <p class="auto-style4">
        <asp:Button ID="button_ReturnFromCreate" runat="server" OnClick="button_ReturnFromCreate_Click" Text="Return" />
    </p>
    <p class="auto-style3">
        &nbsp;</p>
    <p class="auto-style3">
        <table style="width:100%;">
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">
    <asp:Label ID="label_FirstName" runat="server" Text="First Name:"></asp:Label>
                </td>
                <td class="auto-style9">
    <asp:TextBox ID="input_FirstName" ToolTip="Input First Name" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">
    <asp:Label ID="label_LastName" runat="server" Text="Last Name:"></asp:Label>
                </td>
                <td class="auto-style9">
    <asp:TextBox ID="input_LastName" ToolTip="Input Last Name" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">
                <asp:Label ID="label_SpecifyRole" runat="server" Text="Specify Role:"></asp:Label>
                </td>
                <td class="auto-style9">
    <asp:DropDownList runat="server" AutoPostBack="true" ID="dropdown_Role">
        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
        <asp:ListItem Text="Manager" Value="Manager"></asp:ListItem>
        <asp:ListItem Text="Accountant" Value="Accountant"></asp:ListItem>
    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">
                <asp:Label ID="label_Active" runat="server" Text="Active:"></asp:Label>
                </td>
                <td class="auto-style9">
                <asp:CheckBox ID="Checkbox_Active" runat="server" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
    <asp:Label ID="label_UserName" runat="server" Text="Username:"></asp:Label>
                </td>
                <td class="auto-style7">
    <asp:TextBox ID="input_UserName" ToolTip="Input UserName" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style11">
    <asp:Label ID="label_Password" runat="server" Text="Password:"></asp:Label>
                </td>
                <td class="auto-style9">
    <asp:TextBox ID="input_Password" ToolTip="Input Password" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style12">
                <asp:Label ID="label_FormatPassword" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                <asp:Label ID="label_Email" runat="server" Text="Email:"></asp:Label>
                </td>
                <td class="auto-style9">
                <asp:TextBox ID="input_Email" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style12">
                <asp:Label ID="label_FormatEmail" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style8">
                <asp:Button ID="button_ClearNewUser" runat="server" OnClick="button_ClearNewUser_Click" Text="Clear" Width="61px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style8">
    <asp:Button ID="button_Submit" Text="Submit" runat="server" OnClick="submit_Button_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style8">
                <asp:Label ID="label_UserAdded" runat="server" Text="User Added Successfully."></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </p>
    <p>
    </p>
</asp:Content>
