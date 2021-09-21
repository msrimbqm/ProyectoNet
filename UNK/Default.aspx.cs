using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UNK
{
    public partial class Entrada : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void d_Click(object sender, EventArgs e)
        {
            if ((txtClave.Text == "msr") && (txtUsuario.Text == "msr")) Response.Redirect("Servicios.aspx");
            else LabelResultado.Text = "DATOS INCORRECTOS";
        }
    }
}