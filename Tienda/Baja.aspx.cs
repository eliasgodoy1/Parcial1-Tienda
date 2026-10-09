using System;
using System.Web.UI;

namespace Tienda
{
    public partial class Baja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlProducto.DataBind();
            }
        }
    protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (ddlProducto.Items.Count == 0)
            {
                lblMensaje.Text = "No hay productos para eliminar.";
                return;
            }

            lblMensaje.Text =
                "¿Estas seguro de eliminar el producto seleccionado?";

            btnEliminar.Visible = false;
            btnConfirmar.Visible = true;
            btnCancelar.Visible = true;
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (ddlProducto.Items.Count == 0)
            {
                lblMensaje.Text = "No hay productos para eliminar.";
                return;
            }

            SqlDataSourceBaja.DeleteParameters["idProducto"].DefaultValue =
                ddlProducto.SelectedValue;

            int filas = SqlDataSourceBaja.Delete();

            if (filas > 0)
            {
                lblMensaje.Text = "Producto eliminado correctamente.";
                ddlProducto.DataBind();
            }
            else
            {
                lblMensaje.Text = "No se pudo eliminar el producto.";
            }

            btnEliminar.Visible = true;
            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "Eliminacion cancelada.";

            btnEliminar.Visible = true;
            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;
        }
    }
}

