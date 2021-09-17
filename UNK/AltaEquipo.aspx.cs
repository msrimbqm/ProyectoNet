using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UNK
{
    public partial class AltaEquipo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
           try
            {

                string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();

                SqlConnection conexion = new SqlConnection(s);

                // calendario pongo el formato fecha comforme base de datos SQL


                string dia = calFecha.SelectedDate.Day.ToString();
                string mes = calFecha.SelectedDate.Month.ToString();
                string ano = calFecha.SelectedDate.Year.ToString();
                string f1 = ano + "/" + mes + "/" + dia;

                string orden = "insert into TEquipo(Descripcion,Ubicacion,Fabricante,Modelo,FechaInstalacion,NumeroSerie,Observaciones) values " +
                    "('" + txtDescripcion.Text + "','" + txtUbicacion.Text + "','" + txtFabricante.Text + "','" + txtModelo.Text + "','" + f1 + "','" + txtNumeroSerie.Text + "','" + txtObservaciones.Text + "')";


                if (txtDescripcion.Text != "")
                {

                    conexion.Open();
                    SqlCommand comando = new SqlCommand(orden, conexion);
                    comando.ExecuteNonQuery();
                    conexion.Close();
                    LabelResultado.Text = "DATO AGREGADO CORRECTAMENTE A LA BASE DE DATOS";
                    btnGuardar.Visible = false;
                }
                else LabelResultado.Text = "DESCRIPCION CAMBO OBLIGATORIO ,NO SE AGREGARON DATOS";

           }
            catch
            {
               LabelResultado.Text = "ERROR ACCCESO BASE DE DATOS ,NO SE AGREGARON DATOS";

            }

        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Equipos.aspx");
        }
    }
}