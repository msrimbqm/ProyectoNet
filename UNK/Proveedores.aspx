<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="UNK.Proveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <link href="css/Styles.css" rel="stylesheet" />

    <div class="text-center mt-5" id="cabecera0b">
                 <h1> UnKeeper <img src="img/gear.png" width="100" height="100"> &nbsp;  &nbsp; &nbsp;     PROVEEDORES REGISTRADOS </h1>
     </div> 

    <div class="jumbotron" id="cabecera0a">
        
        <asp:Button ID="btnAltaP" class="botonin" runat="server" Text="Alta Proveedor" OnClick="btnAlta_Click" Width="144px" />

        <asp:Button ID="btnModificarP" class="botonin" runat="server" Text="Editar Proveedor" OnClick="btnModificar_Click" Width="144px" />

        <asp:Button ID="btnBorrarP" class="botonin" runat="server" OnClick="btnBorrar_Click" Text="Borrar" Width="144px" OnClientClick="return confirm('Confirme Borrado');"  />

        <asp:TextBox ID="txtIdP"  runat="server" Visible="False" Width="28px"></asp:TextBox>

        <asp:Label ID="Label1" runat="server" Text="Filtrar Nombre:   "></asp:Label>

        <asp:TextBox ID="txtFiltrarNombre" class="cuadrobuscar" runat="server" Width="259px" OnTextChanged="txtFiltrarTrabajo_TextChanged1"></asp:TextBox>

        <asp:Button ID="btnFiltrar" class="botonin" runat="server" Text="Filtrar" Width="144px" OnClick="btnFiltrar_Click" />

        <asp:Label ID="LabelResultado" runat="server" Text=" " ForeColor="Red"></asp:Label>

    </div>
   
    <div>
   




    </div>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="380px" Width="1124px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField SelectText="■■" ShowSelectButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="CIF" HeaderText="CIF" SortExpression="CIF" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Contacto" HeaderText="Contacto" SortExpression="Contacto" />
            <asp:BoundField DataField="Mail" HeaderText="Mail" SortExpression="Mail" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
            <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" SortExpression="Ciudad" />
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



<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:unkeeperConnectionString %>" SelectCommand="select IdProveedor as ID, CIF,Nombre,Contacto, Mail,Telefono, Ciudad from TProveedor order by IdProveedor;"></asp:SqlDataSource>



</asp:Content>
