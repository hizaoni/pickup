function searchItem() {
  const categorySelect = document.getElementById("search_category")
  categorySelect.addEventListener("change", () => {
    const searchForm = document.getElementById("item-search-form");
    let formData = new FormData(searchForm);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", '/items/search', true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const items = XHR.response.search_category_items;
      const quantity = XHR.response.quantity;
      const responseCategory = XHR.response.category;
      const itemTbody = document.getElementById("items-tbody");
      const tableMenu = document.getElementById("menu-items-index");
      const tableContents = document.getElementById("data-items-index")
      const itemTbodyFirstChild = itemTbody.firstElementChild;
      while (itemTbody.firstChild) {
      itemTbody.removeChild(itemTbody.firstChild);
      };
      itemTbody.insertAdjacentElement("afterbegin", itemTbodyFirstChild);
      var i = 0
      items.forEach((item) => {
        if ( quantity[i] < item.order_point) {
        const html = `
        <tr id="data-items-index" class="data_items_index_op">
              <td class="item_table"><input type="checkbox" name="deletes[${item.id}]" id="deletes_${item.id}" value="${item.category_id}"></td>
              <td class="item_table_name"><a href="/items/${item.id}">${item.name}</a></td>
              <td class="item_table_category">${responseCategory}</td>
              <td class="item_table_quantity_op">${quantity[i]}</td>
              <td class="item_table_order_point" id="item-table-order-point">${item.order_point}</td>
              <td class="item_table_button">
                <a class="index_button" href="/items/${item.id}">詳細</a>
              </td>
              <td class="item_table_button">
                <a class="index_button" href="/items/${item.id}/edit">編集</a>
              </td>
              <td class="item_table_button">
                <a class="index_button" rel="nofollow" data-method="delete" href="/items/${item.id}">削除</a>
              </td>
            </tr>`
        
        tableMenu.insertAdjacentHTML("afterend", html);
        i += 1;
        } else { const html = `
          <tr id="data-items-index" class="data_items_index">
              <td class="item_table"><input type="checkbox" name="deletes[${item.id}]" id="deletes_${item.id}" value="${item.category_id}"></td>
              <td class="item_table_name"><a href="/items/${item.id}">${item.name}</a></td>
              <td class="item_table_category">${responseCategory}</td>
              <td class="item_table_quantity">${quantity[i]}</td>
              <td class="item_table_order_point" id="item-table-order-point">${item.order_point}</td>
              <td class="item_table_button">
                <a class="index_button" href="/items/${item.id}">詳細</a>
              </td>
              <td class="item_table_button">
                <a class="index_button" href="/items/${item.id}/edit">編集</a>
              </td>
              <td class="item_table_button">
                <a class="index_button" rel="nofollow" data-method="delete" href="/items/${item.id}">削除</a>
              </td>
            </tr>`
        
        tableMenu.insertAdjacentHTML("afterend", html);
        i += 1;

        }
      })
        
        
        
        
      ;
    }
  });

};


window.addEventListener("load", searchItem);