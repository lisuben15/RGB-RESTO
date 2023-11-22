﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="RESTO.Reporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            text-align: center;
        }
            

        .container {
            max-width: 800px;
            margin: 10px;
            padding: 20px;
        }

        h1 {
            margin-bottom: 20px;
        }

        section {
            display: flex;
            flex-direction: column;
            gap: 30px;
        }

        .scrollable-grid {
            width: 60%;
            border-collapse: collapse;
            max-width: 700px;
            margin: 0 auto; 
        }

        .scrollable-grid th,
        .scrollable-grid td {
            padding: 8px;
            border: 1px solid #ddd;
        }

        .scrollable-grid th {
            background-color: #333;
            color: #fff;
            position: sticky;
            top: 0;
        }

        .scrollable-container {
            overflow-y: auto;
            max-height: 300px;
            overflow-x: hidden;
            position: relative;
            margin-right: -10px;
        }

        .scrollable-container::-webkit-scrollbar {
            display: none;
        }
        .scrollable-container:hover::-webkit-scrollbar {
        display: block;
        }
        .scrollable-container::-webkit-scrollbar-thumb {
            background-color: #888;
            border-radius: 10px;
        }

        .scrollable-container::-webkit-scrollbar-track {
            background-color: #f4f4f4;
        }

        .total-label {
            font-size: 18px;
            color: #333;
        }

        h2
         {
            margin: 0 auto 20px;
            text-align: center;
            max-width: 80%;
            color: black;
            text-shadow: 2px 2px 2px rgba(255, 255, 255, 0.5); 
        }
         h4 {
         color: black;
          text-shadow: 2px 2px 2px rgba(255, 255, 255, 0.5); /* Sombra para efecto 3D */
        }   


    </style>
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
            <section>
                <div class="scrollable-container">
                    <asp:GridView ID="dgvReporte" runat="server" AutoGenerateColumns="false" CssClass="table table-dark table-striped scrollable-grid">
                        <Columns>
                            <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                            <asp:BoundField HeaderText="Precio" DataField="Precio" />
                        </Columns>
                    </asp:GridView>
                </div>
                <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label> 
            </section>
        </div>
        <div>
            <asp:Label ID="lblFacturacion" runat="server" Text="Facturación del dia $: " style="font-size: 30px; color: white;"></asp:Label>
            <asp:Label ID="lblTotalFacturacion" runat="server" Text="$ 0.00" style="font-size: 30px; color: white;"></asp:Label>
        </div>
    </section>
</asp:Content>
