function pullDown() {
  const menu = document.getElementById("menu");
  const pullDownChild = document.getElementById("pull-down")
  menu.addEventListener("click", ()=> {
    if (pullDownChild.getAttribute("style") == "display:block;") {
      // pullDownParentsにdisplay:block;が付与されている場合（つまり表示されている時）実行される
      pullDownChild.removeAttribute("style", "display:block;")
    } else {
      // pullDownParentsにdisplay:block;が付与されていない場合（つまり非表示の時）実行される
      pullDownChild.setAttribute("style", "display:block;")
    }
  });
  
}



window.addEventListener("load", pullDown);