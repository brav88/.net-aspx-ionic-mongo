using System;
using Prestamos.Entidades;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrestamosWebApp
{
    public partial class registrar_pago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.QueryString["oiasdomejsof"];
            var idpr = Request.QueryString["sfgergrs"];

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

                List<PrestamoPersona> prestamos = new List<PrestamoPersona>();

                prestamos = dt.getPrestamoPersonaByIdpr(id, idpr);

                repPrestamos.DataSource = prestamos;
                repPrestamos.DataBind();
            }
        }

        protected void btnAbonar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.Request.Form["txtAbono"]) ||
                string.IsNullOrEmpty(this.Request.Form["txtAmortiza"]) ||
                string.IsNullOrEmpty(this.Request.Form["txtInteres"]))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showMessage('Error', 'Campos requeridos')", true);
                return;
            }

            Database dt = new Database();
            var id = this.Request.Form["txtId"];
            var idpr = this.Request.Form["txtIdPr"];
            DateTime fecha = Convert.ToDateTime(txtFecha.Text);
            double saldoActual = Convert.ToDouble(this.Request.Form["txtSaldoActual"]);
            int abono = Convert.ToInt32(this.Request.Form["txtAbono"]);
            int amortiza = Convert.ToInt32(this.Request.Form["txtAmortiza"]);
            int interes = Convert.ToInt32(this.Request.Form["txtInteres"]);

            if ((amortiza + interes) != abono)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showMessage('Error','Montos no coinciden')", true);
                return;
            }

            dt.insertAbonoPrestamo(id, idpr, fecha, saldoActual, abono, amortiza, interes);

            Response.Redirect("detail.aspx?oiasdomejsof=" + id + "");
        }
    }
}