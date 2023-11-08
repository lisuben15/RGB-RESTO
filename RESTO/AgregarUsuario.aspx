<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AgregarUsuario.aspx.cs" Inherits="RESTO.AgregarUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1> Agregar usuario </h1>

    <div>   
    <asp:Label ID="lblNombre" runat="server" Text="Nombre: "></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
    </div>

    <div>  
    <asp:Label ID="lblApellido" runat="server" Text="Apellido: "></asp:Label>
        <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
    </div>

    <div>   
    <asp:Label ID="lblDNI" runat="server" Text="Dni: "></asp:Label>
        <asp:TextBox ID="txtDni" runat="server"></asp:TextBox>
    </div>

    <div>
        <asp:DropDownList ID="ddlOpciones" runat="server">   
        <asp:ListItem Text="Gerente" Value="1" />
        <asp:ListItem Text="Mesero" Value="2" />
       </asp:DropDownList>

    </div>

    <asp:Button ID="btnAgregar" runat="server" Text="Agregar"  CssClass="styled-button" OnClick="btnAgregar_Click"/>

    
   




</asp:Content>
