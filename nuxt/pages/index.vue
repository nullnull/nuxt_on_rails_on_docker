<template>
  <h1>user ids: {{ $store.state.users.map(x => x.id) }}</h1>
</template>

<script>
import axios from 'axios'
export default {
  async fetch ({ store, params }) {
    let { data } = await axios.get('http://rails:3000/users')
    store.commit('setUsers', data)
  }
}
</script>

<style lang="stylus" scoped>
h1
  color gray
</style>
