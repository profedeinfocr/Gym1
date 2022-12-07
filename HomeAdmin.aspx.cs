using Gym1.Clases;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gym1
{
    public partial class HomeAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["Gym1ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT cm.email, cm.nombre, cm.apellidos, cm.telefono, um.clave, d.provincia, d.canton, d.distrito, d.detalles from Client_Master cm inner join User_Master um on um.email = cm.email inner join Direccion d on d.email = cm.email "))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void Bagregar_Click(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Gym1ConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand(" INSERT INTO Client_Master(email, nombre, apellidos, telefono, fecha_nacimiento) VALUES('" + Temail.Text + "', '" + Tnombre.Text + "', '" + Tapellidos.Text + "', '" + Ttelefono.Text + "', '" + TfechaN.Text + "')", conexion);
            SqlCommand comando2 = new SqlCommand(" INSERT INTO User_Master(email, clave) VALUES('" + Temail.Text + "', '" + Tclave.Text + "')", conexion);
            SqlCommand comando3 = new SqlCommand(" INSERT INTO Direccion(email, provincia, canton, distrito, detalles) VALUES('" + Temail.Text + "', '" + DDLprovincia.Text + "', '" + DDLcanton.Text + "', '" + DDLdistrito.Text + "' , '" + Tdetalle.Text + "')", conexion);
            comando.ExecuteNonQuery();
            comando2.ExecuteNonQuery();
            comando3.ExecuteNonQuery();
            conexion.Close();
            LlenarGrid();
        }

        protected void DDLdistrito_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Tdetalle_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Temail_TextChanged(object sender, EventArgs e)
        {

        }
    }
}