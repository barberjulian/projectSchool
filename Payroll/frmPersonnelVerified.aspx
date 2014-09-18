<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmPersonnelVerified.aspx.cs" Inherits="frmPersonnelVerified" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            text-align: center;
        }
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
       <div class="auto-style1">
    
        
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/frmMain.aspx"><strong style="color: rgb(0, 0, 0); font-family: 'Comic Sans MS'; font-size: 18.18181800842285px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 20px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="color: rgb(23, 47, 255);">Cool</span><span style="color: rgb(255, 102, 0);">Biz</span><span class="Apple-converted-space">&nbsp;</span><span style="color: rgb(153, 51, 102);">Productions</span>, Inc.</strong></asp:HyperLink>
        
    
    </div>
       <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Information to submit" style="text-align: left"></asp:Label>
        <asp:TextBox ID="txtVerifiedInfo" runat="server" Height="80px" TextMode="MultiLine" Width="400px"></asp:TextBox>
           <br />
           <asp:Button ID="btnViewPersonnel" runat="server" Text="View Personnel" PostBackUrl="~/frmViewPersonnel.aspx" />
    </form>
</body>
</html>
