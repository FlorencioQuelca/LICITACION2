/*
export function someMutation (state) {
}
*/
export function auth_request(state){
    state.status = 'loading'
  }
  export function auth_success(state,data){
    state.status = 'success'
    state.token = data.token
    state.user = data.user
    state.empresas=data.user.permisos.find(p=>p.id===1)!=undefined
    state.usuarios=data.user.permisos.find(p=>p.id===2)!=undefined
    state.personas=data.user.permisos.find(p=>p.id===4)!=undefined
    state.proyectos=data.user.permisos.find(p=>p.id===6)!=undefined
    state.sociedades=data.user.permisos.find(p=>p.id===3)!=undefined
    state.licitaciones=data.user.permisos.find(p=>p.id===5)!=undefined
    state.contratos=data.user.permisos.find(p=>p.id===7)!=undefined
    state.visitas=data.user.permisos.find(p=>p.id===8)!=undefined
    state.solicitud=data.user.permisos.find(p=>p.id===9)!=undefined
    state.trabajos=data.user.permisos.find(p=>p.id===10)!=undefined


  }
  export function auth_error(state){
    state.status = 'error'
  }
  export function logout(state){
    state.status = ''
    state.token = ''
    state.user ={}
    state.usuarios=false
    state.personas=false
    state.proyectos=false
    state.sociedades=false
    state.empresas=false
    state.contratos=false
    state.visitas=false
    state.solicitud=false
    state.vehiculos=false
    state.trabajos=false
    state.licitaciones=false

  }
