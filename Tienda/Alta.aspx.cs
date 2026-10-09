using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Tienda
{
    public partial class Alta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
    }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (txtNombre.Text.Trim() == "" ||
                txtPrecio.Text.Trim() == "")
            {
                lblMensaje.Text = "Complete todos los campos.";
                return;
            }

            decimal precio;

            if (!decimal.TryParse(txtPrecio.Text, out precio) || precio < 0)
            {
                lblMensaje.Text = "Ingrese un precio valido.";
                return;
            }

            this.SqlDataSourceProductos.DataSourceMode =
                SqlDataSourceMode.DataReader;

            SqlDataReader datos;

            datos = (SqlDataReader)this.SqlDataSourceProductos.Select(
                DataSourceSelectArguments.Empty);

            int idProducto = 1;

            if (datos.Read())
            {
                if (datos[0] != DBNull.Value)
                {
                    idProducto = int.Parse(datos[0].ToString()) + 1;
                }
            }

            datos.Close();

            this.SqlDataSourceProductos.InsertParameters["idProducto"].DefaultValue =
                idProducto.ToString();

            this.SqlDataSourceProductos.InsertParameters["nombre"].DefaultValue =
                txtNombre.Text.Trim();

            this.SqlDataSourceProductos.InsertParameters["precio"].DefaultValue =
                precio.ToString(System.Globalization.CultureInfo.InvariantCulture);

            this.SqlDataSourceProductos.InsertParameters["idCategoria"].DefaultValue =
                ddlCategoria.SelectedValue;

            int filas = this.SqlDataSourceProductos.Insert();

            if (filas > 0)
            {
                lblMensaje.Text = "Producto agregado correctamente.";

                txtNombre.Text = "";
                txtPrecio.Text = "";
            }
            else
            {
                lblMensaje.Text = "No se pudo agregar el producto.";
            }
        }
    }
}
