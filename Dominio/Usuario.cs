﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Usuario
    {
        public int IdUsuario { get; set; }
        public string  Nombre { get; set; }
        public string Apellido{ get; set; }
        public int Dni {  get; set; }
        public string Contrasenia{ get; set;}
        public DateTime FechaCreacion { get; set; }
        public Perfil Perfil { get; set; }
    }
}



