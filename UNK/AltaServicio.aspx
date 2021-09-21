<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaServicio.aspx.cs" Inherits="UNK.AltaServicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="css/Styles.css" rel="stylesheet" />

     <div class="text-center mt-5 cabeceralogo">
                 <h1> UnKeeper <img src="img/gear.png" width="100" height="100"> &nbsp;  &nbsp; &nbsp; ALTA SERVICIOS </h1>
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
                     <asp:DropDownList ID="dropIdProveedor"  runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="IdProveedor" Height="22px" Width="400px"></asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:unkeeperConnectionString %>" SelectCommand="SELECT [IdProveedor], [Nombre] FROM [TProveedor]"></asp:SqlDataSource>
                </div>
             </div>

              <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label3" runat="server" Text="Id Equipo:"></asp:Label>
                </div>
                 
                 <div class="controles">
                     <asp:DropDownList ID="dropIdEquipo" runat="server" DataSourceID="SqlDataSource2" DataTextField="Descripcion" DataValueField="IdEquipo" Height="21px" Width="400px"></asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:unkeeperConnectionString %>" SelectCommand="SELECT [IdEquipo], [Descripcion], [Ubicacion] FROM [TEquipo]"></asp:SqlDataSource>
                </div>
             </div>

                <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label4" runat="server" Text="Fecha:"></asp:Label>
                </div>
                   
                 <!--<div class="controles">-->
                      <asp:Calendar ID="calFecha" runat="server"  Width="349px"  OnSelectionChanged="calFecha_SelectionChanged">
                      </asp:Calendar>
                     
                <!--</div>-->
             </div>

                <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label5" runat="server" Text="Descripción:"></asp:Label>
                </div>
                   
                 <div class="controles">
                      
                     <asp:TextBox ID="txtDescripcion" runat="server" placeholder="Describa el servicio" Height="126px"  TextMode="MultiLine" Width="391px"></asp:TextBox>
                </div>
              </div>

                  <div class="filas">

                    <div class="titulos">
                     <asp:Label ID="Label7" runat="server" Text="Vencimiento:"></asp:Label>
                    </div>
                   
                     <!--<div class="controles">-->
                      <asp:Calendar ID="calVencimiento" runat="server" Width="347px" OnSelectionChanged="calVencimiento_SelectionChanged">
                      </asp:Calendar>
                     <!--</div>-->
                     
                </div>


                <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label6" runat="server" Text="Documentos:"></asp:Label>
                 </div>
                      
                 <div class="controles">
                
                     <asp:Button class="botonin" ID="btnUpload" runat="server" Text="Subir Archivo" Width="100px" OnClick="btnUpload_Click" />
             
                     <asp:FileUpload ID="FileUpload1" runat="server" />
                     &nbsp;
                     &nbsp;
                     <asp:TextBox ID="txtidgrid" runat="server"></asp:TextBox>
                
                                 
        
        
               <div>
                        <asp:GridView ID="GridView1" runat="server"   
              
                         AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSource4" Width="524px" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">  
                            <AlternatingRowStyle BackColor="White" />
                         <Columns>  

                          

                            <asp:BoundField DataField="Name" HeaderText="" SortExpression="Name" />  
                             <asp:TemplateField ItemStyle-HorizontalAlign="Center">  
                            <ItemTemplate>  
                            <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile" CommandArgument='<%# Eval("id") %>'></asp:LinkButton>  
                            </ItemTemplate>  
                            </asp:TemplateField>

                         </Columns>  
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="BurlyWood" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView> 
                       

                     <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:unkeeperConnectionString %>" SelectCommand="SELECT [id,Name] FROM [TFiles]" 
                        >
                         
                     </asp:SqlDataSource>

            </div>


        </div> <!-- de container-->


                   
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />


                   
</div>
</div>
</asp:Content>
