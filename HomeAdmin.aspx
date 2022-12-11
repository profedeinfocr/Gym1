<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="HomeAdmin.aspx.cs" Inherits="Gym1.HomeAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            text-align: left;
        }
    .auto-style5 {
        width: 704px;
        height: 449px;
    }
        .auto-style6 {
            text-align: left;
            color: #FF0000;
        }
        .auto-style7 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        &nbsp;&nbsp;
        Usted ha ingresado como Administrador</p>
    <p>
        <img alt="" class="auto-style5" src="Imagenes/VariosUsuarios.png" /></p>
    <p class="auto-style4">
        &nbsp;&nbsp;
        email&nbsp;
        <asp:TextBox ID="Temail" runat="server" OnTextChanged="Temail_TextChanged"></asp:TextBox>
&nbsp;
    </p>
    <p class="auto-style4">
        &nbsp;&nbsp;
        Nombre
        <asp:TextBox ID="Tnombre" runat="server"></asp:TextBox>
&nbsp;
    </p>
    <p class="auto-style4">
        &nbsp;&nbsp;
        Apellidos&nbsp;
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
        Telefono&nbsp;
        <asp:TextBox ID="Ttelefono" runat="server"></asp:TextBox>
&nbsp;
    </p>
    <p class="auto-style4">
        &nbsp;&nbsp;
        Clave&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="Tclave" runat="server"></asp:TextBox>
&nbsp;&nbsp;
    </p>
    <p class="auto-style4">
        &nbsp;&nbsp; Tipo de Usuario&nbsp;
        <asp:TextBox ID="Ttipo" runat="server"></asp:TextBox>
    </p>
    <p class="auto-style4">
        &nbsp;&nbsp;
        Provincia
        <asp:DropDownList ID="DDLprovincia" runat="server" DataSourceID="SqlDataSource1" DataTextField="provincia" DataValueField="provincia" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Gym1ConnectionString %>" SelectCommand="SELECT * FROM [Provincias] ORDER BY [provincia]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p class="auto-style4">
        &nbsp;&nbsp;
        Canton&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DDLcanton" runat="server" DataSourceID="SqlDataSource2" DataTextField="canton" DataValueField="canton" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Gym1ConnectionString %>" SelectCommand="SELECT [canton] FROM [Cantones]">
        </asp:SqlDataSource>
    </p>
    <p class="auto-style4">
        &nbsp;&nbsp;
        Distrito&nbsp;&nbsp;
        <asp:DropDownList ID="DDLdistrito" runat="server" DataSourceID="SqlDataSource3" DataTextField="distrito" DataValueField="distrito" OnSelectedIndexChanged="DDLdistrito_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Gym1ConnectionString %>" SelectCommand="SELECT [distrito] FROM [Distritos]"></asp:SqlDataSource>
&nbsp;&nbsp;
    </p>
    <p class="auto-style4">
        &nbsp;&nbsp;
        Detalles
        <asp:TextBox ID="Tdetalle" runat="server" OnTextChanged="Tdetalle_TextChanged"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p class="auto-style4">
        &nbsp;</p>
    <p class="auto-style4">
        <asp:Button ID="Bagregar" runat="server" OnClick="Bagregar_Click" Text="Agregar" />
    &nbsp;&nbsp;
        <asp:Button ID="Bborrar" runat="server" OnClick="Bborrar_Click" Text="Borrar" />
&nbsp;&nbsp;
        <asp:Button ID="Bconsultar" runat="server" OnClick="Bconsultar_Click" Text="Consultar" />
&nbsp;&nbsp;
    </p>
    <p class="auto-style4">
        &nbsp;</p>
    <p class="auto-style4">
        &nbsp;&nbsp; <span class="auto-style7">Antes de Actualizar un usuario, use el botón Consultar para que se llenen todos los campos</span></p>
    <p class="auto-style6">
        &nbsp;&nbsp; con la información actual y prevenir errores</p>
    <p class="auto-style4">
        &nbsp;<asp:Button ID="Bactualizar" runat="server" OnClick="Bactualizar_Click" Text="Actualizar" />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        </asp:GridView>
    </p>
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
