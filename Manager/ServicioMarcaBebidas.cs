using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;


namespace Manager
{
    public class ServicioMarcaBebidas
    {
        public List<MarcaBebidas> listarMB()
        {

			List<MarcaBebidas> lista = new List<MarcaBebidas> ();
			AccesoDatos datos = new AccesoDatos();

			try
			{
				datos.setearConsulta("select IdMarca, NombreMarca from MarcaBebidas ");
				datos.ejecutarLectura();

				while (datos.Lector.Read())
				{
					MarcaBebidas aux = new MarcaBebidas();
					aux.IdMarca = (int)datos.Lector["IdMarca"];
					aux.NombreMarca = (string)datos.Lector["NombreMarca"];

					lista.Add(aux);
				}
				return lista;
			}
			catch (Exception ex)
			{

				throw ex;
			}
			finally
			{
				datos.cerrarConexion();
			}
        }

    }
}
