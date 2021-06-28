import { FormInline } from './utilities/FormInline.js'

document.addEventListener('turbolinks:load', function () {
  const editTestId = "edit-test"
  const editTest = document.getElementById(editTestId)

  if (editTest) new FormInline(editTestId)
})
