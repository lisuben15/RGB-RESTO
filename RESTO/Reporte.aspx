<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="RESTO.Reporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h1>Reportes</h1>

    <section style="display: flex; flex-direction: column; gap: 30px;">
    <div>
        <h4>Reporte diario por mesero</h4>
        <asp:DropDownList ID="ddlReporte" runat="server" OnSelectedIndexChanged="ddlReporte_SelectedIndexChanged" AutoPostBack="true" style="margin-bottom: 20px;"></asp:DropDownList>
        <h4>Reporte diario por mesa</h4>
        <asp:DropDownList ID="ddlReporteMesa" runat="server" OnSelectedIndexChanged="ddlReporteMesa_SelectedIndexChanged" AutoPostBack="true" style="margin-bottom: 20px;"></asp:DropDownList>
        <h2>Pedidos tomados</h2>
        <asp:GridView ID="dgvReporte" runat="server" AutoGenerateColumns="false"  class="table table-dark table-striped" style="width: 80%;">
            <Columns>   
                <asp:BoundField HeaderText="Descripción" DataField="Descripcion"/>
                <asp:BoundField HeaderText="Precio" DataField="Precio"/>
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label> 
    </div>
    <div>
        <asp:Label ID="lblFacturacion" runat="server" Text="Facturación del dia $: " style="font-size: 30px; color: white;"></asp:Label>
        <asp:Label ID="lblTotalFacturacion" runat="server" Text="$ 0.00" style="font-size: 30px; color: white;"></asp:Label>
    </div>
    </section>

</asp:Content>
