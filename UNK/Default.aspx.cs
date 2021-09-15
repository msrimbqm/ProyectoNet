using System;
using System.Collections.Generic;
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
                // COMPRUEBA LO MANDA A ABRI PAGINA CON UNO SELECCCIONADO
                string cadena = "ModiServicio.aspx?id=" + txtId.Text;
                Response.Redirect(cadena);
            }
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

                


                //try
               // {

                    string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();

                    SqlConnection conexion = new SqlConnection(s);
                    conexion.Open();
                    string cadena = "delete from TServicio where IdServicio='" + txtId.Text + "'";
                   // LabelResultado.Text = cadena;
                    SqlCommand comando = new SqlCommand(cadena, conexion);
                    int cantidad = comando.ExecuteNonQuery();

                    GridView1.DataBind();


                    if (cantidad == 1) LabelResultado.Text = "REGISTRO BORRADO";
                    else
                      //  LabelResultado.Text = "No existe un usuario con ese Id";

                    conexion.Close();
               // }
              //  catch
               // {
                   //LabelResultado.Text = "ERROR DE BORRADO EN BASE DE DATOS";

               // }






            }




        }
    }
}