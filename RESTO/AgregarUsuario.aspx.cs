using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;
using Dominio;
namespace RESTO
{
    public partial class AgregarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    ServicioUsuario servicioUsuario = new ServicioUsuario();
                    int idUsuario = int.Parse(Request.QueryString["id"]);
                    Usuario usuario = servicioUsuario.ObtenerUsuarioPorId(idUsuario);

                    txtNombre.Text = usuario.Nombre;
                    txtApellido.Text = usuario.Apellido;
                    txtDni.Text = usuario.Dni;
                    ddlOpciones.SelectedValue = usuario.Perfil.IdPerfil.ToString();

                }


            }

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ServicioUsuario servicioUsuario = new ServicioUsuario();

            Usuario usuario = new Usuario();

            usuario.Nombre = txtNombre.Text;
            usuario.Apellido = txtApellido.Text;
            usuario.Dni = txtDni.Text;
            usuario.Perfil = new Perfil();
            usuario.Perfil.IdPerfil = int.Parse(ddlOpciones.SelectedValue);
            

            if (Request.QueryString["id"] == null)
            {
                servicioUsuario.AgregarUsuario(usuario);             

            }
            else
            {
                usuario.IdUsuario = int.Parse(Request.QueryString["id"]);
                usuario.Contrasenia = txtContrasenia.Text;

                servicioUsuario.ModificarUsuario(usuario);
                if (txtContrasenia.Text != null)
                {
                    servicioUsuario.ModificarContrasenia(usuario.IdUsuario, usuario.Contrasenia);
                }
            }
            
            Response.Redirect("GestionUsuarios.aspx"); // sacar esto luego 

        }
    }
}