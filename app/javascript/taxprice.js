  function tax_price() {

    const itemPlace = document.getElementById("item-price");
      itemPlace.addEventListener("click", function(e) {

        const place = itemPlace.value;
        const sum = place * 0.1;
        const priceTax = Math.round(sum);
        const profit = place - priceTax

        const addTaxPrice = document.getElementById("add-tax-price");
        addTaxPrice.textContent = priceTax;
        const addTaxProfit = document.getElementById("profit");
        addTaxProfit.textContent = profit;
    });
  }

window.addEventListener("load", tax_price);