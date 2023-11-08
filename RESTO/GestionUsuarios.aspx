<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GestionUsuarios.aspx.cs" Inherits="RESTO.Gestion_Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <h2>Empleados</h2>

   <%-- <style> 
        .oculto{ 
            display: none;
        }

    </style>--%>

    <asp:GridView ID="dgvUsuario" runat="server" AutoGenerateColumns="false" DataKeyNames="IdUsuario" OnSelectedIndexChanged="dgvUsuario_SelectedIndexChanged" class="table table-dark table-striped">

        <columns>
           <%-- <asp:BoundField HeaderText="ID" DataField="IdUsuario" HeaderStyle-CssClass="oculto" ItemStyle-CssClass="oculto" />--%>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre"/>
            <asp:BoundField HeaderText="Apellido" DataField="Apellido"/>
            <asp:BoundField HeaderText="Dni" DataField="Dni"/>
            <asp:BoundField HeaderText="Fecha de creacion" DataField="FechaCreacion"/>
            <asp:BoundField HeaderText="Descripcion" DataField="Perfil.Descripcion"/>
            <asp:commandField ShowSelectButton="true" SelectText="Seleccionar" HeaderText="Accion"/>
        </columns>

    </asp:GridView>

    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
    <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" />
    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" Onclick="btnEliminar_Click"/>
    

</asp:Content>
