<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UNK._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="css/styles.css" rel="Styles.css" />
    <div class="jumbotron">
        
        <asp:Button ID="btnAlta" runat="server" Text="Alta Servicio" OnClick="btnAlta_Click" Width="144px" />

        <asp:Button ID="btnModificar" runat="server" Text="Modificar Servicio" OnClick="btnModificar_Click" Width="128px" />

        <asp:Button ID="btnBorrar" runat="server" OnClick="btnBorrar_Click" Text="Borrar" Width="114px" />

        <asp:TextBox ID="txtId" runat="server" Visible="False" Width="28px"></asp:TextBox>

        <asp:Label ID="Label1" runat="server" Text="Filtrar Trabajo:   "></asp:Label>

        <asp:TextBox ID="txtFiltrarTrabajo" runat="server" Width="150px" OnTextChanged="txtFiltrarTrabajo_TextChanged1"></asp:TextBox>

        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" Width="113px" OnClick="btnFiltrar_Click" />

        <asp:Label ID="LabelResultado" runat="server" Text=" " ForeColor="Red"></asp:Label>

    </div>
   
    <div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IdServicio" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="982px" Height="343px" PageSize="20" style="margin-top: 20px" Font-Overline="False">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField SelectText="■■" ShowSelectButton="True" />
            <asp:BoundField DataField="IdServicio" HeaderText="IdServicio" InsertVisible="False" ReadOnly="True" SortExpression="IdServicio" />
            <asp:BoundField DataField="Trabajo" HeaderText="Trabajo" SortExpression="Trabajo" />
            <asp:BoundField DataField="Intervencion" HeaderText="Intervencion" SortExpression="Intervencion" />
            <asp:BoundField DataField="Vencimiento" HeaderText="Vencimiento" SortExpression="Vencimiento" />
            <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" SortExpression="Proveedor" />
            <asp:BoundField DataField="Equipo" HeaderText="Equipo" SortExpression="Equipo" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:unkeeperConnectionString %>" SelectCommand="select S.IdServicio, S.Descripcion as Trabajo, S.Fecha as Intervencion, S.Vencimiento as Vencimiento, P.Nombre as Proveedor,E.Descripcion as Equipo 
                   from TProveedor as P inner join TServicio as S on P.IdProveedor = S.IdProveedor
                  inner join TEquipo as E on S.IdEquipo=E.IdEquipo"></asp:SqlDataSource>
        </div>

    

</asp:Content>
