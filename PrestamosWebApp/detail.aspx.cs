using Prestamos.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prestamos
{
    public partial class detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.QueryString["oiasdomejsof"];

            if (!string.IsNullOrEmpty(id))
            {
                Database dt = new Database();
                List<Personas> personas = new List<Personas>();

                if (!string.IsNullOrEmpty(id))
                {
                    personas = dt.getPersonasByExactField("identificacion", id);
                }

                repPersonas.DataSource = personas;
                repPersonas.DataBind();

                List<PrestamoPersona> prestamos = new List<PrestamoPersona>();

                prestamos = dt.getPrestamoPersona(id);

                repPrestamos.DataSource = prestamos;
                repPrestamos.DataBind();
            }
        }
    }
}