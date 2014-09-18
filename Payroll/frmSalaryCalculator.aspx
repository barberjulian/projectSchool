<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmSalaryCalculator.aspx.cs" Inherits="frmSalaryCalculator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="auto-style1">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/frmMain.aspx" style="text-align: center"><strong style="color: rgb(0, 0, 0); font-family: 'Comic Sans MS'; font-size: 18.18181800842285px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 20px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="color: rgb(23, 47, 255);">Cool</span><span style="color: rgb(255, 102, 0);">Biz</span><span class="Apple-converted-space">&nbsp;</span><span style="color: rgb(153, 51, 102);">Productions</span>, Inc.</strong></asp:HyperLink>
            <br />
        </div>

        <asp:Label ID="Label1" runat="server" Text="Annual Hours: "></asp:Label>
        &nbsp; &nbsp;
        <asp:TextBox ID="txtAnnualHours" runat="server" CausesValidation="True"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Rate: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtRate" runat="server"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Calculate Salary" Width="128px" />
        <br />
        <asp:Label ID="lblSalary" runat="server" Text="$"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
    </form>
</body>
</html>
