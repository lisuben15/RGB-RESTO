<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PedidoMesero.aspx.cs" Inherits="RESTO.PedidoMesero" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Pedidos de Meseros</h1>
    <br />

       <div style="margin-right: 20px;">
           
            <asp:Button ID="btnCrearPedido" runat="server" Text="Crear Pedido" OnClick="btnCrearPedido_Click" CssClass="boton-moderno" />
            <asp:Button ID="btnCerrarPedido" runat="server" Text="Cerrar Pedido" OnClick="btnCerrarPedido_Click"  CssClass="boton-moderno" />
            <asp:Button ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click" CssClass="boton-moderno" />

       </div>

        <div>
           <asp:GridView ID="dgvMenuPedidos" runat="server" AutoGenerateColumns="false" DataKeyNames="IdMenu" OnSelectedIndexChanged="dgvMenuPedidos_SelectedIndexChanged" class="table table-dark table-striped" style="width: 48%; float: left">
               <Columns>   
                     <asp:BoundField HeaderText="Descripcion" DataField="Descripcion"/>
                     <asp:BoundField HeaderText="Precio" DataField="Precio"/>
                     <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion"/>

                     <asp:CommandField ShowSelectButton="true" SelectText="Agregar" HeaderText="Accion"/>
              </Columns>
           </asp:GridView>
            </div>
    <div style="display: flex; justify-content: space-between">
         <h2>Pedido: <asp:Label ID="lblIdPedido" runat="server"></asp:Label></h2> 
         <asp:Label CssClass="total" ID="lblTotal" runat="server" Text="$0.00" ></asp:Label>
    </div>
           
        <div>
             <asp:GridView ID="dgvPedido" runat="server" AutoGenerateColumns="false" DataKeyNames="IdDetallePedido" OnSelectedIndexChanged="dgvPedido_SelectedIndexChanged" class="table table-dark table-striped" style="width: 48%; float: right">
                 <Columns>   
                     <asp:BoundField HeaderText="IdMenu" DataField="Menu.IdMenu" Visible="false"/>
                     <asp:BoundField HeaderText="Descripcion" DataField="Menu.Descripcion"/>
                     <asp:BoundField HeaderText="Precio" DataField="Menu.Precio"/>
                     <asp:CommandField ShowSelectButton="true" SelectText="Quitar" HeaderText="Accion"  />
                </Columns>
            </asp:GridView>
       </div> 
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
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

    .total {
        color: deeppink;
        font-weight: 700;
        text-shadow: 2px 2px 3px black;
        font-size: 32px;
    }

</style> 
</asp:Content>
