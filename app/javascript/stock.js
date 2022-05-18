function stockChoice(){
  const categoryGet = document.getElementById("stock-category-select");
  categoryGet.addEventListener("change", () => {
    const category_id = categoryGet.value;
    console.log(category_id);
    $.ajax({
      url: "/stocks/choice",
      type: "POST",
      data: {
        category_id: category_id
      },
      dataType:"json"
    });
    .done(function(data){ 
      console.log(data)
      const hidden = document.getElementById("stock-item-select");
    hidden.remove();
    });
    




   
    
   
  });

};


window.addEventListener("load", stockChoice)
