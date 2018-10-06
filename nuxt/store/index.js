import Vuex from 'vuex'

const store = () => new Vuex.Store({

  state: {
    users: []
  },
  mutations: {
    setUsers (state, users) {
      state.users = users;
    }
  }
})

export default store
