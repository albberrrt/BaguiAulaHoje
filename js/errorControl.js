document.addEventListener("DOMContentLoaded", function () {
  const formInputs = document.querySelectorAll(
    ".inputClass, .custom-select, .textarea"
  );
  const errorDiv = document.querySelector("#dom-error-target");
  const error = errorDiv.textContent;

  if (error == 202) {
    console.log("error: " + error);
    formInputs.forEach((el) => {
      el.classList.add("fix-to-error");
    });
  }
});
