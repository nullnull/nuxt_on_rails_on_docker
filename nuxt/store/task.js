import Vapi from 'nuxt-resource-based-api'

export const { state, mutations, actions } = Vapi.createStore('task', [
  'index',
  'show',
  'create',
  'edit',
  'destroy'
])
