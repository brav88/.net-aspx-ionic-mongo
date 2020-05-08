using MongoDB.Bson;
using System.Collections.Generic;

namespace Prestamos.Entidades
{
    public class Personas
    {
        public ObjectId _id { get; set; }
        public string identificacion { get; set; }
        public string nombre { get; set; }
        public string telefono { get; set; }
        public string direccion { get; set; }
    }   
}