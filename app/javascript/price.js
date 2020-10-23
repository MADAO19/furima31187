  window.addEventListener("load", () => {

  const item = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  
  item.addEventListener("input", () => {
    const number = item.value
    const tax_result = parseInt(number * 0.1)
    const profit_result = parseInt(number - tax_result)
  
  tax.innerHTML = tax_result
  profit.innerHTML = profit_result
  });
})
