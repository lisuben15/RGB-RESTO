<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="RESTO.Reporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h1>Reporte</h1>

    <asp:DropDownList ID="ddlReporte" runat="server" OnSelectedIndexChanged="ddlReporte_SelectedIndexChanged" AutoPostBack="true" style="margin-bottom: 20px;"></asp:DropDownList>
    <br />


    <asp:GridView ID="dgvReporte" runat="server" AutoGenerateColumns="false" DataKeyNames="IdMenu" class="table table-dark table-striped" style="width: 80%;">
        <Columns>   
            <asp:BoundField HeaderText="Fecha" DataField="Fecha"/>
            <asp:BoundField HeaderText="Monto" DataField="Monto"/>
        </Columns>
    </asp:GridView>


    <asp:Label ID="lblFacturacion" runat="server" Text="Facturación del dia $: " style="font-size: 30px; color: white;"></asp:Label>
    <asp:Label ID="lblTotal" runat="server" Text="$ 0.00" style="font-size: 30px; color: white;"></asp:Label>
    

</asp:Content>
