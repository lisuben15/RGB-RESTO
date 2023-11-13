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
    public partial class CambiarContrasenia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDNI.Text = Session["DNI"].ToString();
            }
          
        }

        protected void btnCambiarPass_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtPassword.Text))
            {
                ServicioUsuario servicioUsuario = new ServicioUsuario();
                int idUsuario = int.Parse(Session["IdUsuario"].ToString());

                servicioUsuario.ModificarContrasenia(idUsuario, txtPassword.Text);

                Response.Redirect("default.aspx");
            }
        }
    }
}