<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Alta.aspx.cs" Inherits="Tienda.Alta" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<h2>Alta de productos</h2>

<p>
    Nombre del producto:
    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
</p>

<p>
    Precio:
    <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
</p>

<p>
    Categoria:
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

<asp:SqlDataSource ID="SqlDataSourceProductos" runat="server"
    ConnectionString="<%$ ConnectionStrings:TiendaConnectionString %>"
    SelectCommand="SELECT MAX(idProducto) FROM productos"
    InsertCommand="INSERT INTO productos (idProducto, nombre, precio, idCategoria) VALUES (@idProducto, @nombre, @precio, @idCategoria)">

    <InsertParameters>
        <asp:Parameter Name="idProducto" Type="Int32" />
        <asp:Parameter Name="nombre" Type="String" />
        <asp:Parameter Name="precio" Type="Decimal" />
        <asp:Parameter Name="idCategoria" Type="Int32" />
    </InsertParameters>
</asp:SqlDataSource>

<p>
    <asp:Button ID="btnConfirmar" runat="server"
        Text="Confirmar" OnClick="btnConfirmar_Click" />
</p>

<asp:Label ID="lblMensaje" runat="server"></asp:Label>

<p>
    <asp:HyperLink ID="hlInicio" runat="server"
        NavigateUrl="~/Default.aspx"
        Text="Volver al inicio">
    </asp:HyperLink>
</p>
</asp:Content>

