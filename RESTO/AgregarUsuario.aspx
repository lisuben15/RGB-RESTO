<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AgregarUsuario.aspx.cs" Inherits="RESTO.AgregarUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-group {
            text-align: center;
            margin-bottom: 10px;
        }

        .form-group label {
            display: inline-block;
            width: 100px; /* Ancho fijo para todas las etiquetas */
            text-align: right;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group select {
            width: 200px; /* Ancho fijo para las cajas de texto y el cuadro de lista */
            box-sizing: border-box;
            margin-bottom: 10px;
            padding: 5px;
        }

        .submit-btn {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1> Agregar usuario </h1>

    <div class="form-group">
        <asp:Label ID="lblNombre" runat="server" Text="Nombre: "></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
    </div>

    <div class="form-group">
        <asp:Label ID="lblApellido" runat="server" Text="Apellido: "></asp:Label>
        <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
    </div>

    <div class="form-group">
        <asp:Label ID="lblDNI" runat="server" Text="** Dni **: "></asp:Label>
        <asp:TextBox ID="txtDni" runat="server"></asp:TextBox>
    </div>

    <div class="form-group">
        <asp:Label ID="lblOpciones" runat="server" Text="** Rol**:"></asp:Label>
        <asp:DropDownList ID="ddlOpciones" runat="server">
            <asp:ListItem Text="Gerente" Value="1" />
            <asp:ListItem Text="Mesero" Value="2" />
        </asp:DropDownList>
    </div>

    

    <asp:Button ID="btnGuardar" runat="server" Text="Guardar"  CssClass="styled-button" OnClick="btnGuardar_Click"/>

    
   




</asp:Content>
