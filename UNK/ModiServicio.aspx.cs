using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UNK
{
    public partial class ModiServicio : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if  (!IsPostBack)
                {// intento controlar sea primera vez carga, no por la accion de evento de los controles de la pagina 

                string llegada = Request.QueryString["id"].ToString();

                txtIdServicio.Text = llegada;
                // deber cargar los datos en los textbox del id seleccionado

                string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();
                SqlConnection conexion = new SqlConnection(s);
                conexion.Open();
                SqlCommand comando = new SqlCommand("select * from TServicio where IdServicio ='" + llegada + "'", conexion);
                SqlDataReader registro = comando.ExecuteReader();



                if (registro.Read())
                {
                    // encontro el registro
                    dropIdProveedor.Text = registro["IdProveedor"].ToString();
                    dropIdEquipo.Text = registro["IdEquipo"].ToString();
                    txtDescripcion.Text = registro["Descripcion"].ToString();

                    // cargar fechas desde la base de datos
                    DateTime f1 = Convert.ToDateTime(registro["Fecha"]);
                    DateTime f2 = Convert.ToDateTime(registro["Vencimiento"]);

                    // cargar fechas en los calendar formato español en la presentacion de web calendar

                    string cadena = f1.Day.ToString() + "/" + f1.Month.ToString() + "/" + f1.Year.ToString();
                    
                    //LabelResultado.Text = cadena-------------------------------------------------------------;
                    calFecha.SelectedDate = Convert.ToDateTime(cadena);
                    calFecha.VisibleDate = Convert.ToDateTime(cadena);
                 
                   
                   // LabelResultado.Text = calFecha.SelectedDate.ToString();
                    

                    cadena = f2.Day.ToString() + "/" + f2.Month.ToString() + "/" + f2.Year.ToString();
                    calVencimiento.SelectedDate = Convert.ToDateTime(cadena);
                    calVencimiento.VisibleDate = Convert.ToDateTime(cadena);

                } // de lectura  registro

                conexion.Close();

            } // del control de carga solo una vez
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // guarda los datos que esten los cuadro en la base de datos puede ser añadir o modificar segun el parametro de entrada

                try
                {
                // es modificar el registro cargado


                // calendario pongo el formato fecha comforme base de datos SQL


                string dia = calFecha.SelectedDate.Day.ToString();
                string mes = calFecha.SelectedDate.Month.ToString();
                string ano = calFecha.SelectedDate.Year.ToString();
                string f1 = ano + "/" + mes + "/" + dia;

                dia = calVencimiento.SelectedDate.Day.ToString();
                mes = calVencimiento.SelectedDate.Month.ToString();
                ano = calVencimiento.SelectedDate.Year.ToString();
                string f2 = ano + "/" + mes + "/" + dia;


                string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();

                    System.Data.SqlClient.SqlConnection conexion = new SqlConnection(s);

                    string orden = "update TServicio set IdProveedor='" + dropIdProveedor.Text + "',IdEquipo='" + dropIdEquipo.Text + "',Descripcion='" + txtDescripcion.Text + "',Fecha='" + f1 + "',Vencimiento='" + f2 + "' where IdServicio='" + txtIdServicio.Text + "'";

                    //LabelResultado.Text = orden;

                    conexion.Open();


                    SqlCommand comando = new SqlCommand(orden, conexion);

                    comando.ExecuteNonQuery();
                    conexion.Close();
                   LabelResultado.Text = "DATO MODIFICADO CORRECTAMENTE LA BASE DE DATOS";
                }
                catch
                {
                    LabelResultado.Text = "ERROR ACCCESO BASE DE DATOS ,NO SE MODIFICARON DATOS";

                }

        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}


