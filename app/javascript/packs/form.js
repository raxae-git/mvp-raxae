window.onload = function () {
  document.getElementById("Selected").addEventListener("click", function () {
    var select = this;
    var value = select.options[select.selectedIndex].value;
    var interest = document.getElementById('interest');
    var extra = document.getElementById('extra');
    if (value == "Outro") {
      interest.classList.remove('hidden');
      extra.disabled = false
    }
    else {
      interest.classList.add('hidden');
      extra.disabled = true
    }
  }, false);

  document.getElementById("Phone").addEventListener("keyup", function mascara() {
    v_obj = this
    setTimeout(execmascara(), 1)
  }, false);

  function execmascara() {
    v_obj.value = mtel(v_obj.value)
  }

  function mtel(v) {
    v = v.replace(/\D/g, ""); //Remove tudo o que não é dígito
    v = v.replace(/^(\d{2})(\d)/g, "($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
    v = v.replace(/(\d)(\d{4})$/, "$1-$2"); //Coloca hífen entre o quarto e o quinto dígitos
    return v;
  }
}

