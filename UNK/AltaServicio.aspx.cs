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
            
            
        }

       

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // guarda los datos que esten los cuadro en la base de datos puede ser añadir o modificar segun el parametro de entrada

              try
               {

                    string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();

                    SqlConnection conexion = new SqlConnection(s);
                  
                   // calendario pongo el formato fecha comforme base de datos SQL
                    

                string dia = calFecha.SelectedDate.Day.ToString();
                string mes = calFecha.SelectedDate.Month.ToString();
                string ano = calFecha.SelectedDate.Year.ToString();
                string f1 = ano + "/" + mes + "/" + dia;
               

                 dia = calVencimiento.SelectedDate.Day.ToString();
                 mes = calVencimiento.SelectedDate.Month.ToString();
                 ano = calVencimiento.SelectedDate.Year.ToString();
                string f2 = ano + "/" + mes + "/" + dia;

                string orden = "insert into TServicio (IdProveedor,IdEquipo,Descripcion,Fecha,Vencimiento) values ('" + dropIdProveedor.Text + "','" + dropIdEquipo.Text + "','" + txtDescripcion.Text + "','" + f1 + "','" + f2 + "')";
                 

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

        protected void calFecha_SelectionChanged(object sender, EventArgs e)
        {
            
        }

        protected void calVencimiento_SelectionChanged(object sender, EventArgs e)
        {
            
        }
    }
}