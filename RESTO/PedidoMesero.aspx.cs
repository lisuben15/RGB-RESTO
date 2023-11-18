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
            int IdPedido = 0;
            List<Pedido> pedidosPersistidos = (List<Pedido>)Session["PedidosPersistidos"];
            foreach (Pedido pedido in pedidosPersistidos)
            if (pedido.NumeroMesa == NumeroMesa)
            {
                IdPedido = pedido.NumeroPedido;
            }
            List<DetallePedido> listaDetallePedidos=servicioPedido.ListaDetallePedido(IdPedido);
            dgvPedido.DataSource = listaDetallePedidos;
            dgvPedido.DataBind();
        }

        protected void dgvMenuPedidos_SelectedIndexChanged(object sender, EventArgs e)
        {
            IdMenuSeleccionado = int.Parse(dgvMenuPedidos.SelectedDataKey.Value.ToString());
             dgvMenuPedidos.SelectedRowStyle.BorderColor = System.Drawing.Color.Red;
            if (dgvMenuPedidos.SelectedRow.RowIndex!=0) {
                dgvMenuPedidos.Rows[dgvMenuPedidos.SelectedRow.RowIndex - 1].BorderColor = System.Drawing.Color.Red;
            }
            dgvMenuPedidos.SelectedRowStyle.ForeColor=System.Drawing.Color.Red;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            ServicioPedido servicioPedido = new ServicioPedido();
            int NumeroMesa = int.Parse(Request.QueryString["NumeroMesa"].ToString());
            int IdPedido = 0;
            
            List<Pedido> pedidosPersistidos = (List<Pedido>)Session["PedidosPersistidos"];
            int mesaConPedido=0;
            foreach (Pedido pedido in pedidosPersistidos)
                if (pedido.NumeroMesa == NumeroMesa)
                {
                    IdPedido = pedido.NumeroPedido;
                    mesaConPedido = 1;
                }
            if (mesaConPedido==1)
            {
                int IdMenu = int.Parse(dgvMenuPedidos.SelectedDataKey.Value.ToString());
                servicioPedido.AgregarAlPedido(IdPedido,IdMenu); 
            }
            else
            {
                Response.Write("<script>alert('No hay un pedido abierto en esta mesa aun.')</script>");
            }
        }

        protected void btnCerrarPedido_Click(object sender, EventArgs e)
        {
            int NumeroMesa = int.Parse(Request.QueryString["NumeroMesa"].ToString());

            List<Pedido> pedidosPersistidos = (List<Pedido>)Session["PedidosPersistidos"];
            List<Pedido> pedidosActualizados = new List<Pedido>(); 
            foreach (Pedido pedido in pedidosPersistidos)
                if (pedido.NumeroMesa != NumeroMesa)
                {
                    pedidosActualizados.Add(pedido);
                }
            if (pedidosActualizados.Count == 0)
            {
                Response.Write("<script>alert('Se cerro el pedido correctamente.')</script>");
            }
            else
            {
                Session.Add("PedidosPersistidos", pedidosActualizados);
            }
        }

        protected void btnCrearPedido_Click(object sender, EventArgs e)
        {
            ServicioMesa servicioMesa = new ServicioMesa();
            int NumeroMesa = int.Parse(Request.QueryString["NumeroMesa"].ToString());
            List<Pedido> pedidosPersistidos = (List<Pedido>)Session["PedidosPersistidos"];
            int mesaConPedido= 0;
            foreach (Pedido pedido in pedidosPersistidos)
                if (pedido.NumeroMesa == NumeroMesa)
                {
                    mesaConPedido = 1;
                }
            if (mesaConPedido== 0)
            {
                Mesa mesa = servicioMesa.ObtenerMesaPorId(NumeroMesa);
                if(mesa.Estado.Descripcion == "Libre")
                {
                    ServicioPedido servicioPedido = new ServicioPedido();
                    int idPedido = servicioPedido.CrearPedido(NumeroMesa, mesa.IdUsuario.Value); // falta el otro parametro
                    servicioMesa.CambiarEstado(NumeroMesa, (int)EnumEstadosMesa.Ocupada);
                    Pedido aPersistir = new Pedido();
                    aPersistir.NumeroPedido = idPedido;
                    aPersistir.NumeroMesa = NumeroMesa;
                    pedidosPersistidos.Add(aPersistir);
                    Session.Add("PedidosPersistidos", pedidosPersistidos);
                }
            }
            if(mesaConPedido==1)
            {
                Response.Write("<script>alert('Ya existe un pedido abierto en esta mesa.')</script>");
            }
        }
    }
}