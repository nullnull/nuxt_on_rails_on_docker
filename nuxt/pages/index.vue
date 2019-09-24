<template lang="pug">
.uk-section.uk-section-small
  .uk-container.uk-container-small
    .uk-card.uk-card-default.uk-card-body.uk-width-1-1
      h1 Tasks 
      nuxt-link(to="tasks/new")
        button#add.uk-button.uk-button-primary
          | add
      template(v-if="tasks.length === 0")
        p.uk-text-center
          | no tasks
      table.uk-table.uk-table-striped(v-else)
        thead
          tr
            th name
            th
            th
        tbody
          tr(v-for="task in tasks")
            td.uk-table-expand
              | {{ task.title }}
            td
              nuxt-link(:to="'tasks/' + task.id + '/edit'")
                span(uk-icon="pencil")
            td(@click="destroy(task.id)").clickable
              span(uk-icon="trash")
</template>

<script>
import createComponent from '../lib/create_component'

export default createComponent([
  { resource: 'task', action: 'index' },
  { resource: 'task', action: 'destroy' }
]).extend({
  methods: {
    async destroy(id) {
      await this.destroyTask(id)
      this.$util.notify('Destroyed')
    }
  }
})
</script>

<style scoped lang="stylus">
a
  color #555 !important

.clickable
  cursor pointer
</style>
