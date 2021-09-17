using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UNK
{
    public partial class ModiProveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {// intento controlar sea primera vez carga, no por la accion de evento de los controles de la pagina 

                string llegada = Request.QueryString["id"].ToString();

                txtIdProveedor.Text = llegada;
                // deber cargar los datos en los textbox del id seleccionado

                string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();
                SqlConnection conexion = new SqlConnection(s);
                conexion.Open();
                SqlCommand comando = new SqlCommand("select * from TProveedor where IdProveedor='" + llegada + "'", conexion);
                SqlDataReader registro = comando.ExecuteReader();



                if (registro.Read())
                {
                    // encontro el registro lo cargo en los textbox
                    txtIdProveedor.Text = registro["IdProveedor"].ToString();
                    txtCIF.Text= registro["CIF"].ToString();
                    txtNombre.Text= registro["Nombre"].ToString();
                    TxtDireccion.Text= registro["Direccion"].ToString();
                    txtProvincia.Text= registro["Provincia"].ToString();
                    txtCP.Text= registro["CP"].ToString();
                    txtMail.Text= registro["Mail"].ToString();
                    txtTelefono.Text= registro["Telefono"].ToString();
                    txtContacto.Text= registro["Contacto"].ToString();
                    txtObservaciones.Text= registro["Observaciones"].ToString();
                    txtCiudad.Text= registro["Ciudad"].ToString();

                } // de lectura  registro

                conexion.Close();

            } // del control de carga solo una vez
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {


            // guarda los datos que esten los cuadro en la base de datos puede ser añadir o modificar segun el parametro de entrada

            try
            {

                string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();

                SqlConnection conexion = new SqlConnection(s);

                string orden = "update TProveedor set  CIF='" + txtCIF.Text + "', Nombre='" + txtNombre.Text + "',Direccion='" + TxtDireccion.Text + "',Provincia='" + txtProvincia.Text + "',CP='" + txtCP.Text + "',Mail='" + txtMail.Text + "',Telefono='" + txtTelefono.Text + "', Contacto='" + txtContacto.Text + "',Observaciones='" + txtObservaciones.Text + "',Ciudad='" + txtCiudad.Text + "' where IdProveedor='"+txtIdProveedor.Text+"'";

                //LabelResultado.Text = orden;

                if ((txtCIF.Text != "") && (txtNombre.Text != ""))
                {

                    conexion.Open();
                    SqlCommand comando = new SqlCommand(orden, conexion);
                    comando.ExecuteNonQuery();
                    conexion.Close();
                    LabelResultado.Text = "DATO MODIFICADO CORRECTAMENTE EN LA BASE DE DATOS";
                    btnGuardar.Visible = false;
                }
                else
                {
                    // LabelResultado.Text = "NOMBRES Y CIF  NO EXISTENTE OBLIGATORIO ,NO SE AGREGARON DATOS"; }
                }
            }

            catch
            {

                // LabelResultado.Text = "ERROR ACCCESO BASE DE DATOS ,NO SE AGREGARON DATOS";

            }








        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Proveedores.aspx");
        }





    }
}