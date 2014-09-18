<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmSearchPersonnel.aspx.cs" Inherits="frmSearchPersonnel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
    
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/frmMain.aspx"><strong style="color: rgb(0, 0, 0); font-family: 'Comic Sans MS'; font-size: 18.18181800842285px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 20px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="color: rgb(23, 47, 255);">Cool</span><span style="color: rgb(255, 102, 0);">Biz</span><span class="Apple-converted-space">&nbsp;</span><span style="color: rgb(153, 51, 102);">Productions</span>, Inc.</strong></asp:HyperLink>
    
    </div>
        <p>
            Search for employee by last name:
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="btnSearch" runat="server" PostBackUrl="~/frmViewPersonnel.aspx" Text="Search" OnClick="btnSearch_Click" />
        </p>
    </form>
</body>
</html>
