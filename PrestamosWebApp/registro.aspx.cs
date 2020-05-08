using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prestamos
{
    public partial class registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {            
            Database dt = new Database();
            TextInfo ti = CultureInfo.CurrentCulture.TextInfo;

            var id = this.Request.Form["txtId"];
            var nombre = ti.ToTitleCase(this.Request.Form["txtNombre"].ToString().ToLower());
            var telefono = this.Request.Form["txtTelefono"];
            var direccion = this.Request.Form["txtDireccion"];

            string res = dt.insertPersona(id, nombre, telefono, direccion);

            if (res == "S")
            {
                Response.Redirect("detail.aspx?oiasdomejsof=" + id + "");
            }
            if (res == "N")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showMessage('Error','Esta identificacion ya existe')", true);
            }            
        }
    }
}