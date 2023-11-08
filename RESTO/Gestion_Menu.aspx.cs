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
        protected void Page_Load(object sender, EventArgs e, Gestion_Usuarios gestion_usuarios)
        {
            bool valida = gestion_usuarios.ValidarAccesoPagina(2);
            if (!valida)
            {
                Server.Transfer("default.aspx");
            }
            else
            {
            }
        }
    }
}