<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModiEquipos.aspx.cs" Inherits="UNK.ModiEquipos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <link href="css/Styles.css" rel="stylesheet" />

     <div class="text-center mt-5 cabeceralogo">
                 <h1>  UnKeeper <img src="img/gear.png" width="100" height="100"> &nbsp;  &nbsp; &nbsp; MODIFICACION DE EQUIPO </h1>
     </div> 

    <div class="jumbotron cabecerabotones">
        <div>
        
                 <asp:Button Class="botonin" ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" Width="144px" /> &nbsp;

                 <asp:Button ID="btnHome" runat="server" Text="Volver" class="botonin" OnClick="btnHome_Click" Width="144px" />
        </div>
        <div class="divaviso">

                 <asp:Label ID="LabelResultado" runat="server" Text="" ForeColor="Black" BackColor="Red"></asp:Label>
        </div>

    </div>


     <div class="container cabeceracampos">

            

            <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label1" runat="server" Text="Id Equipo:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtIdEquipo"  runat="server" Enabled="False" ForeColor="#CCCCCC" ></asp:TextBox>
                </div>
            </div>

             <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label2" runat="server" Text="Descripción::"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtDescripcion" placeholder="Descripcion del Equipo" runat="server" Enabled="True"></asp:TextBox>
                </div>
               </div>

               <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label3" runat="server" Text="Ubicación:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtUbicacion" placeholder="Situación del equipo" runat="server" Enabled="True" Width="465px"></asp:TextBox>

                </div>
                            
                     
                </div>
            

            <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label4" runat="server" Text="Direccion:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox CssClass="input" ID="TxtDireccion" placeholder="Reseñas de Direccion" runat="server" Enabled="True" Width="469px" ></asp:TextBox>
                </div>
            
            </div>

         <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label5" runat="server" Text="Fabricante:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtFabricante" placeholder="nombre de fabricante" runat="server" Enabled="True" Width="469px" ></asp:TextBox>
                </div>
            
            </div>

         <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label6" runat="server" Text="Modelo:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtModelo" placeholder="Modelo o Versión" runat="server" Enabled="True" Width="469px" ></asp:TextBox>
                </div>
            
            </div>

         <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label11" runat="server" Text="Fecha Instalacion:"></asp:Label>
                </div>
                 <!--<div class="controles">-->

                      <asp:Calendar ID="calFecha" runat="server"  Width="349px"   >
                      </asp:Calendar>
                    
               <!-- </div>-->
            
            </div>

        <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label7" runat="server" Text="Numero Serie:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtNumeroSerie" placeholder="Serie o referencia" runat="server" Enabled="True"   Width="477px"></asp:TextBox>
                </div>
            
            </div>

        <div class="filas">
                <div class="titulos">
                     <asp:Label ID="Label8" runat="server" Text="Observaciones:"></asp:Label>
                </div>
                 <div class="controles">
                     <asp:TextBox ID="txtObservaciones" placeholder="Otros Contenidos" runat="server" Enabled="True" Height="81px" TextMode="MultiLine" Width="469px" ></asp:TextBox>
                </div>
            
            </div>
       

        <h1> </h1>                                      


                
        

        </div> <!-- de container-->


</asp:Content>
