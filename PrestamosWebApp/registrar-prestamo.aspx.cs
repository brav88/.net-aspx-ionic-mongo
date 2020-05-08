using Prestamos.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prestamos
{
    public partial class registrar_prestamo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.QueryString["oiasdomejsof"];

            txtFecha.Text = DateTime.Now.ToString("dd-MMMM-yyyy");

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
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Database dt = new Database();

            var id = this.Request.Form["txtId"];            
            DateTime fecha = Convert.ToDateTime(txtFecha.Text);
            int saldoInicial = Convert.ToInt32(this.Request.Form["txtMonto"]);

            dt.insertPrestamoPersona(id, fecha, saldoInicial);

            Response.Redirect("detail.aspx?oiasdomejsof=" + id + "");
        }
    }
}