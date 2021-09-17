<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaProveedor.aspx.cs" Inherits="UNK.AltaProveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="css/Styles.css" rel="stylesheet" />

     <div class="text-center mt-5" id="cabecera1b">
                 <h1>  UnKeeper <img src="img/gear.png" width="100" height="100"> &nbsp;  &nbsp; &nbsp; ALTA DE PROVEEDOR </h1>
     </div> 
    <div class="jumbotron" id="cabecera1a">
        
                 <asp:Button Class="botonin" ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" Width="144px" /> &nbsp;

                 <asp:Button ID="btnHome" runat="server" Text="Volver" class="botonin" OnClick="btnHome_Click" Width="144px" />

                 <asp:Label ID="LabelResultado" runat="server" Text="" ForeColor="#FF3300" ></asp:Label>

    </div>

    <div class="container" id="cabecera1c">

            

            <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label1" runat="server" Text="Id Proveedor:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtIdProveedor"  runat="server" Enabled="False" ForeColor="#CCCCCC" ></asp:TextBox>
                </div>
            </div>

             <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label2" runat="server" Text="CIF:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtCIF" placeholder="Identficador Fiscal" runat="server" Enabled="True"></asp:TextBox>
                </div>
            
                <div class="titulos">
                     <asp:Label ID="Label3" runat="server" Text="Nombre:"></asp:Label>
                </div>
                 <div class="controles">
            </div>

          <div class="filas">
                     <asp:TextBox ID="txtNombre" placeholder="Denominacion" runat="server" Enabled="True" Width="465px"></asp:TextBox>
                </div>
            
           </div>

            <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label4" runat="server" Text="Direccion:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox CssClass="input" ID="TxtDireccion" placeholder="Reseñas de Direccion" runat="server" Enabled="True" ></asp:TextBox>
                </div>
            
            </div>

         <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label5" runat="server" Text="Provincia:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtProvincia" placeholder="nombre de provincia" runat="server" Enabled="True" Width="469px" ></asp:TextBox>
                </div>
            
            </div>

         <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label6" runat="server" Text="Ciudad:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtCiudad" placeholder="Poblacion" runat="server" Enabled="True" Width="469px" ></asp:TextBox>
                </div>
            
            </div>

         <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label11" runat="server" Text="Codigo Postal:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtCP" placeholder="codigo postal" runat="server" Enabled="True" TextMode="Number" ></asp:TextBox>
                </div>
            
            </div>

        <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label7" runat="server" Text="Mail"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtMail" placeholder="correo electronico" runat="server" Enabled="True"  TextMode="Email" Width="477px"></asp:TextBox>
                </div>
            
            </div>

        <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label8" runat="server" Text="Telefonos:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtTelefono" placeholder="Numeros de contacto" runat="server" Enabled="True" ></asp:TextBox>
                </div>
            
            </div>
        <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label9" runat="server" Text="Contacto:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtContacto" placeholder="Personas de contacto" runat="server" Enabled="True" ></asp:TextBox>
                </div>
            
            </div>
        <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label10" runat="server" Text="Observaciones:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtObservaciones" placeholder="otros datos aqui" runat="server" Enabled="True"  Height="100px" TextMode="MultiLine" Width="477px"></asp:TextBox>
                </div>
            
            </div>

        <h1> </h1>


            

             

                
            


                
        

        </div> <!-- de container-->







    
</asp:Content>
