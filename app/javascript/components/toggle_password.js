const toggleType = (element) => {
  if (element.querySelector("input").type === "password") {
    element.querySelector("input").type = ""
  } else {
    element.querySelector("input").type = "password"
  }
}

const toggleIcon = (icon) => {
  if (icon.classList.value === "far fa-eye") {
    icon.classList.replace("fa-eye", "fa-eye-slash")
  } else {
    icon.classList.replace("fa-eye-slash", "fa-eye")
  }
}

const togglePassword = () => {
  const passwordWrappers = document.querySelectorAll(".input-password-wrapper")
  if (passwordWrappers) {
    passwordWrappers.forEach((element) => {
      const icon = element.querySelector(".far")
      console.log(icon)
      if (icon) {
         icon.addEventListener("click", (event) => {
          toggleType(element);
          toggleIcon(event.target);
        })
      }
    });
  }
};

export { togglePassword };
