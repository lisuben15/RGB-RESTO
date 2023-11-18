<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PaginaMesero.aspx.cs" Inherits="RESTO.PaginaMesero" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="text-center">Mesas asignadas</h1>
        <br />

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
    </div>

    <style>
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
    </style>

</asp:Content>
