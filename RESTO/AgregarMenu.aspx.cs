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
    public partial class AgregarMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ServicioCategoria servicioCategoria = new ServicioCategoria();
            ServicioMenu servicioMenu = new ServicioMenu();

            if (!IsPostBack)
            {
                ddlOpciones.DataSource = servicioCategoria.ListarCategoria();
                ddlOpciones.DataTextField = "Descripcion";
                ddlOpciones.DataValueField = "IdCategoria";
                ddlOpciones.DataBind();
                ddlOpciones.SelectedIndex = 0;

                if (Request.QueryString["id"] != null)
                {
                    int idMenu = int.Parse(Request.QueryString["id"]);
                    ElementoMenu menu = servicioMenu.ObtenerElementoMenuPorId(idMenu);

                    txtDescripcion.Text = menu.Descripcion;
                    txtPrecio.Text = menu.Precio.ToString();
                    ddlOpciones.SelectedValue = menu.Categoria.IdCategoria.ToString();
                    txtRequiereStock.Text = menu.RequiereStock.ToString();
                    txtStock.Text = menu.Stock.ToString();
                }
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            ServicioMenu servicioMenu = new ServicioMenu();
            ElementoMenu elementoMenu = new ElementoMenu();

            elementoMenu.Descripcion = txtDescripcion.Text;
            elementoMenu.Precio = decimal.Parse(txtPrecio.Text);
            elementoMenu.Categoria = new Categoria();
            elementoMenu.Categoria.IdCategoria = int.Parse(ddlOpciones.SelectedValue);
            elementoMenu.RequiereStock = (txtRequiereStock.Text == "1");
            elementoMenu.Stock = int.Parse(txtStock.Text);

            if (Request.QueryString["id"] == null)
            {
                servicioMenu.AgregarElementoMenu(elementoMenu);
            }
            else
            {
                elementoMenu.IdMenu = int.Parse(Request.QueryString["id"]);
                servicioMenu.ModificarElementoMenu(elementoMenu);
            }

                Response.Redirect("Gestion_Menu.aspx"); // sacar esto luego 
 
        }
    }
}