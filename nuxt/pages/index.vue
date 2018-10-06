<template lang="pug">
  h1
    | user ids: {{ $store.state.users.map(x => x.id) }}
</template>

<script>
import axios from 'axios'
export default {
  async fetch ({ store, params }) {
    let { data } = await axios.get(`${process.env.apiUrl}/users`)
    store.commit('setUsers', data)
  },
}
</script>

<style lang="stylus" scoped>
h1
  color gray
</style>
