function charge(){
  const priceCharge = document.getElementById("add-tax-price");
  const priceInput = document.getElementById("item-price");
  const profitSell = document.getElementById("profit");
  priceInput.addEventListener("keyup", () => {
    price = priceInput.value;
    let tax = Math.round(price / 10);
    priceCharge.innerHTML = tax;
    profitSell.innerHTML = (price - tax);
  });
};

window.addEventListener('load', charge);