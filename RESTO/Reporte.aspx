<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="RESTO.Reporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h1>Reporte</h1>

    <asp:DropDownList ID="ddlReporte" runat="server" OnSelectedIndexChanged="ddlReporte_SelectedIndexChanged" AutoPostBack="true"> </asp:DropDownList>

    <asp:GridView ID="dgvReporte" runat="server" AutoGenerateColumns="false" DataKeyNames="IdMenu" class="table table-dark table-striped" style="width: 250%;">
        <Columns>   
        <asp:BoundField HeaderText="Descripcion" DataField="Descripcion"/>
        <asp:BoundField HeaderText="Precio" DataField="Precio"/>
        </Columns>
    </asp:GridView>
    <asp:Label ID="lblTotal" runat="server" Text="Total: "></asp:Label>
    <asp:TextBox ID="txtTotal" runat="server"></asp:TextBox>


</asp:Content>
