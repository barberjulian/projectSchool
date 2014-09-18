<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmEditPersonnel.aspx.cs" Inherits="frmEditPersonnel" %>

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
            <asp:Label ID="Label1" runat="server" Text="Edit Employees"></asp:Label>
        </p>
        <p style="text-align: left">
            <asp:GridView ID="grdEditPersonnel" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="grdEditPersonnel_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="PayRate" HeaderText="PayRate" SortExpression="PayRate" />
                    <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
                    <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PayrollSystem_DBConnectionString2 %>" DeleteCommand="DELETE FROM [tblPersonnel] WHERE [ID] = ?" InsertCommand="INSERT INTO [tblPersonnel] ([ID], [FirstName], [LastName], [PayRate], [StartDate], [EndDate]) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:PayrollSystem_DBConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [tblPersonnel]" UpdateCommand="UPDATE [tblPersonnel] SET [FirstName] = ?, [LastName] = ?, [PayRate] = ?, [StartDate] = ?, [EndDate] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="PayRate" Type="Int32" />
                    <asp:Parameter Name="StartDate" Type="DateTime" />
                    <asp:Parameter Name="EndDate" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="PayRate" Type="Int32" />
                    <asp:Parameter Name="StartDate" Type="DateTime" />
                    <asp:Parameter Name="EndDate" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
    </form>
</body>
</html>
