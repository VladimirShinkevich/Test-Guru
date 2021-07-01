export class FormInline {

  constructor(editTest) {
    this.controls = editTest
    this.testId = editTest
    this.attr
    this.setup()
  }

  setup() {
    if (this.controls.length) { 
      this.controls.forEach((el) => {
        el.addEventListener('click', event => { this.formInlineLinkHandler() })
      })
    }
  }
 
  formInlineLinkHandler() {
    event.preventDefault()

    this.testId.forEach((el) => {
      this.attr = el.dataset.testId
      this.formInlineHandler(this.attr)
    })
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
