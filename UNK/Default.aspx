<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UNK._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="css/Styles.css" rel="stylesheet" />

    <div class="text-center mt-5" id="cabecera0b">
                 <h1> UnKeeper <img src="img/gear.png" width="100" height="100"> &nbsp;  &nbsp; &nbsp;      SERVICIOS REGISTRADOS </h1>
     </div> 

    <div class="jumbotron" id="cabecera0a">
        
        <asp:Button ID="btnAlta" class="botonin" runat="server" Text="Alta Servicio" OnClick="btnAlta_Click" Width="144px" />

        <asp:Button ID="btnModificar" class="botonin" runat="server" Text="Editar Servicio" OnClick="btnModificar_Click" Width="144px" />

        <asp:Button ID="btnBorrar" class="botonin" runat="server" OnClick="btnBorrar_Click" Text="Borrar" Width="144px" OnClientClick="return confirm('Confirme Borrado');"  />

        <asp:TextBox ID="txtId"  runat="server" Visible="False" Width="28px"></asp:TextBox>

        <asp:Label ID="Label1" runat="server" Text="Filtrar Trabajo:   "></asp:Label>

        <asp:TextBox ID="txtFiltrarTrabajo" class="cuadrobuscar" runat="server" Width="259px" OnTextChanged="txtFiltrarTrabajo_TextChanged1"></asp:TextBox>

        <asp:Button ID="btnFiltrar" class="botonin" runat="server" Text="Filtrar" Width="144px" OnClick="btnFiltrar_Click" />

        <asp:Label ID="LabelResultado" runat="server" Text=" " ForeColor="Red"></asp:Label>

    </div>
   
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IdServicio" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="1033px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField SelectText="■■" ShowSelectButton="True" />
                <asp:BoundField DataField="IdServicio" HeaderText="IdServicio" InsertVisible="False" ReadOnly="True" SortExpression="IdServicio" />
                <asp:BoundField DataField="Trabajo" HeaderText="Trabajo" SortExpression="Trabajo" />
                <asp:BoundField DataField="Intervencion" HeaderText="Intervencion" SortExpression="Intervencion" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Vencimiento" HeaderText="Vencimiento" SortExpression="Vencimiento" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" SortExpression="Proveedor" />
                <asp:BoundField DataField="Equipo" HeaderText="Equipo" SortExpression="Equipo" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Crimson" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" SelectCommand="select S.IdServicio, S.Descripcion as Trabajo, S.Fecha as Intervencion, S.Vencimiento as Vencimiento, P.Nombre as Proveedor,E.Descripcion as Equipo 
                   from TProveedor as P inner join TServicio as S on P.IdProveedor = S.IdProveedor
                  inner join TEquipo as E on S.IdEquipo=E.IdEquipo"></asp:SqlDataSource>
        </div>

    

</asp:Content>
