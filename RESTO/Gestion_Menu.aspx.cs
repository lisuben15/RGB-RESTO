using Dominio;
using Manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RESTO
{
    public partial class Gestion_Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ServicioMenu servicioUsuario = new ServicioUsuario();
            //List<Usuario> lista = servicioUsuario.ListarUsuarios();
            //dgvUsuario.DataSource = servicioUsuario.ListarUsuarios();
            //dgvUsuario.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarMenu.aspx");
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void dgvMenu_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["IdMenu"] = dgvMenu.SelectedDataKey.Value.ToString();
        }
    }
}