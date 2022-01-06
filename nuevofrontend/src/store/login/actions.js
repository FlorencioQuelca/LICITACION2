
import { api } from "src/boot/axios"
export function login({commit}, user){
    return new Promise((resolve, reject) => {
      commit('auth_request')
      api({url: process.env.API+'/login', data: user, method: 'POST' })
      .then(resp => {
        const token = resp.data.token
        const user = resp.data.user
        localStorage.setItem('token', token)
        api.defaults.headers.common['Authorization'] = 'Bearer' + token
        commit('auth_success', token, user)
        resolve(resp)
      })
      .catch(err => {
        commit('auth_error')
        localStorage.removeItem('token')
        reject(err)
      })
    })
}

export function logout({commit}){
    return new Promise((resolve, reject) => {
      commit('logout')
      localStorage.removeItem('token')
      delete api.defaults.headers.common['Authorization']
      resolve()
    })
  }