export class FormInline {

  constructor(editTest) {
    this.controls = document.querySelectorAll(editTest)
    this.testId = this.controls
    this.errors = document.querySelector('.resource-errors')
    this.setup()
  }

  setup() {

    if (this.controls.length) {
      this.controls.forEach((el) => {
        el.addEventListener('click', event => { this.formInlineLinkHandler() })
      })
    }

    if(this.errors) {
      let resourceId = this.errors.dataset.resourceId
      formInlineHandler(resourceId)
    }
  }

  formInlineLinkHandler() {
    event.preventDefault()
    
    if(this.testId.length) {
      this.testId.forEach((el) => {
        const attr = el.dataset.testId 
        this.formInlineHandler(attr)
      })
    }
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
