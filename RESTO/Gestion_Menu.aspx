<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Gestion_Menu.aspx.cs" Inherits="RESTO.Gestion_Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <h1>Menú</h1>
    
      

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      
        <ContentTemplate>
             <asp:DropDownList ID="ddlCategorias" runat="server" OnSelectedIndexChanged="ddlCategorias_SelectedIndexChanged" AutoPostBack="true"> </asp:DropDownList>

        <asp:GridView ID="dgvMenu" runat="server" AutoGenerateColumns="false" DataKeyNames="IdMenu" OnSelectedIndexChanged="dgvMenu_SelectedIndexChanged"  class="table table-dark table-striped">

            <columns>   
                <asp:BoundField HeaderText="Descripcion" DataField="Descripcion"/>
                <asp:BoundField HeaderText="Precio" DataField="Precio"/>
               <%-- <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion"/>--%>

                <asp:commandField ShowSelectButton="true" SelectText="Seleccionar" HeaderText="Accion"/>
            </columns>
        </asp:GridView>

            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click"  />
            <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click"  />
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
       
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
