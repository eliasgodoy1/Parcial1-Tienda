<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Baja.aspx.cs" Inherits="Tienda.Baja" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<h2>Baja de productos</h2>

<p>
    Seleccionar producto:
    <asp:DropDownList ID="ddlProducto" runat="server"
        DataSourceID="SqlDataSourceProductos"
        DataTextField="nombre"
        DataValueField="idProducto">
    </asp:DropDownList>
</p>

<asp:SqlDataSource ID="SqlDataSourceProductos" runat="server"
    ConnectionString="<%$ ConnectionStrings:TiendaConnectionString %>"
    SelectCommand="SELECT idProducto, nombre FROM productos">
</asp:SqlDataSource>

<p>
    <asp:Button ID="btnEliminar" runat="server"
        Text="Eliminar producto"
        OnClick="btnEliminar_Click" />
</p>

<p>
    <asp:Button ID="btnConfirmar" runat="server"
        Text="Sí, eliminar"
        OnClick="btnConfirmar_Click"
        Visible="False" />

    <asp:Button ID="btnCancelar" runat="server"
        Text="Cancelar"
        OnClick="btnCancelar_Click"
        Visible="False" />
</p>

<asp:SqlDataSource ID="SqlDataSourceBaja" runat="server"
    ConnectionString="<%$ ConnectionStrings:TiendaConnectionString %>"
    DeleteCommand="DELETE FROM productos WHERE idProducto = @idProducto">

    <DeleteParameters>
        <asp:Parameter Name="idProducto" Type="Int32" />
    </DeleteParameters>

</asp:SqlDataSource>

<p>
    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
</p>

<p>
    <asp:HyperLink ID="hlInicio" runat="server"
        NavigateUrl="~/Default.aspx"
        Text="Volver al inicio">
    </asp:HyperLink>
</p>
</asp:Content>

