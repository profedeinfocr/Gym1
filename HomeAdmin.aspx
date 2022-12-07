<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="HomeAdmin.aspx.cs" Inherits="Gym1.HomeAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Usted ha ingresado como Administrador<br />
        A continuación se presentan los datos de todos los usuarios actuales</p>
    <p>
        &nbsp;</p>
    <p class="auto-style4">
        email&nbsp;
        <asp:TextBox ID="Temail" runat="server" OnTextChanged="Temail_TextChanged"></asp:TextBox>
&nbsp;
    </p>
    <p class="auto-style4">
        Nombre
        <asp:TextBox ID="Tnombre" runat="server"></asp:TextBox>
&nbsp;
    </p>
    <p class="auto-style4">
        Apellidos&nbsp;
        <asp:TextBox ID="Tapellidos" runat="server"></asp:TextBox>
&nbsp;
    </p>
    <p class="auto-style4">
        Fecha Nacimiento&nbsp;
        <asp:TextBox ID="TfechaN" runat="server"></asp:TextBox>
&nbsp;
    </p>
    <p class="auto-style4">
        Telefono&nbsp;
        <asp:TextBox ID="Ttelefono" runat="server"></asp:TextBox>
&nbsp;
    </p>
    <p class="auto-style4">
        Clave&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="Tclave" runat="server"></asp:TextBox>
&nbsp;&nbsp;
    </p>
    <p class="auto-style4">
        Provincia
        <asp:DropDownList ID="DDLprovincia" runat="server" DataSourceID="SqlDataSource1" DataTextField="provincia" DataValueField="provincia">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Gym1ConnectionString %>" SelectCommand="SELECT * FROM [Provincias] ORDER BY [provincia]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p class="auto-style4">
        Canton&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DDLcanton" runat="server" DataSourceID="SqlDataSource2" DataTextField="canton" DataValueField="canton">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Gym1ConnectionString %>" SelectCommand="SELECT [canton] FROM [Cantones]">
        </asp:SqlDataSource>
    </p>
    <p class="auto-style4">
        Distrito&nbsp;&nbsp;
        <asp:DropDownList ID="DDLdistrito" runat="server" DataSourceID="SqlDataSource3" DataTextField="distrito" DataValueField="cod_distrito" OnSelectedIndexChanged="DDLdistrito_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Gym1ConnectionString %>" SelectCommand="SELECT * FROM [Distritos]"></asp:SqlDataSource>
&nbsp;&nbsp;
    </p>
    <p class="auto-style4">
        Detalles
        <asp:TextBox ID="Tdetalle" runat="server" OnTextChanged="Tdetalle_TextChanged"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p class="auto-style4">
        &nbsp;</p>
    <p class="auto-style4">
        <asp:Button ID="Bagregar" runat="server" OnClick="Bagregar_Click" Text="Agregar" />
    </p>
    <p class="auto-style4">
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        </asp:GridView>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
