/*
export function someGetter (state) {
}
*/
 export function  isLoggedIn( state) {
  return !!state.token;
 }
 export function  authStatus(state) {
   return state.status
 }
 export function user (state) {
  return state.user
}
