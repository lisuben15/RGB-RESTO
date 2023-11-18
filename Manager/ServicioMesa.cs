using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
namespace Manager
{
    public class ServicioMesa
    {
        public void AgregarMesa()
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("sp_CrearMesa");              
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

        public void EliminarMesa(int IdMesa)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_EliminarMesa");
                datos.setearParametros("@IdMesa", IdMesa);
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

        public List<Mesa> ListarMesas()
        {
            List<Mesa> lista = new List<Mesa>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_ListarMesas");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Mesa mesa = new Mesa();
                    mesa.NumeroMesa = (int)datos.Lector["Idmesa"];                // Mapear

                    mesa.Estado = new EstadoMesa();

                    mesa.Estado.idEstadoMesa = (int)datos.Lector["IdEstado"];
                    mesa.Estado.Descripcion = (string)datos.Lector["Descripcion"];
                    mesa.IdUsuario = datos.Lector["IdUsuario"] != DBNull.Value ? (int?)datos.Lector["IdUsuario"] : null;
                    mesa.FechaReserva = datos.Lector["FechaReserva"] != DBNull.Value ? (DateTime?)datos.Lector["FechaReserva"] : null;
                   
                    lista.Add(mesa);
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


        public List<Mesa> ListarMesasPorMesero(int IdUsuario)
        {
            List<Mesa> lista = new List<Mesa>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_ListarMesasPorMesero");
                datos.setearParametros("@IdUsuario", IdUsuario);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Mesa mesa = new Mesa();
                    mesa.NumeroMesa = (int)datos.Lector["Idmesa"];                // Mapear

                    mesa.Estado = new EstadoMesa();

                    mesa.Estado.idEstadoMesa = (int)datos.Lector["IdEstado"];
                    mesa.Estado.Descripcion = (string)datos.Lector["Descripcion"];
                    mesa.IdUsuario = datos.Lector["IdUsuario"] != DBNull.Value ? (int?)datos.Lector["IdUsuario"] : null;
                    mesa.FechaReserva = datos.Lector["FechaReserva"] != DBNull.Value ? (DateTime?)datos.Lector["FechaReserva"] : null;

                    lista.Add(mesa);
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


        public void AsignarMesa(int IdUsuario, int NumeroMesa)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("sp_AsignarMesa");

                datos.setearParametros("@idUsuario", IdUsuario);             
                datos.setearParametros("@idMesa", NumeroMesa);
                
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

        public void desasignarMesas()
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_DesasignarMesas");              
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


        public Mesa ObtenerMesaPorId(int NumeroMesa)
        {
            
            AccesoDatos datos = new AccesoDatos();
            Mesa mesa = new Mesa();
            try
            {
                datos.setearProcedimiento("sp_ObtenerMesaPorId");
                datos.setearParametros("@NumeroMesa", NumeroMesa);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {

                   
                    mesa.NumeroMesa = (int)datos.Lector["Idmesa"];                // Mapear

                    mesa.Estado = new EstadoMesa();

                    mesa.Estado.idEstadoMesa = (int)datos.Lector["IdEstado"];
                    mesa.Estado.Descripcion = (string)datos.Lector["Descripcion"];
                    mesa.IdUsuario = datos.Lector["IdUsuario"] != DBNull.Value ? (int?)datos.Lector["IdUsuario"] : null;
                    mesa.FechaReserva = datos.Lector["FechaReserva"] != DBNull.Value ? (DateTime?)datos.Lector["FechaReserva"] : null;


                }
                    return mesa;
                
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

        public void CambiarEstado(int IdMesa, int IdEstado)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("sp_CambiarEstado");

                datos.setearParametros("@IdMesa", IdMesa);
                datos.setearParametros("@IdEstado", IdEstado);

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
