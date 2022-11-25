import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

export { application }
