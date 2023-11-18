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
    public partial class Reporte : System.Web.UI.Page
    {

        ServicioPedido servicioPedido = new ServicioPedido(); 
        ServicioUsuario servicioUsuario = new ServicioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ddlReporte.DataSource = servicioUsuario.ListarIdMeseros();
                ddlReporte.DataValueField = "IdUsuario";
                ddlReporte.DataBind();

                ddlReporte.SelectedIndex = 0;

                try
                {
                    int IdUsuario = Convert.ToInt32(ddlReporte.SelectedItem.Value);
                    dgvReporte.DataSource = servicioPedido.ListaReportePorMesero(IdUsuario);
                    dgvReporte.DataBind();
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('No se seleccionó Mesero para eliminar.')</script>");
                }


            }


        }

        protected void ddlReporte_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}