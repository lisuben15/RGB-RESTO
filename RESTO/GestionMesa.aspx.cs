using Manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RESTO
{
    public partial class GestionMesa : System.Web.UI.Page
    {
        ServicioMesa servicioMesa = new ServicioMesa();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                dgvMesa.DataSource = servicioMesa.ListarMesas();
                dgvMesa.DataBind();
            }
        }

        protected void btnAsignarMesa_Click(object sender, EventArgs e)
        {
            if (Session["NumeroMesa"] == null) {
                Response.Write("<script>alert('No se selecciono mesa.')</script>");
            }
            else
            {
                Response.Redirect("GestionMesa_a_Mesero.aspx?NumeroMesa=" + Session["NumeroMesa"].ToString());
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
           
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void dgvMesa_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["NumeroMesa"] = dgvMesa.SelectedDataKey.Value.ToString();
        }

        protected void btnDesasignarMesas_Click(object sender, EventArgs e)
        {
            ServicioMesa servicioMesa = new ServicioMesa();
            servicioMesa.desasignarMesas();
            Response.Redirect("GestionMesa.aspx");
        }
    } 
}