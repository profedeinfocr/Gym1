using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gym1.Clases;

namespace Gym1
{
    public partial class HomeRegular : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Temail.Text = ClsUsuarios.email;
            ClsUsuarios.clave = Tclave.Text;

            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Gym1ConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand(" SELECT cm.nombre, cm.apellidos, cm.fecha_nacimiento, cm.telefono, um.clave, um.tipo, d.provincia, d.canton, d.distrito, d.detalles from Client_Master cm inner join User_Master um on um.email = cm.email inner join Direccion d on d.email = cm.email where cm.email =  '" + Temail.Text + "' ", conexion);
            SqlDataReader registro = comando.ExecuteReader();

            //CleanForm();
            registro.Read();
            Tnombre.Text = registro["nombre"].ToString();
            Tapellidos.Text = registro["apellidos"].ToString();
            TfechaN.Text = registro["fecha_nacimiento"].ToString();
            Ttelefono.Text = registro["telefono"].ToString();
            Tclave.Text = registro["clave"].ToString();
            DDLprovincia.Text = registro["provincia"].ToString();
            DDLcanton.Text = registro["canton"].ToString();
            DDLdistrito.Text = registro["distrito"].ToString();
            Tdetalle.Text = registro["detalles"].ToString();

        }

       

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Temail_TextChanged(object sender, EventArgs e)
        {

        }
    }
}