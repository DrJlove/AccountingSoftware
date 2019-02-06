<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="UserCreationPortal.aspx.cs" Inherits="Accounting_Software.UserCreationPortal" %>

<asp:Content ID="topbit" ContentPlaceHolderID="head" runat="server">
    <style>
        .content-centered {
            margin: 0 auto;
            width: 100px;
        }
        .auto-style1 {
        text-align: right;
        width: 309px;
    }
    .auto-style2 {
        text-align: right;
        height: 26px;
        width: 309px;
    }
    .auto-style3 {
        height: 26px;
            width: 762px;
        }
    .auto-style4 {
        width: 159px;
    }
    .auto-style5 {
        height: 26px;
        width: 159px;
    }
    .auto-style6 {
        width: 309px;
    }
    .auto-style7 {
        width: 159px;
        text-align: right;
    }
        .auto-style8 {
            width: 345%;
        }
        .auto-style9 {
            text-align: right;
            width: 309px;
            height: 85px;
            padding: 2em;
        }
        .auto-style10 {
            width: 159px;
            height: 85px;
        }
        .auto-style11 {
            height: 85px;
            width: 762px;
        }
        .auto-style12 {
            width: 762px;
        }
    </style>
</asp:Content>
<asp:Content ID="bodybit" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [UserTable]"></asp:SqlDataSource>--%>
    <br />
    <br />
    Create a New User Below&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="button_Return" runat="server" OnClick="button_Return_Click" Text="Return" />
    <br />
    <br />
    <br />
    <br />
    <table class="auto-style8">
        <tr>
            <td class="auto-style1">
    <asp:Label ID="label_FirstName" runat="server" Text="First Name:"></asp:Label>
            </td>
            <td class="auto-style4">
    <asp:TextBox ID="input_FirstName" ToolTip="Input First Name" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
    <asp:Label ID="label_LastName" runat="server" Text="Last Name:"></asp:Label>
            </td>
            <td class="auto-style4">
    <asp:TextBox ID="input_LastName" ToolTip="Input Last Name" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="label_SpecifyRole" runat="server" Text="Specify Role:"></asp:Label>
            </td>
            <td class="auto-style4">
    <asp:DropDownList runat="server" AutoPostBack="true" ID="dropdown_Role">
        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
        <asp:ListItem Text="Manager" Value="Manager"></asp:ListItem>
        <asp:ListItem Text="Accountant" Value="Accountant"></asp:ListItem>
    </asp:DropDownList>
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:Label ID="label_Active" runat="server" Text="Active:"></asp:Label>
            </td>
            <td class="auto-style10">
                <asp:CheckBox ID="Checkbox_Active" runat="server" />
            </td>
            <td class="auto-style11"></td>
        </tr>
        <tr>
            <td class="auto-style1">
    <asp:Label ID="label_UserName" runat="server" Text="Username:"></asp:Label>
            </td>
            <td class="auto-style4">
    <asp:TextBox ID="input_UserName" ToolTip="Input UserName" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
    <asp:Label ID="label_Password" runat="server" Text="Password:"></asp:Label>
            </td>
            <td class="auto-style4">
    <asp:TextBox ID="input_Password" ToolTip="Input Password" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style12">
                <asp:Label ID="label_FormatPassword" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="label_Email" runat="server" Text="Email:"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="input_Email" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style3">
                <asp:Label ID="label_FormatEmail" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style7">
                <asp:Button ID="button_ClearNewUser" runat="server" OnClick="button_ClearNewUser_Click" Text="Clear" Width="61px" />
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style7">
    <asp:Button ID="button_Submit" Text="Submit" runat="server" OnClick="submit_Button_Click" />
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="label_UserAdded" runat="server" Text="User Added Successfully."></asp:Label>
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <br />
</asp:Content>
