using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tienda
{
    public partial class Modificacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlProducto.DataBind();
                ddlCategoria.DataBind();
                CargarProducto();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarProducto();
        }

        private void CargarProducto()
        {
            if (ddlProducto.Items.Count == 0)
            {
                lblMensaje.Text = "No hay productos para modificar.";
                return;
            }

            SqlDataSourceModificar.DataSourceMode =
                SqlDataSourceMode.DataReader;

            SqlDataSourceModificar.SelectParameters["idProducto"].DefaultValue =
                ddlProducto.SelectedValue;

            SqlDataReader datos = (SqlDataReader)
                SqlDataSourceModificar.Select(
                    DataSourceSelectArguments.Empty);

            if (datos == null)
            {
                lblMensaje.Text = "No se pudo consultar el producto.";
                return;
            }

            if (datos.Read())
            {
                txtNombre.Text = datos["nombre"].ToString();
                txtPrecio.Text = datos["precio"].ToString();

                ddlCategoria.SelectedValue =
                    datos["idCategoria"].ToString();

                lblMensaje.Text = "";
            }
            else
            {
                lblMensaje.Text =
                    "No se encontro el producto seleccionado.";
            }

            datos.Close();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (ddlProducto.Items.Count == 0)
            {
                lblMensaje.Text = "No hay productos para modificar.";
                return;
            }

            SqlDataSourceModificar.DataSourceMode =
                SqlDataSourceMode.DataReader;

            SqlDataSourceModificar.SelectParameters["idProducto"].DefaultValue =
                ddlProducto.SelectedValue;

            SqlDataReader datos = (SqlDataReader)
                SqlDataSourceModificar.Select(
                    DataSourceSelectArguments.Empty);

            if (datos == null)
            {
                lblMensaje.Text =
                    "No se pudieron consultar los datos actuales.";
                return;
            }

            if (!datos.Read())
            {
                datos.Close();
                lblMensaje.Text = "No se encontro el producto.";
                return;
            }

            string nombreAnterior =
                datos["nombre"].ToString();

            string precioAnterior =
                datos["precio"].ToString();

            string categoriaAnterior =
                datos["idCategoria"].ToString();

            datos.Close();

            bool cambio =
                txtNombre.Text != nombreAnterior ||
                txtPrecio.Text != precioAnterior ||
                ddlCategoria.SelectedValue != categoriaAnterior;

            if (!cambio)
            {
                lblMensaje.Text =
                    "Debe modificar al menos un campo.";
                return;
            }

            SqlDataSourceModificar.UpdateParameters["nombre"].DefaultValue =
                txtNombre.Text;

            SqlDataSourceModificar.UpdateParameters["precio"].DefaultValue =
                txtPrecio.Text;

            SqlDataSourceModificar.UpdateParameters["idCategoria"].DefaultValue =
                ddlCategoria.SelectedValue;

            SqlDataSourceModificar.UpdateParameters["idProducto"].DefaultValue =
                ddlProducto.SelectedValue;

            int filas = SqlDataSourceModificar.Update();

            if (filas > 0)
            {
                CargarProducto();

                lblMensaje.Text =
                    "Producto modificado correctamente.";
            }
            else
            {
                lblMensaje.Text =
                    "No se modifico ningún producto.";
            }
        }
    }
}





