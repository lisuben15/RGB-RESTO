<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CambiarContrasenia.aspx.cs" Inherits="RESTO.CambiarContrasenia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="input-container">
        <asp:Label ID="Label1" runat="server" Text="Dni" CssClass="input-label"></asp:Label>
        <asp:TextBox ID="txtDNI" runat="server" type="text"></asp:TextBox>
    </div>
     <div class="input-container">
         <asp:Label ID="Label2" runat="server" Text="Nueva Contraseña" CssClass="input-label"></asp:Label>
         <asp:TextBox ID="txtPassword" runat="server" type="password"></asp:TextBox>
     </div>

    <div>
        <asp:Button ID="btnCambiarPass" runat="server" Text="Cambiar contraseña" OnClick="btnCambiarPass_Click"/>
    </div>
     


</asp:Content>
