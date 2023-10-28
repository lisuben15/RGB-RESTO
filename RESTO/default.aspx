<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="RESTO._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>RGB-Resto</title>
    <style>
        body {
            background-image: url('https://wallpaperaccess.com/full/3692914.jpg'); 
            background-size: cover; 
            background-repeat: no-repeat; 
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh; 
        }

        h1 {
            font-size: 90px;
            font-family: "Bradley Hand ITC", sans-serif;
            color: black; 
            text-shadow: 4px 4px 4px white;
        }
            

        .input-container {
            margin: 15px 0;
            display: flex;
            align-items: center;
            text-align: center; 
        }

        .input-label {
            width: 100px;
            font-size: 20px;
            color: white;
        }

        .styled-button {
            background-color: blue;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 135px;
            font-size: 18px;
            font-family: Arial, sans-serif;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <h1>RGB-Resto</h1>
        </div>
        <div class="input-container">
            <asp:Label ID="Label1" runat="server" Text="Usuario" CssClass="input-label"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" type="text"></asp:TextBox>
        </div>

        <div class="input-container">
            <asp:Label ID="Label2" runat="server" Text="Contraseña" CssClass="input-label"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" type="password"></asp:TextBox>
        </div>

        <div>
            <asp:Button ID="Button1" runat="server" Text="Ingresar" CssClass="styled-button" />
        </div>
    </form>
</body>
</html>
