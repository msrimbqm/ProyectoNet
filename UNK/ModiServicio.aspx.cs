using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
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

                   string cadena = f1.Day.ToString() + f1.Month.ToString() + f1.Year.ToString();
                    

                    //LabelResultado.Text = cadena-------------------------------------------------------------;
                    //calFecha.SelectedDate = Convert.ToDateTime(cadena);
                    calFecha.SelectedDate = f1;
                    calFecha.VisibleDate = f1;
                   
                    //calFecha.VisibleDate = Convert.ToDateTime(cadena);
               
                   
                   // LabelResultado.Text = calFecha.SelectedDate.ToString();
                    

                    cadena = f2.Day.ToString() + "/" + f2.Month.ToString() + "/" + f2.Year.ToString();

                    //calVencimiento.SelectedDate = Convert.ToDateTime(cadena);
                    //calVencimiento.VisibleDate = Convert.ToDateTime(cadena);
                    calVencimiento.SelectedDate = f2;
                    calVencimiento.VisibleDate = f2;




                } // de lectura  registro

                conexion.Close();
                cargargrid(txtIdServicio.Text);

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
            Response.Redirect("Servicios.aspx");
        }


        protected void cargargrid(string p)

        {

            // cargar grid archivos con ese servicio

            string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();

            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            string cadena = "select id,Name from TFiles where idServicio='" + p + "'";
            SqlCommand comando = new SqlCommand(cadena, conexion);
            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSourceID = "";
            GridView1.DataSource = dt;
            GridView1.DataBind();
            conexion.Close();



        }

        protected void DownloadFile(object sender, EventArgs e)
        {


            // obtener id del que quiero descargar
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;
            string constr = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select id, Name, Data, ContentType from TFiles where id=@Id";
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["Data"];
                        contentType = sdr["ContentType"].ToString();
                        fileName = sdr["Name"].ToString();
                    }
                    con.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();

        }

      

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            // cargar un archivo vinculado a la tabla por el Id del Servicio
            string idfile = "";
            if (txtIdServicio.Text != "")
            {
                // caso de estar modificando
                idfile = txtIdServicio.Text;
            }
            else
            { // averiguar que usara como int siguiente el identity}

                idfile = (ultimovalor() + 1).ToString();
            }


            using (Stream fs = FileUpload1.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    //This line of code is reading the bytes .    
                    string constr = ConfigurationManager.ConnectionStrings["unkeeperConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {

                        string query = "insert into TFiles values (@Name, @ContentType, @Data,@idServicio)";
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@Name", FileUpload1.PostedFile.FileName);
                            cmd.Parameters.AddWithValue("@ContentType", FileUpload1.PostedFile.ContentType);
                            cmd.Parameters.AddWithValue("@Data", bytes);
                            cmd.Parameters.AddWithValue("@idServicio", idfile);
                            if (FileUpload1.PostedFile.FileName != "")
                            {
                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                            }
                        }
                    }
                }
            }
            cargargrid(idfile);

        }

        protected int ultimovalor()
        {


            // debe devolver en int el ultimo id asignado
            int x = 0;
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("select IDENT_CURRENT( 'TServicio' ) as P", conexion);
            SqlDataReader registro = comando.ExecuteReader();

            if (registro.Read())
            {
                // encontro el registro
                x = int.Parse(registro["P"].ToString());
            }
            // LabelResultado.Text = "el ultimo obtenido es:"+x.ToString();
            return x;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // borrar por id, de la tabla, solo queda recupear en un string elvalor de la tabla columna id qu pincho boton borrar

            // consigo el valor id de la fila del archivo que pincho en la fila
            string x=GridView1.Rows[e.RowIndex].Cells[1].Text;


            try
            {

                string s = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectionString"].ToString();

                SqlConnection conexion = new SqlConnection(s);
                conexion.Open();
                string cadena = "delete from TFiles where id='" + x + "'";
                // LabelResultado.Text = cadena;
                SqlCommand comando = new SqlCommand(cadena, conexion);
                int cantidad = comando.ExecuteNonQuery();

                if (cantidad == 1) LabelResultado.Text = "";

                conexion.Close();
            }

            catch
            {
                LabelResultado.Text = "ERROR DE BORRADO EN BASE DE DATOS";
            }

            cargargrid(txtIdServicio.Text);
        }
    }



}


