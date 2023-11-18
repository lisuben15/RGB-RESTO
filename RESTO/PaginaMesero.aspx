<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PaginaMesero.aspx.cs" Inherits="RESTO.PaginaMesero" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Mesas asignadas</h1>
    <br />

    <div class="card-container row row-cols-1 row-cols-md-4 g-3 mt-4">
        <asp:Repeater ID="Repetidor" runat="server">
            <ItemTemplate>
                <div class="col">

                    <asp:Button class='<%#"boton-moderno " + Eval("Estado.Descripcion") %>' ID="btnMesa" runat="server" Text='<%#"Mesa " + Eval("NumeroMesa") %>' CommandArgument='<%#Eval("NumeroMesa") %>' CommandName="NumeroMesa"  OnClick="btnMesa_Click" />

                </div>
            </ItemTemplate>
        </asp:Repeater>
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
