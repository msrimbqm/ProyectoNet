<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equipos.aspx.cs" Inherits="UNK.Equipos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <link href="css/Styles.css" rel="stylesheet" />

    <div class="text-center mt-5" id="cabecera0b">
                 <h1> UnKeeper <img src="img/gear.png" width="100" height="100"> &nbsp;  &nbsp; &nbsp;     EQUIPOS REGISTRADOS </h1>
     </div> 

    <div class="jumbotron" id="cabecera0a">
        
        <asp:Button ID="btnAltaE" class="botonin" runat="server" Text="Alta Equipo" OnClick="btnAlta_Click" Width="144px" />

        <asp:Button ID="btnModificarE" class="botonin" runat="server" Text="Editar Equipo" OnClick="btnModificar_Click" Width="144px" />

        <asp:Button ID="btnBorrarE" class="botonin" runat="server" OnClick="btnBorrar_Click" Text="Borrar" Width="144px" OnClientClick="return confirm('Confirme Borrado');"  />

        <asp:TextBox ID="txtIdE"  runat="server" Visible="False" Width="28px"></asp:TextBox>

        <asp:Label ID="Label1" runat="server" Text="Filtrar Descripción::   "></asp:Label>

        <asp:TextBox ID="txtFiltrarNombre" class="cuadrobuscar" runat="server" Width="259px" OnTextChanged="txtFiltrarTrabajo_TextChanged1"></asp:TextBox>

        <asp:Button ID="btnFiltrar" class="botonin" runat="server" Text="Filtrar" Width="144px" OnClick="btnFiltrar_Click" />

        <asp:Label ID="LabelResultado" runat="server" Text=" " ForeColor="Red"></asp:Label>

    </div>
   
    <div>
   
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IdEquipo" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="1006px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField SelectText="■■" ShowSelectButton="True" />
                <asp:BoundField DataField="IdEquipo" HeaderText="IdEquipo" InsertVisible="False" ReadOnly="True" SortExpression="IdEquipo" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="Ubicacion" HeaderText="Ubicacion" SortExpression="Ubicacion" />
                <asp:BoundField DataField="Fabricante" HeaderText="Fabricante" SortExpression="Fabricante" />
                <asp:BoundField DataField="FechaInstalacion" HeaderText="FechaInstalacion" SortExpression="FechaInstalacion" />
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


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" SelectCommand="SELECT IdEquipo, Descripcion, Ubicacion, Fabricante, FechaInstalacion FROM TEquipo ORDER BY IdEquipo"></asp:SqlDataSource>


    </div>

    


    



</asp:Content>
