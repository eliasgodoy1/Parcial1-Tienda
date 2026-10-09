<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" Inherits="Tienda.Consulta" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Consulta de productos</h2>

    <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server"
        ConnectionString="<%$ ConnectionStrings:TiendaConnectionString %>"
        SelectCommand="SELECT p.idProducto, p.nombre, p.precio, c.descripcion FROM productos AS p INNER JOIN categorias AS c ON p.idCategoria = c.idCategoria">
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server"
        DataSourceID="SqlDataSourceProductos"
        AutoGenerateColumns="True">
    </asp:GridView>

    <p>
        <asp:HyperLink ID="hlInicio" runat="server"
            NavigateUrl="~/Default.aspx"
            Text="Volver al inicio">
        </asp:HyperLink>
    </p>

</asp:Content>

