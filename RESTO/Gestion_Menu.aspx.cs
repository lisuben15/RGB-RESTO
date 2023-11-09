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
    public partial class Gestion_Menu : System.Web.UI.Page
    {
        ServicioCategoria servicioCategoria = new ServicioCategoria();
        ServicioMenu servicioMenu = new ServicioMenu();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                ddlCategorias.DataSource = servicioCategoria.ListarCategoria();

                ddlCategorias.DataTextField = "Descripcion";
                ddlCategorias.DataValueField = "IdCategoria";
                ddlCategorias.DataBind();

                ddlCategorias.SelectedIndex = 0;

                int idCategoriaSeleccionado = Convert.ToInt32(ddlCategorias.SelectedItem.Value);

                dgvMenu.DataSource = servicioMenu.ListarElementoMenu(idCategoriaSeleccionado);
                dgvMenu.DataBind();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarMenu.aspx");
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (Session["IdMenu"]!= null) {
                string IdMenu = Session["IdMenu"].ToString();
                Response.Redirect("AgregarMenu.aspx?id=" + IdMenu);
            }
          
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void dgvMenu_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["IdMenu"] = dgvMenu.SelectedDataKey.Value.ToString();
        }

        protected void ddlCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idCategoria = Convert.ToInt32(ddlCategorias.SelectedItem.Value);
            dgvMenu.DataSource = servicioMenu.ListarElementoMenu(idCategoria);
            ddlCategorias.DataTextField = "Descripcion";
            ddlCategorias.DataValueField = "IdCategoria";
            ddlCategorias.DataBind();
        }
    }
}