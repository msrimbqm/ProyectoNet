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
    public partial class AltaServicio : System.Web.UI.Page
    {
        

      
        
        protected void Page_Load(object sender, EventArgs e)
        {
            // poner fecha actuale en los calendar
            calFecha.VisibleDate = DateTime.Today;
            calFecha.SelectedDate = DateTime.Today;
            calVencimiento.VisibleDate = DateTime.Today;
            calVencimiento.SelectedDate = DateTime.Today;
            txtIdServicio.Text = "";
            // carga el grid sin datos dentro

            cargargrid(txtIdServicio.Text);


           

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

        protected void calFecha_SelectionChanged(object sender, EventArgs e)
        {
            
        }

        protected void calVencimiento_SelectionChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
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
                            cmd.Parameters.AddWithValue("@Name",FileUpload1.PostedFile.FileName);
                            cmd.Parameters.AddWithValue("@ContentType", FileUpload1.PostedFile.ContentType);
                            cmd.Parameters.AddWithValue("@Data", bytes);
                            cmd.Parameters.AddWithValue("@idServicio",idfile );
                            if (FileUpload1.PostedFile.FileName != "")
                            { con.Open();
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
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;
            string constr = ConfigurationManager.ConnectionStrings["SQLConnectionString"].ConnectionString;
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



        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select id, Name from TFiles";
                    cmd.Connection = con;
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                    con.Close();
                }
            }
        }










    }


}
