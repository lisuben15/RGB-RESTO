using Dominio;
using Manager;
using System;
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
                ServicioPedido servicioPedido = new ServicioPedido();

               lblTotal.Text = servicioPedido.ObtenerTotalFacturado(DateTime.Now).ToString("N2");
               
            }
        }


        protected void ddlReporte_SelectedIndexChanged(object sender, EventArgs e)
        {
            MostrarPedidos();
           
        }

        public void MostrarPedidos()
        {
            try
            {
                int IdUsuario = Convert.ToInt32(ddlReporte.SelectedValue);

                if (IdUsuario != 0) 
                {
                    dgvReporte.DataSource = servicioPedido.ListaReportePorMesero(IdUsuario);
                    dgvReporte.DataBind();
                }
                else
                {
                    
                    dgvReporte.DataSource = null;
                    dgvReporte.DataBind();
                }
            }
            catch (Exception ex)
            {
                
                Response.Write("<script>alert('Error al mostrar los pedidos: " + ex.Message + "')</script>");
            }
        }

       

    }
}
