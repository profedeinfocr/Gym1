using Gym1.Clases;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gym1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ClsUsuarios.email = Temail.Text;
            ClsUsuarios.clave = Tclave.Text;

            if (ClsUsuarios.ValidarLogin(ClsUsuarios.email, ClsUsuarios.clave) > 0)
            {

                if (ClsUsuarios.tipo.Equals("Admin"))
                {

                    Response.Redirect("HomeAdmin.aspx");

                }

                else {

                    Response.Redirect("HomeRegular.aspx");

                }
            }
            else
            {

                lmensaje.Text = " usuario o contraseña incorrecto";
                // Response.Redirect("Inicio.aspx");

            }
        }

        protected void Tclave_TextChanged(object sender, EventArgs e)
        {
         

        }
    }
}