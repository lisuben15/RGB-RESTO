using Manager;
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
            //Response.Redirect("GestionUsuarios.aspx");

                ServicioUsuario servicioUsuario = new ServicioUsuario();
                
                // Obtener el numero de dni y la contraseña ingresados por el usuario.
                string Dni = TxtUsuario.Text;
                string Contrasenia = TxtPassword.Text;

                
                int IdPerfil = servicioUsuario.ObtenerTipoDeUsuario(Dni, Contrasenia);

                // Realizar la redirección según el tipo de usuario.
                if (IdPerfil == 1)
                {
                    Response.Redirect("PaginaGerente.aspx");
                }
                else if (IdPerfil == 2)
                {
                    Response.Redirect("PaginaMesero.aspx");
                }
                else
                {
                // En caso de una autenticación fallida, mostrar un mensaje de error o redirigir a una página de error.
                 LblError.Text = "El usuario no está registrado!  ";
            }
        }
            


    }
}