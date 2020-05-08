<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="Prestamos.detail" %>

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
    <title>Detalle Persona</title>
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
                                        <ion-card-title>Detalle de cliente</ion-card-title>
                                    </ion-card-header>  
                                    <ion-card-content>
                                        <asp:Repeater ID="repPersonas" runat="server">
                                            <ItemTemplate>
                                                <ion-item lines="none">                                                                                                
                                                    <ion-label>
                                                    <h2><ion-icon name="person-outline" slot="start"></ion-icon> <%#Eval("nombre") %></h2>
                                                    <p><ion-icon name="reader-outline" slot="start"></ion-icon> <%#Eval("identificacion") %></p>       
                                                    <p><ion-icon name="call-outline" slot="start"></ion-icon> <%#Eval("telefono") %></p>    
                                                    <p><ion-icon name="compass-outline" slot="start"></ion-icon> <%#Eval("direccion") %></p>                                                   
                                                    <div class="ion-margin-vertical ion-text-right">
                                                        <ion-button onclick="registerNew('<%#Eval("identificacion") %>')" color="primary">
                                                            <ion-icon slot="start" name="add"></ion-icon>
                                                            Agregar préstamo
                                                        </ion-button>
                                                    </div>    
                                                </ion-item>
                                            </ItemTemplate>
                                        </asp:Repeater>                                                                                                       
                                    </ion-card-content>
                                </ion-card>
                            </ion-col>
                        </ion-row>  
                         <ion-row>
                            <ion-col size-md="6" offset-md="3">
                                <ion-card>      
                                    <ion-card-header>
                                        <ion-card-title>Prestamos activos</ion-card-title>
                                    </ion-card-header>
                                    <ion-card-content>
                                        <asp:Repeater ID="repPrestamos" runat="server">
                                            <ItemTemplate>                                                
                                                <ion-item>                                                                                                
                                                    <ion-label>
                                                    <h2>Saldo Actual: ₡<%# Eval("saldoActual", "{0:#.00}") %></h2>
                                                    <p>Saldo Inicial: ₡<%# Eval("saldoInicial", "{0:#.00}") %></p>       
                                                    <p>Fecha: <%# Eval("fecha", "{0:dd-MMMM-yyyy}") %></p>    
                                                    <p>Número de PR: <%#Eval("IDPR") %></p>    
                                                    <div class="ion-margin-vertical ion-text-right">
                                                        <ion-button color="primary" onclick="registerPay('<%#Eval("identificacion") %>', '<%#Eval("IDPR") %>')">
                                                            <ion-icon slot="start" name="add"></ion-icon>
                                                            Abonar
                                                        </ion-button>
                                                         <ion-button color="primary" onclick="viewPays('<%#Eval("identificacion") %>', '<%#Eval("IDPR") %>')">
                                                            <ion-icon slot="start" name="search-outline"></ion-icon>
                                                            Ver abonos
                                                        </ion-button>
                                                    </div>      
                                                </ion-item>
                                            </ItemTemplate>
                                        </asp:Repeater>  
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
