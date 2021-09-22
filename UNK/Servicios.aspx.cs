using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UNK
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtId.Text = GridView1.SelectedRow.Cells[1].Text;
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (txtId.Text != "")
            {
                // COMPRUEBA LO MANDA A ABRIR PAGINA CON UNO SELECCCIONADO
                string cadena = "ModiServicio.aspx?id=" + txtId.Text;
                Response.Redirect(cadena);
            }
            else
                LabelResultado.Text="SELECCIONE UN REGISTRO";
        }

        protected void btnAlta_Click(object sender, EventArgs e)
        {
            string cadena = "AltaServicio.aspx";
            Response.Redirect(cadena);
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            // borra el seleccionado del grid si lo hay
            if (txtId.Text!="")
            {
                // borrar ese id

               try
                {

                    string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();

                    SqlConnection conexion = new SqlConnection(s);
                    conexion.Open();
                    string cadena = "delete from TServicio where IdServicio='" + txtId.Text + "'";
                   // LabelResultado.Text = cadena;
                    SqlCommand comando = new SqlCommand(cadena, conexion);
                    int cantidad = comando.ExecuteNonQuery();
                   
                    


                    if (cantidad == 1) LabelResultado.Text = "";
                    else
                        LabelResultado.Text = "DEBE SELECCIONAR UN REGISTRO";
                    conexion.Close();
                    GridView1.DataBind();
                }

                catch
                {
                   LabelResultado.Text = "ERROR DE BORRADO EN BASE DE DATOS";

                 }
            }

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtFiltrarTrabajo_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void txtFiltrarTrabajo_TextChanged1(object sender, EventArgs e)
        {
            
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            // deber cargar los datos en los textbox del id seleccionado
            

            string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();

            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            string cadena = "select S.IdServicio, S.Descripcion as Trabajo, S.Fecha as Intervencion, S.Vencimiento as Vencimiento, P.Nombre as Proveedor,E.Descripcion as Equipo from TProveedor as P inner join TServicio as S on P.IdProveedor = S.IdProveedor inner join TEquipo as E on S.IdEquipo = E.IdEquipo where S.Descripcion like '%" + txtFiltrarTrabajo.Text + "%'";


            SqlCommand comando = new SqlCommand(cadena, conexion);

            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSourceID = "";
            GridView1.DataSource = dt;
            GridView1.DataBind();

            conexion.Close();
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            txtId.Text = GridView1.SelectedRow.Cells[1].Text;
        }
    }
    
}