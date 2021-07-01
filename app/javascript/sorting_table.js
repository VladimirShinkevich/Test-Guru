import { SortedTable } from './utilities/SortedTable.js'

document.addEventListener("turbolinks:load", function () {
  const sortBy = ".sort-by-title"
  const table = document.querySelector(sortBy)

  if (table) new SortedTable(table)
})
