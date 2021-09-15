<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaServicio.aspx.cs" Inherits="UNK.AltaServicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="css/Styles.css" rel="stylesheet" />

     <div class="text-center mt-5" id="cabecera1b">
                 <h1>  UnKeeper <img src="img/gear.png" width="100" height="100"> &nbsp;  &nbsp; &nbsp; ALTA DE SERVICIO </h1>
     </div> 
    <div class="jumbotron" id="cabecera1a">
        
                 <asp:Button Class="botonin" ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" Width="144px" /> &nbsp;

                 <asp:Button ID="btnHome" runat="server" Text="Volver" class="botonin" OnClick="btnHome_Click" Width="144px" />

                 <asp:Label ID="LabelResultado" runat="server" Text="" ForeColor="#FF3300" ></asp:Label>

    </div>

    <div class="container" id="cabecera1c">

             

             <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label1" runat="server" Text="Id Servicio:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtIdServicio" runat="server" Enabled="False" ForeColor="#CCCCCC" Width="35px"></asp:TextBox>
                </div>
             </div>

             <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label2" runat="server" Text="Id Proveedor:"></asp:Label>
                </div>
                 
                 <div class="controles">
                     <asp:DropDownList ID="dropIdProveedor"  runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="IdProveedor"></asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:unkeeperConnectionString %>" SelectCommand="SELECT [IdProveedor], [Nombre] FROM [TProveedor]"></asp:SqlDataSource>
                </div>
             </div>

              <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label3" runat="server" Text="Id Equipo:"></asp:Label>
                </div>
                 
                 <div class="controles">
                     <asp:DropDownList ID="dropIdEquipo" runat="server" DataSourceID="SqlDataSource2" DataTextField="Descripcion" DataValueField="IdEquipo"></asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:unkeeperConnectionString %>" SelectCommand="SELECT [IdEquipo], [Descripcion], [Ubicacion] FROM [TEquipo]"></asp:SqlDataSource>
                </div>
             </div>

                <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label4" runat="server" Text="Fecha:"></asp:Label>
                </div>
                   
                 <div class="controles">
                      <asp:Calendar ID="calFecha" runat="server"  Width="349px"  OnSelectionChanged="calFecha_SelectionChanged" >
                      </asp:Calendar>
                     
                </div>
             </div>

                <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label5" runat="server" Text="Descripción:"></asp:Label>
                </div>
                   
                 <div class="controles">
                      
                     <asp:TextBox ID="txtDescripcion" runat="server" Height="121px" Width="560px" TextMode="MultiLine"></asp:TextBox>
                </div>
              </div>

                  <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label7" runat="server" Text="Vencimiento:"></asp:Label>
                </div>
                   
                 <div class="controles">
                      <asp:Calendar ID="calVencimiento" runat="server" Width="347px" OnSelectionChanged="calVencimiento_SelectionChanged">
                      </asp:Calendar>
                     
                </div>


                <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label6" runat="server" Text="Documentos:"></asp:Label>
                 </div>
                      
                 <div class="controles">
                     <asp:FileUpload ID="fileup" runat="server" />
                </div>
              </div>
        

        </div> <!-- de container-->











</div>
</asp:Content>
