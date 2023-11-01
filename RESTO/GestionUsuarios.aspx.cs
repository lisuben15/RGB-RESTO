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
    public partial class Gestion_Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ServicioUsuario servicioUsuario = new ServicioUsuario();
            List<Usuario> lista = servicioUsuario.ListarUsuarios(); 
            dgvUsuario.DataSource = servicioUsuario.ListarUsuarios();
            dgvUsuario.DataBind();
        }
    }
}