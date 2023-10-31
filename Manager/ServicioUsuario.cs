using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Manager
{
    public class ServicioUsuario
    {
        public void AgregarUsuario(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("sp_AgregarUsuario");
                datos.setearParametros("@Nombre", usuario.Nombre);
                datos.setearParametros("@Apellido",usuario.Apellido);
                datos.setearParametros("@Dni",usuario.Dni);
                datos.setearParametros("@Contrasenia",usuario.Contrasenia);
                datos.setearParametros("@FechaCreacion",usuario.FechaCreacion);
                datos.setearParametros("@Perfil",usuario.Perfil.IdPerfil);   
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

        public void EliminarUsuario(int Id)
        {

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_EliminarUsuario");
                datos.setearParametros("@Id", Id);
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

        public List<Usuario> ListarUsuarios()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("sp_ListarUsuarios");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {

                    Usuario aux = new Usuario();
                    aux.IdUsuario = (int)datos.Lector["IdUsuario"];                // Mapear
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Dni = (int)datos.Lector["Dni"];
                    aux.Contrasenia = (string)datos.Lector["Contrasenia"];
                    aux.FechaCreacion = (DateTime)datos.Lector["FechaCreacion"];

                    aux.Perfil = new Perfil();
                    aux.Perfil.IdPerfil = (int)datos.Lector["IdPerfil"];
                    aux.Perfil.Descripcion = (string)datos.Lector["Descripcion"];

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

        public void ModificarUsuario(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("sp_ModificarUsuario");
                datos.setearParametros("@IdUsuario",usuario.IdUsuario);
                datos.setearParametros("@Nombre",usuario.Nombre);
                datos.setearParametros("@Apellido",usuario.Apellido);
                datos.setearParametros("@Dni",usuario.Dni);
                datos.setearParametros("@Contrasenia",usuario.Contrasenia);
                datos.setearParametros("@FechaCreacion",usuario.FechaCreacion);           
                datos.setearParametros("@IdPerfil",usuario.Perfil.IdPerfil);          
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
