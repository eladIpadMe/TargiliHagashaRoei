document.addEventListener("DOMContentLoaded", function () {
  loadData();
  let back = document.querySelector("#back");
  if (back) {
    back.addEventListener("click", backClick);
  }
});

function backClick() {
  window.location = "store.html";
  // window.location.replace("store2.html");
}

function loadData() {
  let count = sessionStorage.getItem("counter");
  let divItems = document.querySelector(".items");
  let lineItems = document.querySelector(".lines");

  //   let formElement = document.querySelector(".startForm");
  for (let i = 1; i <= count; i++) {
    let div = document.createElement("div");
    let img = document.createElement("img");
    // let formElement = document.querySelector(".startForm");
    div.innerText = sessionStorage.getItem("item" + i);
    console.log(div.innerText);
    img.className = "imageClass";
    div.className = "writings";
    img.src = sessionStorage.getItem("image" + i);
    console.log(img.src);
    console.log(div.innerText);

    divItems.appendChild(div);
    divItems.appendChild(img);
  }
  let sumDiv = document.createElement("div");
  let sum = sessionStorage.getItem("sum");
  sumDiv.innerText = "sum is: " + sum;
  sumDiv.className = "writings";
  lineItems.appendChild(sumDiv);

  let queryString = window.location.search.substring(7);
  let str1 = queryString.split("&");

  let str2 = str1[1].split("=");
  let name = str1[0];
  let familyName = str2[1];
  let nameDiv = document.createElement("div");
  nameDiv.innerText = "Name is: " + name + " " + familyName;
  nameDiv.className = "writings";
  lineItems.appendChild(nameDiv);
  if (str1.length > 2) {
    let presentName = str1[2].split("=");
    presentName = presentName[1];
    presentName = presentName.split("+");
    let presentFamilyName = presentName[1];
    presentName = presentName[0];
    let presentNameDiv = document.createElement("div");
    presentNameDiv.innerText =
      "Present receiever name is: " + presentName + " " + presentFamilyName;
    lineItems.appendChild(presentNameDiv);
  }
}
