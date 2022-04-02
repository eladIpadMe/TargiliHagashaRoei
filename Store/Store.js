document.addEventListener("DOMContentLoaded", function () {
  let btn = document.querySelectorAll(".buttons");
  let cart = document.querySelector(".cart_img");
  let checkOut = document.querySelector("#check_out_btn");
  if (btn) {
    for (let i = 0; i < btn.length; i++) {
      btn[i].addEventListener("click", clickImage);
    }
    //   usernameElement1.addEventListener("input", validateUsername);
  }
  if (cart) {
    cart.addEventListener("click", cartClick);
  }
  if (checkOut) {
    checkOut.addEventListener("click", checkOutClick);
  }
});

function checkOutClick() {
  window.location = "store2.html";
  // window.location.replace("store2.html");
}

let count = 0;
let sum = 0;
function clickImage(event) {
  count++;
  if (count == 1) {
    let spanNum = document.createElement("span");
    let curr = document.querySelector(".cart_img_div");
    spanNum.innerText = count;
    spanNum.id = "num";
    curr.appendChild(spanNum);
    spanNum.classList.add("num");
  } else {
    document.querySelector("#num").innerText = count;
  }

  let parent = event.currentTarget.parentElement;
  let name = parent.querySelector(".names").innerText;
  let imgSrc = parent.querySelector(".item-img").src;
  let imgAlt = parent.querySelector(".item-img").alt;
  let price = parent.querySelector(".price").innerText;
  let divNew = document.createElement("div");
  let divName = document.createElement("div");
  let divPrice = document.createElement("div");

  sum += parseInt(price.substring(1));

  divNew.className = "item_cart_down_div";
  document.querySelector(".cart_down").appendChild(divNew);
  img = document.createElement("img");
  img.src = imgSrc;
  img.alt = imgAlt;
  img.className = "img-cart-down";
  divNew.appendChild(img);
  divName.innerText = name;
  divName.className = "names_cart_down";
  divNew.appendChild(divName);

  divPrice.innerText = price;
  divPrice.className = "price_cart_down";
  divNew.appendChild(divPrice);

  document.querySelector(".cart_down").appendChild(divNew);
  sessionStorage.setItem("item" + count, divName.innerText);
  sessionStorage.setItem("image" + count, imgSrc);
  sessionStorage.setItem("counter", count);
  sessionStorage.setItem("sum", sum);
}

let flag = true;
function cartClick(event) {
  let div = document.querySelector(".cart_down");
  let btn = document.querySelector("#check_out_btn");
  if (flag) {
    div.classList.remove("displayed");
    btn.classList.remove("displayed");
    flag = false;
  } else {
    div.classList.add("displayed");
    btn.classList.add("displayed");

    flag = true;
  }
}
