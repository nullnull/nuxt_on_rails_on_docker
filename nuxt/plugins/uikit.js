import Vue from 'vue'
import UIkit from 'uikit'
import Icons from 'uikit/dist/js/uikit-icons'

// loads the Icon plugin
UIkit.use(Icons)
Vue.prototype.$uikit = UIkit

Vue.prototype.$util = {
  notify(message) {
    UIkit.notification({
      message: message,
      pos: 'top-center',
      timeout: 2500,
      status: 'success'
    })
  }
}
