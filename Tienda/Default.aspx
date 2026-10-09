<%@ Page Title="Tienda" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Tienda._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Tienda de informatica</h1>
    <p>Seleccione una operacion:</p>

    <p>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Alta.aspx">Alta de productos</asp:HyperLink>
    </p>

    <p>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Consulta.aspx">Consulta de productos</asp:HyperLink>
    </p>

    <p>
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Modificacion.aspx">Modificacion de productos</asp:HyperLink>
    </p>

    <p>
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Baja.aspx">Baja de productos</asp:HyperLink>
    </p>

</asp:Content>