using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pedido
    {
       public int NumeroPedido { get; set; }
       public int NumeroMesa {  get; set; }  
       public string Entrada { get; set; }
       public string Plato { get; set; }
        public string Bebida { get; set;}
        public string Postre { get; set;}
    }
}
