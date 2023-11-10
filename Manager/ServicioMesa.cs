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
        public void AgregarMesa(Mesa mesa)
        {
            //AccesoDatos datos = new AccesoDatos();

            //try
            //{
            //    datos.setearProcedimiento("sp_AgregarMesa");
            //    datos.setearParametros("@Descripcion",mesa.);
            //    datos.ejecutarAccion();

            //}
            //catch (Exception ex)
            //{

            //    throw ex;
            //}
            //finally
            //{
            //    datos.cerrarConexion();
            //}

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


    }
}
