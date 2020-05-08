using Prestamos.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrestamosWebApp
{
    public partial class ver_pagos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Database dt = new Database();
            List<AbonoPrestamo> abonos = new List<AbonoPrestamo>();

            var id = Request.QueryString["oiasdomejsof"];
            var idpr = Request.QueryString["sfgergrs"];

            abonos = dt.getAbonoPrestamo(id, idpr);

            repAbonos.DataSource = abonos;
            repAbonos.DataBind();
        }
    }
}