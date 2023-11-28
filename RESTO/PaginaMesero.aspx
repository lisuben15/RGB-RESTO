<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PaginaMesero.aspx.cs" Inherits="RESTO.PaginaMesero" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <h1 class="text-center">Mesas asignadas</h1>    
        <table>
            <tr>
                <td> 
                     <h3> RESERVAR </h3>
                     <div class="reserva-container">
                         <div style="display: flex; flex-direction: column; gap: 30px;">
                             <asp:DropDownList ID="ddlSeleccionMesa" runat="server" AutoPostBack="true" style="margin-bottom: 20px;"></asp:DropDownList>
                             <asp:Calendar ID="Calendario" runat="server"></asp:Calendar>
                         </div>
                         <div style="display: flex; flex-direction: column; gap: 30px;">
                              <asp:Label ID="lblHora" runat="server" Text="Hora"></asp:Label>
                              <asp:TextBox ID="txtHora" runat="server"></asp:TextBox>

                              <asp:Label ID="lblMinutos" runat="server" Text="Minutos"></asp:Label>
                              <asp:TextBox ID="txtMinutos" runat="server"></asp:TextBox>

                               <asp:Label ID="lblCliente" runat="server" Text="DNI DEL CLIENTE: "></asp:Label>
                               <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>

                              <asp:Button ID="btnReservar" runat="server" Text="Reservar" OnClick="btnReservar_Click" />
                         </div>
                         <asp:Label CssClass="error" ID="lblMensajeValidacion" runat="server" Text=""></asp:Label>
                         <asp:Label CssClass="exito" ID="lblMensajeExitoso" runat="server" Text=""></asp:Label>

                     </div>

                </td>              
                <td> 
                      <h3> RESERVAS DE HOY </h3>                   
                         <asp:GridView ID="dgvReservas" runat="server"  class="table table-dark table-striped scrollable-grid" style="width: 250%;">
                            <Columns>                             
                            </Columns>
                        </asp:GridView>
                   
                </td>
            </tr>
        </table>

      

        <div class="card-container row row-cols-1 row-cols-md-4 g-3 mt-4">
            <asp:Repeater ID="Repetidor" runat="server">
                <ItemTemplate>
                    <div class="col-6 col-md-3 mb-3">
                        <div class="d-flex flex-column align-items-center">
                            <div class="mesa mb-2">
                                <img src="https://tse1.mm.bing.net/th?id=OIP.tfNeweScwwLf1x8y7iNgDAHaFF&pid=Api&P=0&h=180" alt="Mesa" class="icono-mesa" />
                            </div>
                            <asp:Button class='<%#"boton-moderno " + Eval("Estado.Descripcion") %>' ID="btnMesa" runat="server" Text='<%#"Mesa " + Eval("NumeroMesa") %>' CommandArgument='<%#Eval("NumeroMesa") %>' CommandName="NumeroMesa"  OnClick="btnMesa_Click" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <h2><asp:Literal runat="server" ID="ltNotify"/></h2>

    </div>

    <style>

        .reserva-container {
            display: flex;
            gap: 50px;
        }

        .error {
            color: red;
            font-size: 16px;
        }

        .exito {
            color: darkgreen;
            font-size: 16px;
        }

        .mesa {
            display: flex;
            align-items: center;
        }

        .icono-mesa {
            width: 250px; /* Ajusta el tamaño de la imagen según tu preferencia */
            height: 250px; /* Ajusta el tamaño de la imagen según tu preferencia */
            margin-bottom: 10px; /* Espacio entre la imagen y el botón */
        }

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

        .Ocupada {
            background: red;
        }

        .Reservada {
            background: yellow;
            color: darkslategrey;
        }

        .Libre {
            background: green;
        }
        h2{
            color:white;
            margin-left: 20px;
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

    </style>

</asp:Content>
