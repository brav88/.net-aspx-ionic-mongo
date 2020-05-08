const menuObject = document.querySelector('#nav-menu');

menuArray = [{ 'name': 'Mis clientes', 'url': './personas.aspx', 'icon': 'people-outline' },
             { 'name': 'Crear nuevo cliente', 'url': './registro.aspx', 'icon': 'person-add-outline' },
             { 'name': 'Consulta de clientes', 'url': './index.aspx', 'icon': 'people-circle-outline' }];

menuHtml = `
            <ion-header>
                <ion-toolbar color="primary">
                    <ion-title>Menu</ion-title>
                </ion-toolbar>
            </ion-header>
            <ion-content>
                <ion-list>
                    ${menuArray.map(item => `
                        <ion-item>
                            <ion-icon color="primary" name="${item.icon}" slot="start"></ion-icon>
                            <ion-router-link color="dark" href="${item.url}">${item.name}</ion-router-link>
                        </ion-item>
                    `).join('\n')}
                </ion-list>    
            </ion-content>`;

menuObject.innerHTML = menuHtml;