<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMain.aspx.cs" Inherits="frmMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p class="auto-style1">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/frmMain.aspx"><strong style="color: rgb(0, 0, 0); font-family: 'Comic Sans MS'; font-size: 18.18181800842285px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 20px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="color: rgb(23, 47, 255);">Cool</span><span style="color: rgb(255, 102, 0);">Biz</span><span class="Apple-converted-space">&nbsp;</span><span style="color: rgb(153, 51, 102);">Productions</span>, Inc.</strong></asp:HyperLink>
        </p>
        <p class="auto-style1">
            <asp:LinkButton ID="lnkSalaryCalculator" runat="server" PostBackUrl="~/frmSalaryCalculator.aspx" OnClick="lnkSalaryCalculator_Click">Salary Calculator</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="imbtnCalculator" runat="server" Height="54px" ImageUrl="~/Images/calculator.jpg" PostBackUrl="~/frmSalaryCalculator.aspx" Width="57px" />
        </p>
        <p class="auto-style1">
            <asp:LinkButton ID="lnkbtnAddEmployee" runat="server" PostBackUrl="~/frmPersonnel.aspx" OnClick="lnkAddEmployee_Click">Add New Employee</asp:LinkButton>
&nbsp;&nbsp;
            <asp:ImageButton ID="imgbtnNewEmployee" runat="server" Height="47px" ImageUrl="~/Images/addEmployee.jpg" PostBackUrl="~/frmPersonnel.aspx" Width="67px" OnClick="ImageButton2_Click" />
        </p>
        <p class="auto-style1">
        <asp:LinkButton ID="lnkbtnUserActivity" runat="server" OnClick="LinkButton1_Click" PostBackUrl="~/frmUserActivity.aspx" style="text-align: center">View User Activity</asp:LinkButton>
        &nbsp;
        &nbsp;<asp:ImageButton ID="imgbtnViewUserActivity" runat="server" Height="43px" ImageUrl="~/Images/userActivity.jpg" PostBackUrl="~/frmUserActivity.aspx" Width="59px" />
        </p>
        <p class="auto-style1">
            <asp:LinkButton ID="lnkbtnViewPersonnel" runat="server" PostBackUrl="~/frmViewPersonnel.aspx">View Personnel</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="imgbtnViewPersonnel" runat="server" Height="38px" ImageUrl="~/Images/viewpersonnel.jpg" PostBackUrl="~/frmViewPersonnel.aspx" Width="60px" />
        </p>
        <p class="auto-style1">
            <asp:LinkButton ID="lnkbtnSearch" runat="server" PostBackUrl="~/frmSearchPersonnel.aspx">Search Personnel</asp:LinkButton>
            <asp:ImageButton ID="imgbtnSearch" runat="server" Height="40px" ImageUrl="~/Images/searchpersonnel.jpg" PostBackUrl="~/frmSearchPersonnel.aspx" Width="60px" />
        </p>
        <p class="auto-style1">
            <asp:HyperLink ID="lnkbtnEditEmployees" runat="server" NavigateUrl="~/frmEditPersonnel.aspx">Edit Employees</asp:HyperLink>
&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="imgbtnEditEmployees" runat="server" Height="42px" ImageUrl="~/Images/editEmp.jpg" PostBackUrl="~/frmEditPersonnel.aspx" Width="44px" />
        </p>
        <p class="auto-style1">
            <asp:HyperLink ID="lnkbtnManageUsers" runat="server" NavigateUrl="~/frmManageUsers.aspx">Manage Users</asp:HyperLink>
&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="imgbtnManageUsers" runat="server" Height="46px" ImageUrl="~/Images/ManageUsers.png" PostBackUrl="~/frmManageUsers.aspx" Width="62px" />
        </p>
    </form>
</body>
</html>
