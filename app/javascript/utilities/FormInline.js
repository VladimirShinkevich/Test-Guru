export class FormInline {

  constructor(rowTest) {
    this.rowTest = rowTest
    this.cellEdit = rowTest.querySelector('.js-form-inline-link')
    this.getEventClick(this.cellEdit,this.rowTest)
  }
  
  getEventClick(cellEdit,rowTest) {
    cellEdit.addEventListener('click', event => {this.setAttr(cellEdit,rowTest)})
  }

  setAttr(cellEdit,rowTest) {
    event.preventDefault()

    const testTitle = rowTest.querySelector('.js-test-title')
    const formInLine = rowTest.querySelector('.js-form-inline')
    
    if(formInLine.classList.contains('hide')) {
      testTitle.classList.add('hide')
      formInLine.classList.remove('hide')
      cellEdit.textContent = 'Отменить' }
    else {
      testTitle.classList.remove('hide')
      formInLine.classList.add('hide')
      cellEdit.textContent = 'Редактировать тест'
    }
  }
}
