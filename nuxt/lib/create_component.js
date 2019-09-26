import Vue from 'vue'
import Napi from 'nuxt-resource-based-api'

export default function createComponent(resources) {
  return Vue.extend({
    fetch: Napi.generateFetch(resources),
    computed: Napi.generateComputed(resources),
    methods: Napi.generateMethods(resources),
    transition: {
      mode: 'out-in',
      enterActiveClass: 'uk-animation-slide-left-small',
      leaveActiveClass: 'uk-animation-slide-right-small uk-animation-reverse'
    }
  })
}
