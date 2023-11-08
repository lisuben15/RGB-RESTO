﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;
using Dominio;
namespace RESTO
{
    public partial class Gestion_Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!ValidarAccesoPagina(1))
            {
                Server.Transfer("default.aspx");
            }
            else
            {
                ServicioUsuario servicioUsuario = new ServicioUsuario();
                List<Usuario> lista = servicioUsuario.ListarUsuarios();
                dgvUsuario.DataSource = servicioUsuario.ListarUsuarios();
                dgvUsuario.DataBind();
            }
        }
        public bool ValidarAccesoPagina(int perfil)
        {
            if ((Session["usuario"] == null) || (Session["perfil"] == null) || ((int)Session["perfil"] > perfil))
            {
                if ((Session["perfil"] != null) && (Session["usuario"] != null))
                {
                    Response.Write("<script>alert('El usuario no posee el permiso suficiente para acceder a esta pagina.')</script>");
                }
                if (Session["usuario"] == null)
                {
                    Response.Write("<script>alert('Por favor, acceda con su usuario y contraseña.')</script>");
                }
                return false;
            }
            else
            {
                return true;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                ServicioUsuario servicioUsuario = new ServicioUsuario();

                int IdUsuario = int.Parse(Session["IdUsuario"].ToString());
                servicioUsuario.EliminarUsuario(IdUsuario);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void dgvUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            //int idUsuario = int.Parse(dgvUsuario.SelectedRow.Cells[0].Text);
            // int idUsuario = int.Parse(dgvUsuario.SelectedDataKey.Value.ToString());
            Session["IdUsuario"] = dgvUsuario.SelectedDataKey.Value.ToString();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarUsuario.aspx");
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            //ServicioUsuario servicioUsuario = new ServicioUsuario();
            //int IdUsuario = int.Parse(Session["IdUsuario"].ToString());
            //servicioUsuario.ModificarUsuario();
        }
    }
}
