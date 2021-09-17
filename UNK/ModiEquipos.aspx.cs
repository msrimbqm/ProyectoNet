using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UNK
{
    public partial class ModiEquipos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {// intento controlar sea primera vez carga, no por la accion de evento de los controles de la pagina 

                string llegada = Request.QueryString["id"].ToString();

                txtIdEquipo.Text = llegada;
                // deber cargar los datos en los textbox del id seleccionado

                string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();
                SqlConnection conexion = new SqlConnection(s);
                conexion.Open();
                SqlCommand comando = new SqlCommand("select * from TEquipo where IdEquipo='" + llegada + "'", conexion);
                SqlDataReader registro = comando.ExecuteReader();



                if (registro.Read())
                {
                    // encontro el registro lo cargo en los textbox
                    txtIdEquipo.Text = registro["IdEquipo"].ToString();
                    txtDescripcion.Text = registro["Descripcion"].ToString();
                    txtUbicacion.Text = registro["Ubicacion"].ToString();
                    txtFabricante.Text = registro["Fabricante"].ToString();
                    txtModelo.Text = registro["Modelo"].ToString();
                    txtNumeroSerie.Text = registro["NumeroSerie"].ToString();
                    txtObservaciones.Text = registro["Observaciones"].ToString();
                    DateTime f1 = Convert.ToDateTime(registro["FechaInstalacion"]);

                    // invertir fechas al recuperar y cargarlas en calendar

                    string cadena = f1.Day.ToString() + "/" + f1.Month.ToString() + "/" + f1.Year.ToString();

                    //LabelResultado.Text = cadena-------------------------------------------------------------;
                    calFecha.SelectedDate = Convert.ToDateTime(cadena);
                    calFecha.VisibleDate = Convert.ToDateTime(cadena);

                } // de lectura  registro

                conexion.Close();

            } // del control de carga solo una vez
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

                string orden = "update TEquipo set Descripcion='" + txtDescripcion.Text + "',Ubicacion='" + txtUbicacion.Text + "',Fabricante='" + txtFabricante.Text + "',Modelo='" + txtModelo.Text + "',FechaInstalacion='" + f1 + "',NumeroSerie='" + txtNumeroSerie.Text + "',Observaciones='" + txtObservaciones.Text + "' where IdEquipo='" + txtIdEquipo.Text + "'";


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