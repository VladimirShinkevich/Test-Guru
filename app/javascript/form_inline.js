import { FormInline } from './utilities/FormInline.js'

document.addEventListener('turbolinks:load', function () {
  const testRowsList = document.querySelectorAll(".js-test-inline-edit")

  testRowsList.forEach(rowTest => {
    new FormInline(rowTest)
  })
})
