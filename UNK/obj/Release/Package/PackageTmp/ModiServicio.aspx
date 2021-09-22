<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModiServicio.aspx.cs" Inherits="UNK.ModiServicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="css/Styles.css" rel="stylesheet" />
     <div class="text-center mt-5 cabeceralogo">
                 <h1>  UnKeeper <img src="img/gear.png" width="100" height="100"> &nbsp;  &nbsp; &nbsp; MODIFICACION DE SERVICIO </h1>
     </div>

    <div class="jumbotron cabecerabotones">
        
            <div>   
                <asp:Button class="botonin" ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" Width="144px" />
                  &nbsp;

                 <asp:Button ID="btnHome" runat="server" Text="Volver" class="botonin"  Width="144px" OnClick="btnHome_Click" />

                 <asp:Label ID="LabelResultado" runat="server" Text="" ForeColor="Red" BackColor="black" ></asp:Label>
              
            </div>

          <div class="divaviso">
             
            <asp:Label ID="Label8" runat="server" Text="" ForeColor="Black" BackColor="Red" Font-Bold="True"></asp:Label>

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
                     <asp:DropDownList ID="dropIdProveedor" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="IdProveedor" Width="399px"></asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:unkeeperConnectionString %>" SelectCommand="SELECT [IdProveedor], [Nombre] FROM [TProveedor]"></asp:SqlDataSource>
                </div>
             </div>

              <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label3" runat="server" Text="Id Equipo:"></asp:Label>
                </div>
                 
                 <div class="controles">
                     <asp:DropDownList ID="dropIdEquipo" runat="server" DataSourceID="SqlDataSource2" DataTextField="Descripcion" DataValueField="IdEquipo" Width="400px"></asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:unkeeperConnectionString %>" SelectCommand="SELECT [IdEquipo], [Descripcion], [Ubicacion] FROM [TEquipo]"></asp:SqlDataSource>
                </div>
             </div>

                <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label4" runat="server" Text="Fecha:"></asp:Label>
                </div>
                   
                <div class="cal">
                      <asp:Calendar ID="calFecha" runat="server"  Width="350px">
                      </asp:Calendar>
                     
                </div>
             </div>

                <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label5" runat="server" Text="Descripción:"></asp:Label>
                </div>
                   
                 <div class="controles">
                      
                     <asp:TextBox ID="txtDescripcion" runat="server" placeholder="Describa el servicio" Height="121px" Width="453px" TextMode="MultiLine"></asp:TextBox>
                </div>
              </div>

                  <div class="filas">

                 <div class="titulos">
                     <asp:Label ID="Label7" runat="server" Text="Vencimiento:"></asp:Label>
                </div>
                   
                 <div class="cal">
                      <asp:Calendar ID="calVencimiento" runat="server" Width="350px">
                      </asp:Calendar>
                     
                </div>
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
                    
                </div>
              </div>
              

        <asp:GridView ID="GridView1" runat="server"   
              
                         AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSource4" Width="336px" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting">  
                            <AlternatingRowStyle BackColor="White" />
                         <Columns>  

                          

                            <asp:BoundField DataField="Name" HeaderText="" SortExpression="Name" />  
                              <asp:BoundField DataField="id" HeaderText="" SortExpression="Name" visible="false" />  
                             <asp:TemplateField ItemStyle-HorizontalAlign="Center">  
                            <ItemTemplate>  
                            <asp:LinkButton ID="lnkDownload" runat="server" Text="Descargar" OnClick="DownloadFile" CommandArgument='<%# Eval("id") %>'></asp:LinkButton>  
                            </ItemTemplate>  
                           


<ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>

                             <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Borrar"/>

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

                      

        

                    

                      

        

        </div> <!-- de container-->











</div>
</asp:Content>
