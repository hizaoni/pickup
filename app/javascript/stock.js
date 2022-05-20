function stockChoice(){
  const category = document.getElementById("stock-category-select");
  const changeCategory = category.addEventListener("change", () => {
    const stockForm = document.getElementById("stock-form");
    let formData = new FormData(stockForm);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", '/items/select', true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const label = document.getElementById('stock-form-label');
      const itemSelect = document.getElementById('stock-item-select');
      itemSelect.innerHTML = "";
      const items = XHR.response.selected_category_items;
      items.forEach(function( item ) {
        const html = `
      <option value="${item.id}">${item.name}</option>`;
      itemSelect.insertAdjacentHTML("afterbegin", html);
      });
      
    };


  });


};


window.addEventListener("load", stockChoice)
