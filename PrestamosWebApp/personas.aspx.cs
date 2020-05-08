using Prestamos.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prestamos
{
    public partial class personas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Database dt = new Database();
            List<Personas> personas = new List<Personas>();

            personas = dt.getPersonas();

            repPersonas.DataSource = personas;
            repPersonas.DataBind();
        }
    }
}