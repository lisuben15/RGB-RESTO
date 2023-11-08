<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AgregarMenu.aspx.cs" Inherits="RESTO.AgregarMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1> Pagina de agregado de menu</h1>

    <div>   
<asp:Label ID="lblDescripcion" runat="server" Text="Descripcion: "></asp:Label>
    <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>
</div>

<div>  
<asp:Label ID="lblPrecio" runat="server" Text="Precio: "></asp:Label>
    <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
</div>

<div>
    <asp:DropDownList ID="ddlOpciones" runat="server">   
    <asp:ListItem Text="Comida" Value="1" />
    <asp:ListItem Text="Bebida" Value="2" />
    <asp:ListItem Text="Postre" Value="3" />
   </asp:DropDownList>
</div>

<div>   
<asp:Label ID="lblRequiereStock" runat="server" Text="Requiere Stock: "></asp:Label>
    <asp:TextBox ID="txtRequiereStock" runat="server"></asp:TextBox>
</div>

<div>   
<asp:Label ID="LblStock" runat="server" Text="Stock: "></asp:Label>
    <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
</div>


<asp:Button ID="btnAgregar" runat="server" Text="Agregar"  CssClass="styled-button" OnClick="btnAgregar_Click" />


   

</asp:Content>
