window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  const TaxDom = document.getElementById("add-tax-price");
    TaxDom.innerHTML = Math.floor(inputValue * 0.1);
  const Profit = document.getElementById("profit");
    Profit.innerHTML = Math.floor(inputValue -(inputValue * 0.1));
  })
});