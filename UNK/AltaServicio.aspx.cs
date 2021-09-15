using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UNK
{
    public partial class AltaServicio : System.Web.UI.Page
    {
        

      
        
        protected void Page_Load(object sender, EventArgs e)
        {
           // calFecha.VisibleDate = DateTime.Today;
            //calFecha.SelectedDate = Convert.ToDateTime("12/08/2021");

        }

       

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // guarda los datos que esten los cuadro en la base de datos puede ser añadir o modificar segun el parametro de entrada

            
            
              try
               {

                    string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();

                    SqlConnection conexion = new SqlConnection(s);
                    string f1 = calFecha.SelectedDate.ToString();
                    f1 = f1.Substring(0, 10);
                    string f2 = calVencimiento.SelectedDate.ToString();
                    f2 = f2.Substring(0, 10);

                     
          


                    string orden = "insert into TServicio (IdProveedor,IdEquipo,Descripcion,Fecha,Vencimiento) values ('" + dropIdProveedor.Text + "','" + dropIdEquipo.Text + "','" + txtDescripcion.Text + "','" + f1 + "','" + f2 + "')";
                   LabelResultado.Text = orden;

                    conexion.Open();

                    
            
            SqlCommand comando = new SqlCommand(orden, conexion);

                   comando.ExecuteNonQuery();
                    conexion.Close();
                    btnGuardar.Enabled = false;
                   LabelResultado.Text = "DATO AGREGADO CORRECTAMENTE LA BASE DE DATOS";
                    btnGuardar.Visible = false;
                    }
              catch
                  {
                  LabelResultado.Text = "ERROR ACCCESO BASE DE DATOS ,NO SE AGREGARON DATOS";

                   }


            
          



        }
    }
}