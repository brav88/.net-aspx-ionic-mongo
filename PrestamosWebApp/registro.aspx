<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="Prestamos.registro" %>

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
    <title>Registrar Persona</title>
    <script type="module">
        import { alertController } from 'https://cdn.jsdelivr.net/npm/@ionic/core@next/dist/ionic/index.esm.js';
        window.alertController = alertController;
    </script>
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
                        <ion-title>Registrar Persona</ion-title>
                    </ion-toolbar>
                </ion-header>
                <ion-content>
                    <ion-grid>
                        <ion-row>
                            <ion-col size-md="6" offset-md="3">
                                <ion-card>
                                <ion-card-header>
                                    <ion-card-title>Registrar Persona</ion-card-title>
                                </ion-card-header>
                                <ion-card-content>                                    
                                    <ion-item>
                                        <ion-label position="floating">Identificación</ion-label>
                                        <ion-input name="txtId" type="number" required></ion-input>
                                    </ion-item>
                                    <ion-item>
                                        <ion-label position="floating">Nombre</ion-label>
                                        <ion-input name="txtNombre" type="text" required></ion-input>
                                    </ion-item>
                                    <ion-item>
                                        <ion-label position="floating">Télefono</ion-label>
                                        <ion-input name="txtTelefono" type="number" required></ion-input>
                                    </ion-item>
                                    <ion-item>
                                        <ion-label position="floating">Dirección</ion-label>
                                        <ion-input name="txtDireccion" type="text" required></ion-input>
                                    </ion-item>
                                    <hr>                                  
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
