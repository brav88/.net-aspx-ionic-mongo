using Prestamos.Entidades;
using System;
using System.Collections.Generic;

namespace Prestamos
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string userName = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Database dt = new Database();
            List<Personas> personas = new List<Personas>();

            var id = this.Request.Form["txtId"];
            var nombre = this.Request.Form["txtNombre"];

            if (!string.IsNullOrEmpty(id))
            {
                personas = dt.getPersonasByExactField("identificacion", id);
            }

            if(personas.Count == 0)
            {
                if (!string.IsNullOrEmpty(nombre))
                {
                    personas = dt.getPersonasByLikeField("nombre", nombre);
                }
            }

            repPersonas.DataSource = personas;
            repPersonas.DataBind();
        }
    }
}