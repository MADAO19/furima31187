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






// ①ユーザが価格を入力したらイベント発火
// ②ユーザが入力した価格を取得
// ③取得した価格を元に、手数料と利益を計算
// ④計算結果をHTML上に表示（DBに保存しない＝XHRは使わない）