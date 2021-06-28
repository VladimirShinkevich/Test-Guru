export class FormInline {

  constructor(editTestId) {
    this.editTestId = document.getElementById(editTestId)
    this.controls = document.querySelectorAll('.form-inline-link')
    this.testId = document.querySelector('.form-inline-link').dataset.testId
   
    this.setup()
  }

  setup() {
    if (this.controls.length) {
      for (let i = 0; i < this.controls.length; i++) {
        this.controls[i].addEventListener('click', event => { this.formInlineLinkHandler() })
      }
    }
     
    let errors = document.querySelector('.resource-errors')
    if(errors) {
      let resourceId = errors.dataset.resourceId
      formInlineHandler(resourceId)
    }
  }

  formInlineLinkHandler() {
    event.preventDefault()
    this.formInlineHandler(this.testId)
  }

  formInlineHandler(testId) {
    let link = document.querySelector('.form-inline-link[data-test-id="'+ testId +'"]')
    let testTitle = document.querySelector('.test-title[data-test-id="'+ testId +'"]')
    let formInLine = document.querySelector('.form-inline[data-test-id="'+ testId +'"]')

    if(formInLine.classList.contains('hide')) {
      testTitle.classList.add('hide')
      formInLine.classList.remove('hide')
      link.textContent = 'Выйти'
    }
    else {
      testTitle.classList.remove('hide')
      formInLine.classList.add('hide')
      link.textContent = 'Редактировать тест'
    }
  }
}
