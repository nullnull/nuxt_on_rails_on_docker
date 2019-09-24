import Vue from 'vue'
import Vapi from 'nuxt-resource-based-api'

export default function createComponent(resources) {
  return Vue.extend({
    fetch: Vapi.generateFetch(resources),
    computed: Vapi.generateComputed(resources),
    methods: Vapi.generateMethods(resources),
    transition: {
      mode: 'out-in',
      enterActiveClass: 'uk-animation-slide-left-small',
      leaveActiveClass: 'uk-animation-slide-right-small uk-animation-reverse'
    }
  })
}
