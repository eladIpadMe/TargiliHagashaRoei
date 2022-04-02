document.addEventListener("DOMContentLoaded", function () {
  let usernameElement1 = document.querySelector(".userName1.writings");
  let checkBox = document.querySelector("#present");
  let form = document.querySelector(".formClass");
  if (usernameElement1) {
    usernameElement1.addEventListener("input", validateUsername);
  }
  let usernameElement2 = document.querySelector(".userName2.writings");
  if (usernameElement2) {
    usernameElement2.addEventListener("input", validateUsername);
  }
  checkBox.addEventListener("click", checkPresent);
  form.addEventListener("submit", checkIfFormIsValid);
  loadData();
});

function loadData() {
  let count = sessionStorage.getItem("counter");
  let form = document.querySelector(".startForm");
  let div;
  let img; 
  for (let i = 1; i <= count; i++) {
    div = document.createElement("div");
    img = document.createElement("img");
   div.innerText = sessionStorage.getItem("item" + i);
    console.log(div.innerText);
    img.className = "imageClass";
    div.className = "writings";
    img.src = sessionStorage.getItem("image" + i);
    console.log(img.src);

    form.appendChild(div);
    form.appendChild(img);
  }
}

function validateUsername() {
  let userErrorElement1 = document.querySelector(".error-message1.writings");
  let usernameElement1 = document.querySelector(".userName1.writings");
  let username1 = usernameElement1.value;
  let userErrorElement2 = document.querySelector(".error-message2.writings");
  let usernameElement2 = document.querySelector(".userName2.writings");
  let username2 = usernameElement2.value;

  if (username1.length > 2 && username2.length > 2) {
    userErrorElement1.classList.remove("displayed");
    userErrorElement2.classList.remove("displayed");
    return true;
  } else if (username1.length > 2 && username2.length < 3) {
    userErrorElement1.classList.remove("displayed");
    userErrorElement2.classList.add("displayed");
    return false;
  } else if (username1.length < 3 && username2.length < 3) {
    userErrorElement1.classList.add("displayed");
    userErrorElement2.classList.add("displayed");
    return false;
  } else {
    if (username1.length < 3 && username2.length > 2) {
      userErrorElement1.classList.add("displayed");
      userErrorElement2.classList.remove("displayed");
      return false;
    }
  }
}

function checkPresent(event) {
  let checked = event.currentTarget.checked;
  let parent = event.currentTarget.parentElement;
  let textBox = document.createElement("input");
  let temp;
  textBox.type = "text";
  textBox.class = "writings";
  textBox.id = "inputPresent";
  textBox.name = "presentName";
  if (checked) {
    parent.appendChild(textBox);
  } else {
    let temp = parent.querySelector("#inputPresent");
    parent.removeChild(temp);
  }
}

function checkPresentName() {
  var check = document.querySelector("#inputPresent");
  if (!check) {
    return true;
  }
  input = document.querySelector("#inputPresent").value;
  if (input.indexOf(" ") == -1) {
    return false;
  } else {
    return true;
  }
}

function checkIfFormIsValid(event) {
  let form = document.querySelector(".formClass");
  let isValidName = checkPresentName();
  let isValid = validateUsername();

  if (isValid && isValidName) {
    form.classList.add("form");
  } else {
    alert(
      "Your input does not match the requierments. Name and family's name should be 3 letters, and present's name recievers should be sepreated by space"
    );
    event.preventDefault();
  }
}
