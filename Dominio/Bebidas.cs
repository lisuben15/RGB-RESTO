using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Bebidas
    {
        public int IdBebida { get; set; }
        public string NombreBebida { get; set; }
        public decimal  Precio { get; set; }
        public bool Alcoholizada { get; set; }
        public int IdMarca { get; set; }

    }


}
