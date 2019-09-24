<template lang="pug">
.uk-section.uk-section-small
  .uk-container.uk-container-small
    .uk-card.uk-card-default.uk-card-body.uk-width-1-1
      h1 Tasks
      form
        fieldset.uk-fieldset
          label.uk-form-label(for='form-title') title
          .uk-form-controls
            input#form-title.uk-input(v-model="editingTask.title")
      .uk-margin-bottom
      button.uk-button.uk-button-primary(@click="update")
        | Update
      nuxt-link(to="/").uk-margin-left
        button.uk-button.uk-button-default
          | Back
</template>

<script>
import createComponent from '../../../lib/create_component'

export default createComponent([{ resource: 'task', action: 'edit' }]).extend({
  methods: {
    async update() {
      await this.updateTask() // You can omit arguments if you specify `edit` action instead of `update` action
      this.$util.notify('Updated')
      this.$router.push('/')
    }
  }
})
</script>
