// If you want to mutate vuex store state outside mutation handlers, set false.
// If false, initializing or editing entity will become very easy. See pages/tasks/_id/edit.vue for example.
export const strict = false

import Vapi from 'nuxt-resource-based-api'
import requestCallback from '../lib/request_callback'

Vapi.setConfig({
  requestCallback
  // apiUrl: process.env.apiUrl
})
