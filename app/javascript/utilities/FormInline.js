export class FormInline {

  constructor(editTest) {
    this.testId = document.querySelectorAll(editTest)
    this.allTests()
  }

  allTests() {
  	this.testId.forEach((el) => {
  		this.getEventClick(el)
  	})
  }

  getEventClick(el) {
  	el.addEventListener('click', event => {this.setAttr(el)})
  }
  

  setAttr(el) {
  	event.preventDefault()
  	const form = document.querySelectorAll("form[data-test-id='" + el.dataset.testId + "']");
    if (el.dataset.state === 'true') {
      form[0].style.display = 'none';
      el.dataset.state = 'false';
      return el.textContent = 'Редактировать тест';
    } else {
      form[0].style.display = 'block';
      el.dataset.state = 'true';
      return el.textContent = 'Отмена';
    }
  }
}
