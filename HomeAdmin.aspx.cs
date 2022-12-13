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

        public static SqlConnection obtenerConexion()
        {
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["Gym1ConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            return conexion;
        }


        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["Gym1ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT cm.email, cm.nombre, cm.apellidos, cm.telefono, um.clave, um.tipo, d.provincia, d.canton, d.distrito, d.detalles from Client_Master cm inner join User_Master um on um.email = cm.email inner join Direccion d on d.email = cm.email "))
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
            SqlCommand comando2 = new SqlCommand(" INSERT INTO User_Master(email, clave, tipo) VALUES('" + Temail.Text + "', '" + Tclave.Text + "', '" + DDLtipo.Text + "')", conexion);
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

        protected void Bborrar_Click(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Gym1ConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("DELETE User_Master where email = '" + Temail.Text + "'", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            LlenarGrid();
        }

        protected void Bactualizar_Click(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Gym1ConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand(" UPDATE Client_Master SET nombre = '" + Tnombre.Text + "', apellidos = '" + Tapellidos.Text + "', telefono = '" + Ttelefono.Text + "', fecha_nacimiento = '" + TfechaN.Text + "'  WHERE email = '"+Temail.Text+"'", conexion);
            SqlCommand comando2 = new SqlCommand(" UPDATE User_Master set clave = '" + Tclave.Text + "', tipo = '" + DDLtipo.Text + "' WHERE email = '"+Temail.Text+ "' ", conexion);
            SqlCommand comando3 = new SqlCommand(" UPDATE Direccion set provincia = '" + DDLprovincia.Text + "', canton =  '" + DDLcanton.Text + "', distrito = '" + DDLdistrito.Text + "' , detalles = '" + Tdetalle.Text + "' WHERE email = '" + Temail.Text + "'", conexion);
            comando.ExecuteNonQuery();
            comando2.ExecuteNonQuery();
            comando3.ExecuteNonQuery();
            conexion.Close();
            LlenarGrid();

        }

        protected void Bconsultar_Click(object sender, EventArgs e)
        {
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
            DDLtipo.Text = registro["tipo"].ToString();
            DDLprovincia.Text = registro["provincia"].ToString();
            DDLcanton.Text = registro["canton"].ToString();
            DDLdistrito.Text = registro["distrito"].ToString();
            Tdetalle.Text = registro["detalles"].ToString();


        }

        
        protected void Bfumigar_Click(object sender, EventArgs e)
        {
            
            SqlConnection Conn = new SqlConnection();

            
                using (Conn = DboConnection.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("borrarUsuarios", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("email", Temail.Text));
                    cmd.ExecuteNonQuery();
                    LlenarGrid();

                string jscript = "<script>alert('YOUR BUTTON HAS BEEN CLICKED')</script>";
                }
            }
    }
}