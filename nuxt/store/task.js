import Napi from 'nuxt-resource-based-api'

export const { state, mutations, actions } = Napi.createStore('task', [
  'index',
  'show',
  'create',
  'edit',
  'destroy'
])
