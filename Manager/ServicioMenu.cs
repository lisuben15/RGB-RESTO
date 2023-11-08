using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Manager
{
    public class ServicioMenu
    {
        public void AgregarMenuItem(MenuItem menuItem)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("sp_AgregarMenuItem");
                datos.setearParametros("@Descripcion", menuItem.Descripcion);
                datos.setearParametros("@Precio", menuItem.Precio);
                datos.setearParametros("@IdCategoria", menuItem.Categoria.IdCategoria);
                datos.setearParametros("@RequiereStock", menuItem.RequiereStock);
                datos.setearParametros("@Stock", menuItem.Stock);
                datos.ejecutarAccion();

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

        public void EliminarMenuItem(int IdMenu)
        {

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_EliminarMenuItem");
                datos.setearParametros("@IdMenu", IdMenu);
                datos.ejecutarAccion();



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

        public List<MenuItem> ListarMenuItem()
        {
            List<MenuItem> lista = new List<MenuItem>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("sp_ListarMenuItem");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {

                    MenuItem aux = new MenuItem();
                    aux.IdMenu = (int)datos.Lector["IdMenu"];                // Mapear
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.Precio= (decimal)datos.Lector["Precio"];
                    aux.Categoria.IdCategoria = (int)datos.Lector["IdCategoria"];
                    aux.RequiereStock = (bool)datos.Lector["RequiereStock"];
                    aux.Stock = (int)datos.Lector["Stock"];

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

        public void ModificarMenuItem(MenuItem menuItem)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("sp_ModificarMenuItem");
                datos.setearParametros("@IdMenu", menuItem.IdMenu);
                datos.setearParametros("@Descripcion", menuItem.Descripcion);
                datos.setearParametros("@Precio", menuItem.Precio);
                datos.setearParametros("@IdCategoria", menuItem.Categoria.IdCategoria);
                datos.setearParametros("@RequiereStock", menuItem.RequiereStock);
                datos.setearParametros("@Stock", menuItem.Stock);
                datos.ejecutarAccion();
                
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
