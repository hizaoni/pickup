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
      itemSelect.remove()
      const items = XHR.response.selected_category_items;
      const html = `
      <select class="stock_form_content" id="stock-item-select" name="stock[item_id]">
      <option value="${item.id}">${item.name}</option>
      </select>`;
      
      label.insertAdjacentHTML("afterend", html);
      
    };


  });


};


window.addEventListener("load", stockChoice)
