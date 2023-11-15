﻿using Dominio;
using Manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RESTO
{
    public partial class PaginaMesero : System.Web.UI.Page
    {
        public List<Mesa> listaMesas { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            int idUsuario = int.Parse(Session["IdUsuario"].ToString());

            ServicioMesa servicioMesa = new ServicioMesa();
            listaMesas = servicioMesa.ListarMesasPorMesero(idUsuario);

            Repetidor.DataSource = listaMesas;
            Repetidor.DataBind();
        }

        protected void btnMesa_Click(object sender, EventArgs e)
        {
            Response.Redirect("PedidoMesero.aspx");
        }
    }
}