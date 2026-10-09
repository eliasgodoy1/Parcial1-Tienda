<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modificacion.aspx.cs" Inherits="Tienda.Modificacion" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Modificacion de productos</h2>

    <p>
        Seleccionar producto:
        <asp:DropDownList ID="ddlProducto" runat="server"
            DataSourceID="SqlDataSourceProductos"
            DataTextField="nombre"
            DataValueField="idProducto">
        </asp:DropDownList>

        <asp:Button ID="btnBuscar" runat="server"
            Text="Cargar producto"
            OnClick="btnBuscar_Click" />
    </p>

    <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server"
        ConnectionString="<%$ ConnectionStrings:TiendaConnectionString %>"
        SelectCommand="SELECT idProducto, nombre FROM productos">
    </asp:SqlDataSource>

    <p>
        Nombre:
        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
    </p>

    <p>
        Precio:
        <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
    </p>

    <p>
        Categoría:
        <asp:DropDownList ID="ddlCategoria" runat="server"
            DataSourceID="SqlDataSourceCategorias"
            DataTextField="descripcion"
            DataValueField="idCategoria">
        </asp:DropDownList>
    </p>

    <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server"
        ConnectionString="<%$ ConnectionStrings:TiendaConnectionString %>"
        SelectCommand="SELECT idCategoria, descripcion FROM categorias">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceModificar" runat="server"
        ConnectionString="<%$ ConnectionStrings:TiendaConnectionString %>"
        SelectCommand="SELECT idProducto, nombre, precio, idCategoria FROM productos WHERE idProducto = @idProducto"
        UpdateCommand="UPDATE productos SET nombre = @nombre, precio = @precio, idCategoria = @idCategoria WHERE idProducto = @idProducto">

        <SelectParameters>
            <asp:Parameter Name="idProducto" Type="Int32" />
        </SelectParameters>

        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="precio" Type="Decimal" />
            <asp:Parameter Name="idCategoria" Type="Int32" />
            <asp:Parameter Name="idProducto" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>

    <p>
        <asp:Button ID="btnModificar" runat="server"
            Text="Guardar cambios"
            OnClick="btnModificar_Click" />
    </p>

    <asp:Label ID="lblMensaje" runat="server"></asp:Label>

    <p>
        <asp:HyperLink ID="hlInicio" runat="server"
            NavigateUrl="~/Default.aspx"
            Text="Volver al inicio">
        </asp:HyperLink>
    </p>

</asp:Content>


