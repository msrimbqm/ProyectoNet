<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UNK.Entrada" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
     <link href="css/Styles.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>UNKEEPER</title>
</head>
<body>
    <form id="form1" runat="server">
    
    <div>
        </br></br></br></br></br></br></br></br></br></br></br></br>
    
    </div>

     <div class="entrada">
    <asp:TextBox ID="txtUsuario" runat="server" ></asp:TextBox>
        </div>

    <div class="entrada">
    <asp:TextBox ID="txtClave" runat="server" TextMode="Password"></asp:TextBox>
    </div>
    <br />
    <br />
    <div class="entrada" >
    <asp:Button ID="d" runat="server" Text="ACCEDER" OnClick="d_Click" />
    </div>
    <div class="entrada">

        <asp:Label ID="LabelResultado" runat="server" ForeColor="Red" BackColor="White"></asp:Label>
    </div>

              
        
        
        
    </form>
</body>
</html>
