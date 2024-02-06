const btnSingIn = document.getElementById("sign-in"),
      btnSingUp = document.getElementById("sign-up"),
      formLogin = document.querySelector(".login"),
      formRegister = document.querySelector(".register");

btnSingIn.addEventListener("click", e => {
    formRegister.classList.add("hide");
    formLogin.classList.remove("hide")
})

btnSingUp.addEventListener("click", e => {
    formLogin.classList.add("hide");
    formRegister.classList.remove("hide")
})