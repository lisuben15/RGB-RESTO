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
        ServicioMesa servicioMesa = new ServicioMesa();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                var listaIdMeseros = servicioUsuario.ListarMeseros();
                var listaIdMesas = servicioMesa.ListarMesas();

                ddlReporte.DataSource = listaIdMeseros;
                ddlReporte.DataValueField = "IdUsuario";
                ddlReporte.DataTextField = "Nombre"; 
                ddlReporte.DataBind();
                ddlReporte.Items.Insert(0, new ListItem("Seleccione un mesero", "0"));

                ddlReporteMesa.DataSource = listaIdMesas;
                ddlReporteMesa.DataValueField = "NumeroMesa";
                ddlReporteMesa.DataTextField = "NumeroMesa"; 
                ddlReporteMesa.DataBind();
                ddlReporteMesa.Items.Insert(0, new ListItem("Seleccione una mesa", "0"));

                lblTotalFacturacion.Text = servicioPedido.ObtenerTotalFacturado(DateTime.Now).ToString("N2");
               
            }
        }

        protected void ddlReporteMesa_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlReporte.SelectedIndex = 0;
            MostrarPedidosMesa();
            CalcularTotal();
        }


        protected void ddlReporte_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlReporteMesa.SelectedIndex = 0;
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

        public void MostrarPedidosMesa()
        {
            try
            {
                int NumeroMesa = Convert.ToInt32(ddlReporteMesa.SelectedValue);

                if (NumeroMesa != 0) 
                {
                    dgvReporte.DataSource = servicioPedido.ListaReportePorMesa(NumeroMesa);
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

            
            lblTotal.Text = total.ToString();
        }

    }
}
