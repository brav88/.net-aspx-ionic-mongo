using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Prestamos.Entidades
{
    public class PrestamoPersona
    {
        public ObjectId _id { get; set; }
        public string identificacion { get; set; }
        public int IDPR { get; set; }
        public DateTime fecha { get; set; }
        public Int64 saldoInicial { get; set; }
        public Int64 saldoActual { get; set; }
        public string estado { get; set; }
    }
}