const toggleActiveClass = () => {
  document.querySelector(`a[href='${location.pathname}']`).classList.toggle('active')
};

export { toggleActiveClass }
