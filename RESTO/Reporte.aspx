<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="RESTO.Reporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h1>Reporte</h1>

    <asp:DropDownList ID="ddlReporte" runat="server" OnSelectedIndexChanged="ddlReporte_SelectedIndexChanged" AutoPostBack="true" style="margin-bottom: 20px;"></asp:DropDownList>
    <asp:DropDownList ID="ddlReporteMesa" runat="server" OnSelectedIndexChanged="ddlReporteMesa_SelectedIndexChanged" AutoPostBack="true" style="margin-bottom: 20px;"></asp:DropDownList>
    <br />



    <asp:GridView ID="dgvReporte" runat="server" AutoGenerateColumns="false"  class="table table-dark table-striped" style="width: 80%;">
        <Columns>   
            <asp:BoundField HeaderText="Descripcion" DataField="Descripcion"/>
            <asp:BoundField HeaderText="Precio" DataField="Precio"/>
        </Columns>
    </asp:GridView>
    <asp:Label ID="lblTotal" runat="server" Text="Total $: " style="font-size: 30px; color: white;"></asp:Label>
    <asp:TextBox ID="txtTotal" runat="server" style="margin-left: 10px;width: 100px;" ></asp:TextBox>

</asp:Content>
