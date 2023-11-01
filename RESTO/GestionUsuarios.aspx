<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GestionUsuarios.aspx.cs" Inherits="RESTO.Gestion_Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <h2>Listado de usuarios</h2>

    <asp:GridView ID="dgvUsuario" runat="server" AutoGenerateColumns="false" class="table table-dark table-striped">

        <columns>

            <asp:BoundField HeaderText="Nombre" DataField="Nombre"/>
            <asp:BoundField HeaderText="Apellido" DataField="Apellido"/>
            <asp:BoundField HeaderText="Dni" DataField="Dni"/>
            <asp:BoundField HeaderText="Fecha de creacion" DataField="FechaCreacion"/>
            <asp:BoundField HeaderText="Descripcion" DataField="Perfil.Descripcion"/>

        </columns>

    </asp:GridView>

    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" />
    <asp:Button ID="btnModificar" runat="server" Text="Modificar" />
    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" />
    

</asp:Content>
