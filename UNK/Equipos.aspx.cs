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
    public partial class Equipos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAlta_Click(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            // borra el seleccionado del grid si lo hay
            if (txtIdE.Text != "")
            {
                // borrar ese id

                try
                {

                    string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();

                    SqlConnection conexion = new SqlConnection(s);
                    conexion.Open();
                    string cadena = "delete from TEquipo where IdEquipo='" + txtIdE.Text + "'";
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

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            // deber cargar los datos en los textbox del id seleccionado


            string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();

            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            
            string cadena = "SELECT IdEquipo, Descripcion, Ubicacion, Fabricante, FechaInstalacion FROM TEquipo WHERE Descripcion like '%" + txtFiltrarNombre.Text + "%'";


            SqlCommand comando = new SqlCommand(cadena, conexion);

            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSourceID = "";
            GridView1.DataSource = dt;
            GridView1.DataBind();

            conexion.Close();
        }

        protected void txtFiltrarTrabajo_TextChanged1(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtIdE.Text = GridView1.SelectedRow.Cells[1].Text;
        }
    }
}