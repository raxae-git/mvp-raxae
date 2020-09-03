window.onload = function () {
  document.getElementById("Select").addEventListener("click", mostrarCampoInteresse, false);
}

function mostrarCampoInteresse() {
  var select = document.getElementById('Select');
  var value = select.options[select.selectedIndex].value;
  var interest = document.getElementById('interest');
  if (value == "Outro")
    interest.classList.remove('hidden');
  else
    interest.classList.add('hidden');
}