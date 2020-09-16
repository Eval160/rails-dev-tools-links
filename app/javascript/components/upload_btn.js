const insertUploadedConfirmation = (btn) => {
  btn.insertAdjacentHTML('afterend', '<div class="ml-1" style="display: inline-block">Photo chargée</div>');
};

const toggleUploadBtn = () => {
  const fileInput = document.querySelector("#resource_photo")
  const btn = document.getElementById("upload-btn")
  if (fileInput) {
    btn.addEventListener("change", () => {
      if (fileInput.files.length > 0) {
        insertUploadedConfirmation(btn);
      }
    });
  }

};

export { toggleUploadBtn };
