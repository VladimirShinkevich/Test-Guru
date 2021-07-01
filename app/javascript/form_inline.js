import { FormInline } from './utilities/FormInline.js'

document.addEventListener('turbolinks:load', function () {
  const editTest = ".form-inline-link"
  const edit = document.querySelectorAll(editTest)
  if(edit) new FormInline(edit)
})
