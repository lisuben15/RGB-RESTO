using Dominio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Manager
{
    public class ServicioPedido
    {


        public int CrearPedido(int NumeroMesa, int IdUsuario)
        {
            AccesoDatos datos = new AccesoDatos();
            int IdPedido=0;

            try
            {
                datos.setearProcedimiento("sp_CrearPedido");
                datos.setearParametros("@IdMesa", NumeroMesa);
                datos.setearParametros("@IdUsuario", IdUsuario);                        
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    
                   IdPedido = (int)datos.Lector["IdPedido"];
                 
                }
                return IdPedido;


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

        public void QuitarDelPedido(int IdDetallePedido)
        {

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_QuitarDelPedido");
                datos.setearParametros("@IdDetallePedido", IdDetallePedido);
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

        public void AgregarAlPedido(int IdPedido, int IdMenu)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("sp_AgregarAlPedido");
                datos.setearParametros("@IdPedido", IdPedido);
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

        public void CerrarPedido(int IdPedido)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("sp_CerrarPedido");
                datos.setearParametros("@IdPedido", IdPedido);           
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



        public List<DetallePedido> ListaDetallePedido(int IdPedido)
        {
            List<DetallePedido> lista = new List<DetallePedido>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("sp_ObtenerDetallePedido");
                datos.setearParametros("@IdPedido", IdPedido);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {

                    DetallePedido aux = new DetallePedido();
                    aux.IdDetallePedido = (int)datos.Lector["IdDetallePedido"];  // MAPEAR
                    aux.IdPedido = (int)datos.Lector["IdPedido"];
                    aux.Menu = new ElementoMenu();
                    aux.Menu.IdMenu = (int)datos.Lector["IdMenu"];
                    aux.Menu.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.Menu.Precio = (decimal)datos.Lector["Precio"];

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

        public int ObtenerPedidoActual(int NumeroMesa)
        {
            AccesoDatos datos = new AccesoDatos();
            int IdPedido = 0;

            try
            {
                datos.setearProcedimiento("sp_ObtenerPedidoActual");
                datos.setearParametros("@NumeroMesa", NumeroMesa);             
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {

                    IdPedido = (int)datos.Lector["IdPedido"];

                }
                return IdPedido;


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


        public List<ElementoMenu> ListaReportePorMesero(int IdUsuario)
        {
            List<ElementoMenu> lista = new List<ElementoMenu>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("sp_ObtenerDetallePedidoPorMesero");
                datos.setearParametros("@IdUsuario", IdUsuario);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {

                    ElementoMenu aux = new ElementoMenu();
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.Precio = (decimal)datos.Lector["Precio"];
                   

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
