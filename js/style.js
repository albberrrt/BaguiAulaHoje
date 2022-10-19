const coloredLogo = document.querySelector("#colored-logo");
const whiteLogo = document.querySelector("#white-logo");
const headerTop = document.querySelector("#header-top");
const headerItems = document.querySelectorAll(".nav-item");

window.addEventListener("scroll", function () {
  if (window.scrollY === 0) {
    hideColoredLogo();
    showWhiteLogo();
    removefixToFixed();
  } else if (window.scrollY > 0) {
    hideWhiteLogo();
    showColoredLogo();
    addfixToFixed();
  }
});

function showWhiteLogo() {
  whiteLogo.style.opacity = 1;
  whiteLogo.style.display = "block";
  headerItems.forEach((headerItems) => {
    headerItems.style.color = "rgba(255, 255, 255, 0.65)";
  });
}
function hideWhiteLogo() {
  whiteLogo.style.opacity = 0;
  whiteLogo.style.display = "none";
  headerItems.forEach((headerItems) => {
    headerItems.style.color = "#4a4a4a";
  });
}
function showColoredLogo() {
  coloredLogo.style.opacity = 1;
  coloredLogo.style.display = "block";
}
function hideColoredLogo() {
  coloredLogo.style.opacity = 0;
  coloredLogo.style.display = "none";
}

function addfixToFixed() {
  headerTop.classList.add("fixto-fixed");
}
function removefixToFixed() {
  headerTop.classList.remove("fixto-fixed");
}
