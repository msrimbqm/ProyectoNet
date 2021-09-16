using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UNK
{
    public partial class AltaProveedor : System.Web.UI.Page
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

                string orden1 = "insert into TProveedor (CIF,Nombre,Direccion,Provincia,CP,Mail,Telefono,Contacto,Observaciones,Ciudad) values ";

                string orden2 = " ('" + txtCIF.Text + "','" + txtNombre.Text + "','" + TxtDireccion.Text + "','" + txtProvincia.Text + "','" + txtCP.Text + "','" + txtMail.Text + "','" + txtTelefono.Text + "','" + txtContacto.Text + "','" + txtObservaciones.Text + "','" + txtCiudad.Text + "')";

                string orden = orden1 + orden2;

                if ((txtCIF.Text != "") && (txtNombre.Text != "") && (noexistecif(txtCIF.Text)))
                {

                    conexion.Open();
                    SqlCommand comando = new SqlCommand(orden, conexion);
                    comando.ExecuteNonQuery();
                    conexion.Close();
                    LabelResultado.Text = "DATO AGREGADO CORRECTAMENTE A LA BASE DE DATOS";
                    btnGuardar.Visible = false;
                }
                else
                { LabelResultado.Text = "NOMBRES Y CIF  NO EXISTENTE OBLIGATORIO ,NO SE AGREGARON DATOS"; }
            }

            catch
            {

                LabelResultado.Text = "ERROR ACCCESO BASE DE DATOS ,NO SE AGREGARON DATOS";

            }

        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Proveedores.aspx");
        }

        public bool  noexistecif(string p)
        {
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("select * from TProveedor where CIF ='" + txtCIF.Text + "'", conexion);
            SqlDataReader registro = comando.ExecuteReader();

            if (!registro.Read())
            {
                conexion.Close();
                return true;
                
            }

            else
            {
                conexion.Close();
                return false;
            }
        }



    







    }
}