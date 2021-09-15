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

                     DateTime f1 = Convert.ToDateTime(registro["Fecha"]);
                     calFecha.VisibleDate = f1;
                     DateTime f2 = Convert.ToDateTime(registro["Vencimiento"]);
                     calVencimiento.VisibleDate = f2;


                // pendiente cargar archivo 


            }

            conexion.Close();



          


        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // guarda los datos que esten los cuadro en la base de datos puede ser añadir o modificar segun el parametro de entrada

                try
                {
                    // es modificar el registro cargado


                    string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();

                    System.Data.SqlClient.SqlConnection conexion = new SqlConnection(s);

                    string orden = "update TServicio set IdProveedor='" + dropIdProveedor.Text + "',IdEquipo='" + dropIdEquipo.Text + "',Descripcion='" + txtDescripcion.Text + "',Fecha='" + calFecha.SelectedDate.ToString() + "',Vencimiento='" + calVencimiento.SelectedDate.ToString() + "' where IdServicio='" + txtIdServicio.Text + "'";

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
    }
}


