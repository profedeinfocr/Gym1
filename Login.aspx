<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gym1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/Estilo.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 58px;
        }
        .auto-style2 {
            width: 216px;
            height: 270px;
        }
        .auto-style3 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style3">
            <br />
            <img alt="" class="auto-style2" src="Imagenes/Keysher0.jpg" /><br />
            KEYSHER&#39;S GYM<br />
            <br />
            <br />
            
            <ul class="auto-style1">

  <li><a href="Inicio.aspx">Inicio</a></li>
  <li><a href="Usuarios.aspx">Heredia</a></li>
  <li><a href="Administrador.aspx">Nació</a></li>
  <li><a href="Facturacion.aspx">Grande!</a></li>
  <li style="float:right"><a class="active" href="#about">About</a></li>
</ul>


            <br />
            <br />
            <br />


            Email<br />
            <asp:TextBox ID="Temail" runat="server"></asp:TextBox>
            <br />
            Clave<br />
            <asp:TextBox ID="Tclave" runat="server" OnTextChanged="Tclave_TextChanged"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
            <asp:Button ID="Bingresar" runat="server" Text="Ingresar" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:Label ID="lmensaje" runat="server" Text="*"></asp:Label>
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>