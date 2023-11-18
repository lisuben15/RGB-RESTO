<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GestionMesa.aspx.cs" Inherits="RESTO.GestionMesa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <h1>RGB Resto</h1>

     <div style="display: flex; align-items: flex-start; flex-direction: column">
     <div style="margin-right: 20px; display: flex;">
         <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" CssClass="boton-moderno" />
        <%-- <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" CssClass="boton-moderno" />--%>
         <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" CssClass="boton-moderno" />
         <asp:Button ID="btnAsignarMesa" runat="server" Text="Asignar Mesa" OnClick="btnAsignarMesa_Click" CssClass="boton-moderno"/>
         <asp:Button ID="btnDesasignarMesa" runat="server" Text="Desasignar Mesa" OnClick="btnDesasignarMesa_Click" CssClass="boton-moderno"/>
         <asp:Button ID="btnDesasignarMesas" runat="server" Text="Desasignar Mesas" OnClick="btnDesasignarMesas_Click" CssClass="boton-moderno"/>

     </div>
         <div>
                 <asp:GridView ID="dgvMesa" runat="server" AutoGenerateColumns="false" DataKeyNames="NumeroMesa" OnSelectedIndexChanged="dgvMesa_SelectedIndexChanged" class="table table-dark table-striped" style="width: 250%;">
                <Columns>   
                    <asp:BoundField HeaderText="Número de mesa" DataField="NumeroMesa"/>
                    <asp:BoundField HeaderText="Estado" DataField="Estado.Descripcion"/> 
                    <asp:BoundField HeaderText="Mesero" DataField="IdUsuario"/> 
                    <asp:BoundField HeaderText="Fecha Reserva" DataField="FechaReserva"/> 

            
                    <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" HeaderText="Accion"/>
                </Columns>
            </asp:GridView>

         </div>
          
         
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

     .table {
         margin: 0 auto;
     }
 </style>



    
        

</asp:Content>
