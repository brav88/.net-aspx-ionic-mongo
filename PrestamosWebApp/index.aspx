<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Prestamos.index" %>

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
    <title>Personas</title>
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
                        <ion-title>Personas</ion-title>
                    </ion-toolbar>
                </ion-header>
                <ion-content>
                    <ion-grid>
                        <ion-row>
                            <ion-col size-md="6" offset-md="3">
                                 <ion-card>
                                    <ion-card-header>
                                        <ion-card-title>Buscar personas</ion-card-title>
                                    </ion-card-header>
                                    <ion-card-content>                                    
                                        <ion-item>
                                            <ion-label position="floating">Identificación</ion-label>
                                        <ion-input name="txtId" type="text"></ion-input>
                                        </ion-item>
                                        <ion-item>
                                            <ion-label position="floating">Nombre</ion-label>
                                        <ion-input name="txtNombre" type="text"></ion-input>
                                        </ion-item>
                                        <hr>                                  
                                        <div class="ion-margin-vertical ion-text-right">                                         
                                            <input class="btn btn-primary" runat="server" type="button" value="Buscar" onserverclick="btnBuscar_Click" />
                                        </div>
                                    </ion-card-content>
                                </ion-card>                           
                            </ion-col>
                        </ion-row> 
                        <ion-row>
                            <ion-col size-md="6" offset-md="3">
                                <ion-card>
                                    <ion-list>
                                    <asp:Repeater ID="repPersonas" runat="server">
                                        <ItemTemplate>
                                            <ion-item button onclick="showDetail('<%#Eval("identificacion") %>')">                                                                                                
                                                <ion-label>
                                                <h2><%#Eval("nombre") %></h2>
                                                <p>Identificación: <%#Eval("identificacion") %></p>       
                                                <p>Telefono: <%#Eval("telefono") %></p>    
                                                <p>Dirección: <%#Eval("direccion") %></p>                                                   
                                            </ion-item>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                     </ion-list>
                                </ion-card>
                            </ion-col>
                        </ion-row>                  
                    </ion-grid>
                </ion-content>
            </div>
        </ion-app>
        <script src="js/menu.js"></script>  
        <script src="js/app.js"></script> 
    </form>
</body>
</html>
