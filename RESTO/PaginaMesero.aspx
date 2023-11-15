<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PaginaMesero.aspx.cs" Inherits="RESTO.PaginaMesero" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Pagina de Meseros</h1>
    <br />
    <asp:Label ID="LblMesaAsignada" runat="server" Text="Mesa asignada: "></asp:Label>
    <asp:TextBox ID="TxtNumeroMesa" runat="server"></asp:TextBox>
    <asp:Button ID="BtnTomarPedido" runat="server" Text="Tomar Pedido" OnClick="BtnTomarPedido_Click" />

</asp:Content>
