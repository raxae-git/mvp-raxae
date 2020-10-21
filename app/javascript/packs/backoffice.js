require("jquery")
require("@nathanvda/cocoon")
import 'bootstrap'
import '../css/backoffice.scss'

$(document).ready(function () {

  $('#sidebarCollapse').on('click', function () {
    $('#sidebar').toggleClass('active');
  });
});