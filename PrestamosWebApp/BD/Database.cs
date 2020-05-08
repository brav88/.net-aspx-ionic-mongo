using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Driver;
using Prestamos.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Database
{
    static string mongo = System.Configuration.ConfigurationManager.AppSettings["mongo"].ToString();
    static string bd = System.Configuration.ConfigurationManager.AppSettings["bd"].ToString();

    static MongoClient dbClient = new MongoClient(mongo);

    public List<Personas> getPersonas()
    {
        IMongoDatabase db = dbClient.GetDatabase(bd);

        var personas = db.GetCollection<BsonDocument>("Personas");

        List<BsonDocument> bsonArray = personas.Find(new BsonDocument()).ToList();

        List<Personas> lista = new List<Personas>();

        foreach (BsonDocument persona in bsonArray)
        {
            Personas item = BsonSerializer.Deserialize<Personas>(persona);
            lista.Add(item);
        }

        return lista;
    }

    public List<Personas> getPersonasByExactField(string field, string value)
    {
        IMongoDatabase db = dbClient.GetDatabase(bd);

        var personas = db.GetCollection<BsonDocument>("Personas");

        var filter = "{ $and: [{ "+ field + ": '" + value + "' }] }";

        List<BsonDocument> bsonArray = personas.Find(filter).ToList();

        List<Personas> lista = new List<Personas>();

        foreach (BsonDocument persona in bsonArray)
        {
            Personas item = BsonSerializer.Deserialize<Personas>(persona);
            lista.Add(item);
        }

        return lista;
    }

    public List<Personas> getPersonasByLikeField(string field, string value)
    {
        IMongoDatabase db = dbClient.GetDatabase(bd);

        var personas = db.GetCollection<BsonDocument>("Personas");

        var filter = Builders<BsonDocument>.Filter.Regex(field, new BsonRegularExpression(value));

        List<BsonDocument> bsonArray = personas.Find(filter).ToList();

        List<Personas> lista = new List<Personas>();

        foreach (BsonDocument persona in bsonArray)
        {
            Personas item = BsonSerializer.Deserialize<Personas>(persona);
            lista.Add(item);
        }

        return lista;
    }  

    public List<PrestamoPersona> getPrestamoPersona(string id)
    {
        IMongoDatabase db = dbClient.GetDatabase(bd);

        var personas = db.GetCollection<BsonDocument>("PrestamoPersona");

        var filter = "{ $and: [{ identificacion: '" + id + "' }, { estado: 'A' }] }";

        List<BsonDocument> bsonArray = personas.Find(filter).ToList();

        List<PrestamoPersona> lista = new List<PrestamoPersona>();

        foreach (BsonDocument prestamo in bsonArray)
        {
            PrestamoPersona item = BsonSerializer.Deserialize<PrestamoPersona>(prestamo);
            lista.Add(item);
        }

        return lista;
    }

    public List<PrestamoPersona> getPrestamoPersonaByIdpr(string id, string idpr)
    {
        IMongoDatabase db = dbClient.GetDatabase(bd);

        var personas = db.GetCollection<BsonDocument>("PrestamoPersona");

        var filter = "{ $and: [{ identificacion: '" + id + "' }, { IDPR: '" + idpr + "' }] }";

        List<BsonDocument> bsonArray = personas.Find(filter).ToList();

        List<PrestamoPersona> lista = new List<PrestamoPersona>();

        foreach (BsonDocument prestamo in bsonArray)
        {
            PrestamoPersona item = BsonSerializer.Deserialize<PrestamoPersona>(prestamo);
            lista.Add(item);
        }

        return lista;
    }

    public List<AbonoPrestamo> getAbonoPrestamo(string id, string idpr)
    {
        IMongoDatabase db = dbClient.GetDatabase(bd);

        var abonoPrestamo = db.GetCollection<BsonDocument>("AbonoPrestamo");

        var filter = "{ $and: [{ identificacion: '" + id + "' }, { IDPR: '" + idpr + "' }] }";

        List<BsonDocument> bsonArray = abonoPrestamo.Find(filter).ToList();

        List<AbonoPrestamo> lista = new List<AbonoPrestamo>();

        foreach (BsonDocument abono in bsonArray)
        {
            AbonoPrestamo item = BsonSerializer.Deserialize<AbonoPrestamo>(abono);
            lista.Add(item);
        }

        return lista;
    }

    public string insertPersona(string id, string nombre, string telefono, string direccion)
    {
        List<Personas> arr = getPersonasByExactField("identificacion", id);

        if (arr.Count == 0)
        {
            IMongoDatabase db = dbClient.GetDatabase(bd);

            var personas = db.GetCollection<BsonDocument>("Personas");

            var doc = new BsonDocument
            {
                {"identificacion", id},
                {"nombre", nombre},
                {"telefono", telefono },
                {"direccion", direccion}
            };

            personas.InsertOne(doc);

            return "S";
        }
        else
        {
            return "N";
        }
    }

    public void insertPrestamoPersona(string id, DateTime fecha, int saldoInicial)
    {
        IMongoDatabase db = dbClient.GetDatabase(bd);

        var prestamoPersonas = db.GetCollection<BsonDocument>("PrestamoPersona");

        var filter = "{ $and: [{ identificacion: '" + id + "' }]}";

        List<BsonDocument> bsonArray = prestamoPersonas.Find(filter).ToList();

        var doc = new BsonDocument
            {
                {"identificacion", id},
                {"IDPR", (bsonArray.Count + 1).ToString()},
                {"fecha", fecha },
                {"saldoInicial", saldoInicial},
                {"saldoActual", saldoInicial},
                {"estado", "A"},
            };

        prestamoPersonas.InsertOne(doc);
    }

    public void insertAbonoPrestamo(string id, string idpr, DateTime fecha, double saldoActual, int abono, int amortiza, int interes)
    {
        IMongoDatabase db = dbClient.GetDatabase(bd);

        var prestamoPersonas = db.GetCollection<BsonDocument>("AbonoPrestamo");
        var personas = db.GetCollection<BsonDocument>("PrestamoPersona");

        var doc = new BsonDocument
            {
                {"identificacion", id},
                {"IDPR", idpr},
                {"fecha", fecha },
                {"monto", abono},
                {"amortiza", amortiza},
                {"interes", interes},
            };

        prestamoPersonas.InsertOne(doc);

        var filter = "{ $and: [{ identificacion: '" + id + "' }, { IDPR: '" + idpr + "' }] }";

        var update = Builders<BsonDocument>.Update.Set("saldoActual", saldoActual-amortiza);

        personas.UpdateOne(filter, update);
    }
}