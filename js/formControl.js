document.addEventListener("DOMContentLoaded", function () {
  const formInput = document.querySelectorAll(".selectClass, .textarea");
  const formSelect = document.querySelectorAll(".custom-select");
  const select = document.querySelectorAll(".select-selected");

  for (i = 1; i < formInput.length; i++) {
    if (formInput[i - 1].value != "") {
      formInput[i].classList.remove("disabled");
      formInput[i].disabled = false;
      if (i <= 3) {
        formSelect[i].classList.remove("disabled");
      }
    } else {
      formInput[i].classList.add("disabled");
      formInput[i].disabled = true;
      if (i <= 3) {
        formSelect[i].classList.add("disabled");
      }
    }
  }

  // AAAAAA
  var selVal01 = select[0].getAttribute("data-value");
  var selVal02 = select[1].getAttribute("data-value");
  var selVal03 = select[2].getAttribute("data-value");
  var selVal04 = select[3].getAttribute("data-value");

  if (selVal02 > 0 && selVal03 > 0) {
    load_data(selVal02, selVal03);
  }

  const obs01 = new MutationObserver(function (mutations) {
    selVal01 = select[0].getAttribute("data-value");
    console.log(selVal01);
    formInput[1].classList.remove("disabled");
    formInput[1].disabled = false;
    formSelect[1].classList.remove("disabled");
  });
  obs01.observe(select[0], {
    atributes: true,
    childList: true,
    characterData: true,
  });
  const obs02 = new MutationObserver(function (mutations) {
    selVal02 = select[1].getAttribute("data-value");
    console.log(selVal02);
    formInput[2].classList.remove("disabled");
    formInput[2].disabled = false;
    formSelect[2].classList.remove("disabled");
    load_data(selVal02, selVal03);
  });
  obs02.observe(select[1], {
    atributes: true,
    childList: true,
    characterData: true,
  });
  const obs03 = new MutationObserver(function (mutations) {
    selVal03 = select[2].getAttribute("data-value");
    console.log(selVal03);
    formInput[3].classList.remove("disabled");
    formInput[3].disabled = false;
    formSelect[3].classList.remove("disabled");
    load_data(selVal02, selVal03);
  });
  obs03.observe(select[2], {
    atributes: true,
    childList: true,
    characterData: true,
  });
  const obs04 = new MutationObserver(function (mutations) {
    selVal04 = select[3].getAttribute("data-value");
    console.log(selVal04);
    formInput[4].classList.remove("disabled");
    formInput[4].disabled = false;
  });
  obs04.observe(select[3], {
    atributes: true,
    childList: true,
    characterData: true,
  });
});

function load_data(s, c) {
  if (s > 0 && c > 0) {
    const sel = document.querySelector("#selectComponenteId");

    var fd = new FormData();

    fd.append("serie", s);
    fd.append("curso", c);

    var req = new XMLHttpRequest();

    req.open("POST", "../backEnd/dbQuery/processData.php");

    req.send(fd);

    req.onreadystatechange = function () {
      if (req.readyState == 4 && req.status == 200) {
        var res = JSON.parse(req.responseText);
        removeOptions(sel).then(function () {
          addOptions(sel, res);
        });
        selRemoveOptions(sel).then(function () {
          selCreateOptions(sel);
        });
      }
    };
    console.log("data loaded");
  } else {
    return;
  }
}

function addOptions(el, data) {
  for (i = 0; i < data.length; i++) {
    var op = document.createElement("option");
    op.value = data[i][0];
    op.textContent = data[i][1];
    op.setAttribute("for", el.id);
    el.appendChild(op);
  }
}

function removeOptions(el, callback) {
  return new Promise(function (fulfill, reject) {
    var i,
      L = el.options.length - 1;
    for (i = L; i >= 1; i--) {
      el.remove(i);
    }
    console.log("options removed");
    fulfill("options removed");
    reject("options doesn't removed");
  });
}

function selCreateOptions(el) {
  var x, l, ll, a, b, c, j;
  x = el.parentNode;
  l = x.length;
  ll = el.length;
  b = x.lastChild;
  for (j = 0; j < ll; j++) {
    c = document.createElement("DIV");
    c.innerHTML = el.options[j].innerHTML;
    c.setAttribute("data-value", el.options[j].value);

    c.addEventListener("click", function (e) {
      var y, i, k, s, h, sl, yl, xl;
      s = this.parentNode.parentNode.getElementsByTagName("select")[0];
      sl = s.length;
      h = this.parentNode.previousSibling;
      for (i = 0; i < sl; i++) {
        if (s.options[i].innerHTML == this.innerHTML) {
          s.selectedIndex = i;
          h.innerHTML = this.innerHTML;
          val = this.getAttribute("data-value");
          h.setAttribute("data-value", val);
          y = this.parentNode.getElementsByClassName("same-as-selected");
          arrNo = [];
          yl = y.length;
          xl = x.length;

          this.parentElement.parentElement.classList.add("custom-selectedF");
          for (k = 0; k < yl; k++) {
            y[k].removeAttribute("class");
          }
          this.setAttribute("class", "same-as-selected");
          break;
        }
      }
      h.click();
    });
    if (el.options[j].id != "place-select") {
      b.appendChild(c);
    }
  }
}
function selRemoveOptions(el, callback) {
  return new Promise(function (fulfill, reject) {
    var b = el.nextSibling.nextSibling.nextSibling;
    while (b.children.length > 0) {
      b.children[0].remove();
    }
    console.log("elements removed");
    fulfill("elements removed");
    reject("elements doesn't removed");
  });
}
