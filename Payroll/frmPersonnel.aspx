<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmPersonnel.aspx.cs" Inherits="frmPersonnel" %>

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
    <div class="auto-style1">
    
        
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/frmMain.aspx"><strong style="color: rgb(0, 0, 0); font-family: 'Comic Sans MS'; font-size: 18.18181800842285px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 20px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="color: rgb(23, 47, 255);">Cool</span><span style="color: rgb(255, 102, 0);">Biz</span><span class="Apple-converted-space">&nbsp;</span><span style="color: rgb(153, 51, 102);">Productions</span>, Inc.</strong></asp:HyperLink>
         <br />
    
        <asp:Panel ID="rfv3" runat="server" Height="250px" HorizontalAlign="Left" Width="500px">
            <asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label>
            &nbsp;<asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name required"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Last Name:" width="71px"></asp:Label>
            &nbsp;<asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name required"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Pay Rate:" width="71px"></asp:Label>
            &nbsp;<asp:TextBox ID="txtPayRate" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Start Date: " width="71px"></asp:Label>
            &nbsp;<asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtStartDate" ErrorMessage="Enter date in mm/dd/yyyy format"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label5" runat="server" Text="End Date: " width="71px"></asp:Label>
            &nbsp;<asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEndDate" ErrorMessage="Enter date in mm/dd/yyyy format"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="btnSubmit" runat="server" OnClick="Button2_Click" Text="Submit" />
            <br />
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </asp:Panel>
         </div>
    </form>
</body>
</html>
