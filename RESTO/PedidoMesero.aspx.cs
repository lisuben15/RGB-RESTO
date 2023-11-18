using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Manager;

namespace RESTO
{
    public partial class PedidoMesero : System.Web.UI.Page
    {

        public int IdMenuSeleccionado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                ServicioMenu servicioMenu = new ServicioMenu();
                dgvMenuPedidos.DataSource = servicioMenu.ListarElementoMenuCompleto();
                dgvMenuPedidos.DataBind();

            }
            ServicioPedido servicioPedido = new ServicioPedido();
            int NumeroMesa = int.Parse(Request.QueryString["NumeroMesa"].ToString());

            int IdPedido = servicioPedido.ObtenerPedidoActual(NumeroMesa);

            dgvPedido.DataSource = servicioPedido.ListaDetallePedido(IdPedido);
            dgvPedido.DataBind();
        }

        protected void dgvMenuPedidos_SelectedIndexChanged(object sender, EventArgs e)
        {
            IdMenuSeleccionado = int.Parse(dgvMenuPedidos.SelectedDataKey.Value.ToString());
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            ServicioPedido servicioPedido = new ServicioPedido();

            int NumeroMesa = int.Parse(Request.QueryString["NumeroMesa"].ToString());

            int IdPedido = servicioPedido.ObtenerPedidoActual(NumeroMesa);

            int IdMenu = int.Parse(dgvMenuPedidos.SelectedDataKey.Value.ToString());

            servicioPedido.AgregarAlPedido(IdPedido,IdMenu); 
        }

        protected void btnCerrarPedido_Click(object sender, EventArgs e)
        {

        }

        protected void btnCrearPedido_Click(object sender, EventArgs e)
        {
            ServicioMesa servicioMesa = new ServicioMesa();
            int NumeroMesa = int.Parse(Request.QueryString["NumeroMesa"].ToString());
            Mesa mesa = servicioMesa.ObtenerMesaPorId(NumeroMesa);

            if(mesa.Estado.Descripcion == "Libre")
            {
                ServicioPedido servicioPedido = new ServicioPedido();
                int idPedido = servicioPedido.CrearPedido(NumeroMesa, mesa.IdUsuario.Value); // falta el otro parametro
                servicioMesa.CambiarEstado(NumeroMesa, (int)EnumEstadosMesa.Ocupada);
            }           
        }
    }
}