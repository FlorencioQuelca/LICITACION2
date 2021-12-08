import Index from "pages/Index";
import Login from "pages/Login";
import Empresa from "pages/Empresa";
import Consultor from "pages/Consultor";
import Sociedad from "pages/Sociedad";
import Proyecto from "pages/Proyecto";
import Detalle from "pages/Detalle";
import Registrar from "pages/Registrar";
const routes = [
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '', component: Index },
      { path: 'Login', component: Login },
      { path: 'Empresa', component: Empresa },
      { path: 'Consultor', component: Consultor },
      { path: 'Sociedad', component: Sociedad },
      { path: 'Proyecto', component: Proyecto},
      { path: 'Registrar', component: Registrar },
      { path: 'Detalle', component: Detalle },
      
      
    ]
  },

  // Always leave this as last one,
  // but you can also remove it
  {
    path: '/:catchAll(.*)*',
    component: () => import('pages/Error404.vue')
  }
]

export default routes
