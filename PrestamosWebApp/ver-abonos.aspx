<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ver-abonos.aspx.cs" Inherits="PrestamosWebApp.ver_pagos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="module" src="https://cdn.jsdelivr.net/npm/@ionic/core@next/dist/ionic/ionic.esm.js"></script>
    <script nomodule src="https://cdn.jsdelivr.net/npm/@ionic/core@next/dist/ionic/ionic.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@ionic/core@next/css/ionic.bundle.css" />
    <style>
        :root {
            --ion-safe-area-top: 20px;
            --ion-safe-area-bottom: 22px;
        }
    </style>
    <title>Abonos</title>
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
                        <ion-title>Abonos</ion-title>
                    </ion-toolbar>
                </ion-header>
                <ion-content>
                    <ion-grid>                   
                        <ion-row>
                            <ion-col size-md="6" offset-md="3">
                                <ion-card>
                                    <ion-card-header>
                                        <ion-card-title>Abonos</ion-card-title>
                                    </ion-card-header>
                                    <ion-card-content>
                                        <ion-list>
                                            <asp:Repeater ID="repAbonos" runat="server">
                                                <ItemTemplate>
                                                    <ion-item>                                                                                                
                                                        <ion-label>
                                                        <h2>Fecha del abono: <%# Eval("fecha", "{0:dd-MMMM-yyyy}") %></h2>
                                                        <p>Abono: ₡<%#Eval("monto") %></p>       
                                                        <p>Amortiza: ₡<%#Eval("amortiza") %></p>    
                                                        <p>Interes: ₡<%#Eval("interes") %></p>                                                   
                                                    </ion-item>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ion-list>
                                    </ion-card-content>
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
