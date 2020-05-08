<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrar-prestamo.aspx.cs" Inherits="Prestamos.registrar_prestamo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script type="module" src="https://cdn.jsdelivr.net/npm/@ionic/core@next/dist/ionic/ionic.esm.js"></script>
    <script nomodule src="https://cdn.jsdelivr.net/npm/@ionic/core@next/dist/ionic/ionic.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@ionic/core@next/css/ionic.bundle.css" />
    <style>
        :root {
            --ion-safe-area-top: 20px;
            --ion-safe-area-bottom: 22px;
        }
    </style>
    <title>Registrar préstamo</title>
</head>
<body>
    <form id="form1" runat="server">
        <ion-app>  
            <ion-menu content-id="main" side="start" id="nav-menu">                  
            </ion-menu>
            <div class="ion-page" id="main">
                <ion-header>
                    <ion-toolbar color="primary">
                        <ion-buttons slot="start">
                            <ion-menu-button></ion-menu-button>
                        </ion-buttons>
                        <ion-title>Detalle</ion-title>
                    </ion-toolbar>
                </ion-header>
                <ion-content>
                    <ion-grid>           
                        <ion-row>
                            <ion-col size-md="6" offset-md="3">
                                <ion-card>
                                    <ion-card-header>
                                        <ion-card-title>Detalle del préstamo</ion-card-title>
                                    </ion-card-header>  
                                    <ion-card-content>
                                        <asp:Repeater ID="repPersonas" runat="server">
                                            <ItemTemplate>
                                                <ion-item disabled="true">                                                   
                                                    <ion-input name="txtId" type="number" value="<%#Eval("identificacion") %>"></ion-input>
                                                </ion-item>
                                                <ion-item disabled="true">
                                                    <ion-input name="txtNombre" type="text"><%#Eval("nombre") %></ion-input>
                                                </ion-item>                                                    
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <ion-item>      
                                            <asp:Label ID="txtFecha" runat="server"></asp:Label>
                                        </ion-item>
                                        <ion-item>
                                            <ion-label position="floating">Monto a prestar</ion-label>
                                            <ion-input name="txtMonto" type="number" required></ion-input>
                                        </ion-item>
                                        <div class="ion-margin-vertical ion-text-right">                                    
                                            <input id="btnShow" runat="server"  class="btn btn-primary" type="submit" value="Registrar" onserverclick="btnRegistrar_Click" />                                 
                                        </div>                                                                                            
                                    </ion-card-content>
                                </ion-card>
                            </ion-col>
                        </ion-row>                         
                    </ion-grid>
                </ion-content>
            </div>
        </ion-app>
        <div id="modalContent"></div>
        <script src="js/menu.js"></script>
        <script src="js/app.js"></script>
    </form>
</body>
</html>
