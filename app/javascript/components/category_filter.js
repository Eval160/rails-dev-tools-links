const toggleFilter = () => {
  const filterBtn = document.querySelector(".toogleBtn")
  const filterSection = document.querySelector(".category-filter")
    filterBtn.addEventListener("click", (event) => {
      filterSection.classList.toggle("d-none");
      filterBtn.classList.toggle("d-none");
    })

}

export { toggleFilter };
