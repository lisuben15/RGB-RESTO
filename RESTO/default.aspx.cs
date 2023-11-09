using Manager;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RESTO
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Manager.ServicioUsuario usuario = new Manager.ServicioUsuario();
            int perfil = usuario.Loguear(TxtUsuario.Text,TxtPassword.Text);
            if(perfil!=0){
                Session.Add("usuario", usuario);
                Session.Add("perfil", perfil);
                switch(perfil) 
                {
                    case 1:
                        Response.Redirect("PaginaGerente.aspx");
                    break;
                    case 2:
                        Response.Redirect("PaginaMesero.aspx");
                    break;
                    
                    default:
                        // code block
                    break;}
            }
            else
            {
                ltNotify.Text = "Usuario o contraseña incorrectos.";
                ltNotify1.Text = "Por favor, verifique sus datos";
            }
        }

              
    }
}