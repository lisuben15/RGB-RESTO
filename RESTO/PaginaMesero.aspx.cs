﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RESTO
{
    public partial class PaginaMesero : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnTomarPedido_Click(object sender, EventArgs e)
        {
            Response.Redirect("PedidoMesero.aspx");
        }
    }
}