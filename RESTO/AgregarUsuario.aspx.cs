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

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            ServicioUsuario servicioUsuario = new ServicioUsuario();
            Usuario usuario = new Usuario();

            usuario.Nombre = txtNombre.Text;
            usuario.Apellido = txtApellido.Text;
            usuario.Dni = txtDni.Text;
            usuario.Perfil = new Perfil();
            usuario.Perfil.IdPerfil = int.Parse(ddlOpciones.SelectedValue);

            servicioUsuario.AgregarUsuario(usuario);
            Response.Redirect("GestionUsuarios.aspx"); // sacar esto luego 

        }
    }
}