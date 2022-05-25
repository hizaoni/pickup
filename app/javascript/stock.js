function stockChoice(){
  const currentItemQuantity = document.getElementById("current-item-quantity");
  const category = document.getElementById("stock-category-select");
  category.addEventListener("change", () => {
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
      currentItemQuantity.innerHTML = "";
      const items = XHR.response.selected_category_items;
      const quantity = XHR.response.quantity;
      if (items.length == 0 ) {
        const html = `
          <option value="">なし</option>`;
          itemSelect.insertAdjacentHTML("afterbegin", html);
      } else { 
        if ( items.length == 1 ) {
          items.forEach(function( item ) {
            const html1 = `
            <option value="${item.id}">${item.name}</option>`;
            itemSelect.insertAdjacentHTML("afterbegin", html1);
          });
          const html2 = `
          在庫数　${quantity.quantity} ${items[0].unit}`;
          currentItemQuantity.insertAdjacentHTML("afterbegin", html2);
          
        } else {
          items.forEach(function( item ) {
          const html = `
          <option value="${item.id}">${item.name}</option>`;
          itemSelect.insertAdjacentHTML("afterbegin", html);
          });
          const html2 = `
          在庫数　${quantity.quantity} ${items[0].unit}`;
          currentItemQuantity.insertAdjacentHTML("afterbegin", html2);
        }
      }     
    }
  });
  const item = document.getElementById("stock-item-select");
  const changeItem = item.addEventListener("change", () => {
    const stockForm = document.getElementById("stock-form");
    let formData = new FormData(stockForm);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", '/items/quantity', true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const currentItemQuantity = document.getElementById("current-item-quantity");
      const item = XHR.response.quantity;
      const unitItem = XHR.response.select_item
      currentItemQuantity.innerHTML = "";
      const html = `
        在庫数　${item.quantity} ${unitItem.unit}`;
      currentItemQuantity.insertAdjacentHTML("afterbegin", html);
    };
  })

};


window.addEventListener("load", stockChoice);
