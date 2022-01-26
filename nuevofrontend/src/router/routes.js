import Index from "pages/Index";
import Login from "pages/Login";
import Empresa from "pages/Empresa";
import Consultor from "pages/Consultor";
import Sociedad from "pages/Sociedad";
import Proyecto from "pages/Proyecto";
import Detalle from "pages/Detalle";
import Licitaciones from "pages/Licitaciones";
import Contratos from "pages/Contratos";

const routes = [
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '', component: Index, meta: { requiresAuth: false}},
      { path: 'Login', component: Login, meta: { requiresAuth: false} },
      { path: 'Empresa', component: Empresa, meta: { requiresAuth: true}},
      { path: 'Consultor', component: Consultor,meta: { requiresAuth: true}},
      { path: 'Sociedad', component: Sociedad,meta: { requiresAuth: true}},
      { path: 'Proyecto', component: Proyecto,meta: { requiresAuth: true} },
      { path: 'Licitaciones', component: Licitaciones,meta: { requiresAuth: false }},
      { name:'detalle' ,path: 'Detalle', component: Detalle, props:true,meta: { requiresAuth: true} },
      { path: 'Contratos', component: Contratos,meta: { requiresAuth: true }},
      
      
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
