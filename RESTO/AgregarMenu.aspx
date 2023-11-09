<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AgregarMenu.aspx.cs" Inherits="RESTO.AgregarMenu" %>
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
            width: 20%; /* Ajusta el valor según tus necesidades (ahora es la mitad) */
            box-sizing: border-box;
            margin-bottom: 10px; /* Añadido para separar verticalmente los elementos */
            padding: 5px; /* Ajusta el valor según tus necesidades */
        }

        .submit-btn {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


         <h1> Pagina de agregado de menu</h1>

    <div class="form-group">
        <asp:Label ID="lblDescripcion" runat="server" Text="   Descripcion: "></asp:Label>
        <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>
    </div>

    <div class="form-group">
        <asp:Label ID="lblPrecio" runat="server" Text="  ** Precio **: "></asp:Label>
        <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
    </div>

    <div class="form-group">
        <asp:Label ID="lblOpciones" runat="server" Text="Tipo de Menú: "></asp:Label>
        <asp:DropDownList ID="ddlOpciones" runat="server">   
            <asp:ListItem Text="Comida" Value="1" />
            <asp:ListItem Text="Bebida" Value="2" />
            <asp:ListItem Text="Postre" Value="3" />
        </asp:DropDownList>
    </div>

    <div class="form-group">
        <asp:Label ID="lblRequiereStock" runat="server" Text="Requiere Stock: "></asp:Label>
        <asp:TextBox ID="txtRequiereStock" runat="server"></asp:TextBox>
    </div>

    <div class="form-group">
        <asp:Label ID="LblStock" runat="server" Text="   ** Stock **: "></asp:Label>
        <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
    </div>

    <div class="submit-btn">
        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="styled-button" OnClick="btnAgregar_Click" />
    </div>
</asp:Content>
