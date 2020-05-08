using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Prestamos.Entidades
{
    public class AbonoPrestamo
    {
        public ObjectId _id { get; set; }
        public string identificacion { get; set; }
        public int IDPR { get; set; }
        public DateTime fecha { get; set; }
        public Int64 monto { get; set; }
        public Int64 amortiza { get; set; }
        public Int64 interes { get; set; }
    }
}