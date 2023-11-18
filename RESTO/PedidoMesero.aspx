<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PedidoMesero.aspx.cs" Inherits="RESTO.PedidoMesero" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Pedidos de Meseros</h1>
    <br />

       <div style="margin-right: 20px;">
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click"  CssClass="boton-moderno" />
            <asp:Button ID="btnCerrarPedido" runat="server" Text="Cerrar Pedido" OnClick="btnCerrarPedido_Click"  CssClass="boton-moderno" />
            <asp:Button ID="btnCrearPedido" runat="server" Text="Crear Pedido" OnClick="btnCrearPedido_Click" CssClass="boton-moderno" />
       </div>
        <div>
           <asp:GridView ID="dgvMenuPedidos" runat="server" AutoGenerateColumns="false" DataKeyNames="IdMenu" OnSelectedIndexChanged="dgvMenuPedidos_SelectedIndexChanged" class="table table-dark table-striped" style="width: 48%; float: left">
               <Columns>   
                     <asp:BoundField HeaderText="Descripcion" DataField="Descripcion"/>
                     <asp:BoundField HeaderText="Precio" DataField="Precio"/>
                     <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion"/>

                     <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" HeaderText="Accion"/>
              </Columns>
           </asp:GridView>
            </div>
            <h3>Pedido</h3>
        <div>
             <asp:GridView ID="dgvPedido" runat="server" AutoGenerateColumns="false" class="table table-dark table-striped" style="width: 48%; float: right">
                 <Columns>   
                     <asp:BoundField HeaderText="Descripcion" DataField="Menu.Descripcion"/>
                     <asp:BoundField HeaderText="Precio" DataField="Menu.Precio"/>
                     <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" HeaderText="Accion"/>
                </Columns>
            </asp:GridView>
       </div>    
       <style>
    .boton-moderno {
        background-color: midnightblue;
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 4px;
    }

</style> 
</asp:Content>
