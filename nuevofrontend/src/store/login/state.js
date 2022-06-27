export default function () {
  return {
    status: '',
    token: localStorage.getItem('token') || '',
    user : {},
    usuarios:false,
    proyectos:false,
    personas:false,
    empresas:false,
    sociedades:false,
    contratos:false,
    visitas:false,
    vehiculos:false,
    trabajos:false,
    licitaciones:false,
    visitantes:false,
    reportes:false,


  }
}
