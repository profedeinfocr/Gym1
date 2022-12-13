<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="HomeRegular.aspx.cs" Inherits="Gym1.HomeRegular" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            text-align: left;
        }
        .auto-style8 {
            width: 681px;
            height: 470px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;
        Lucha cada día por una mejor version de ti mismo!</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<img alt="" class="auto-style8" src="Imagenes/MejorVersionPropia.png" /></p>
    <p class="auto-style4">
        &nbsp;&nbsp;
        email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="Temail" runat="server" OnTextChanged="Temail_TextChanged"></asp:TextBox>
&nbsp;
    </p>
    <p class="auto-style4">
        &nbsp;&nbsp;
        Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="Tnombre" runat="server"></asp:TextBox>
&nbsp;
    </p>
    <p class="auto-style4">
        &nbsp;&nbsp;
        Apellidos&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="Tapellidos" runat="server"></asp:TextBox>
&nbsp;
    </p>
    <p class="auto-style4">
        &nbsp;&nbsp;
        Fecha Nacimiento&nbsp;
        <asp:TextBox ID="TfechaN" runat="server"></asp:TextBox>
&nbsp;
    </p>
    <p class="auto-style4">
        &nbsp;&nbsp;
        Telefono&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="Ttelefono" runat="server"></asp:TextBox>
&nbsp;
    </p>
    <p class="auto-style4">
        &nbsp;&nbsp;
        Clave&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="Tclave" runat="server"></asp:TextBox>
&nbsp;&nbsp;
    </p>
    <p class="auto-style4">
        &nbsp;&nbsp; &nbsp;Provincia&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DDLprovincia" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="provincia" DataValueField="provincia">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Gym1ConnectionString %>" SelectCommand="SELECT [provincia] FROM [Provincias]"></asp:SqlDataSource>
    </p>
    <p class="auto-style4">
        &nbsp;&nbsp;&nbsp; Canton&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DDLcanton" runat="server" DataSourceID="SqlDataSource2" DataTextField="canton" DataValueField="canton">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Gym1ConnectionString %>" SelectCommand="SELECT [canton] FROM [Cantones]"></asp:SqlDataSource>
&nbsp;&nbsp; &nbsp;</p>
    <p class="auto-style4">
        &nbsp;&nbsp;&nbsp; Distrito&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DDLdistrito" runat="server" DataSourceID="SqlDataSource3" DataTextField="distrito" DataValueField="distrito">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Gym1ConnectionString %>" SelectCommand="SELECT [distrito] FROM [Distritos]"></asp:SqlDataSource>
&nbsp; &nbsp;</p>
    <p class="auto-style4">
        &nbsp;&nbsp;&nbsp; Detalle&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="Tdetalle" runat="server"></asp:TextBox>
    </p>
    <p class="auto-style4">
        <asp:Button ID="Bactualizar" runat="server" Text="Actualizar Datos" OnClick="Bactualizar_Click" />
    </p>
    <p class="auto-style4">
        &nbsp;</p>
    <p class="auto-style4">
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>