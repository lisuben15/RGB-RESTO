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
                
                var listaIdMeseros = servicioUsuario.ListarIdMeseros();

                ddlReporte.DataSource = listaIdMeseros;
                ddlReporte.DataValueField = "IdUsuario";
                ddlReporte.DataTextField = "IdUsuario"; 
                ddlReporte.DataBind();
                ddlReporte.Items.Insert(0, new ListItem("Seleccione un mesero", "0")); 

                
                MostrarPedidos();
            }
        }


        protected void ddlReporte_SelectedIndexChanged(object sender, EventArgs e)
        {
            MostrarPedidos();
            CalcularTotal();
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

        public void CalcularTotal()
        {
            decimal total = 0;

            foreach (GridViewRow row in dgvReporte.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    decimal precio;
                    if (decimal.TryParse(row.Cells[1].Text, out precio)) 
                    {
                        total += precio;
                    }
                }
            }

            
            txtTotal.Text = total.ToString();
        }

    }
}
