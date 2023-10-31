<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GestionUsuarios.aspx.cs" Inherits="RESTO.Gestion_Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>ADMINISTRACIÓN</h1>

    <asp:GridView ID="dgvUsuario" style="width:100px; height:100px" runat="server"></asp:GridView>
    <asp:Button ID="btnAgregar" runat="server" Text="Button" />
    <asp:Button ID="btnModificar" runat="server" Text="Button" />
    <asp:Button ID="btnEliminar" runat="server" Text="Button" />
    

</asp:Content>
