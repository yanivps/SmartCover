(function () {
  'use strict';
  $(function () {
    $("#contact-us-success-alert").fadeTo(2500, 500).slideUp(500);
  });

  $(function () {
    var form = document.getElementById('contact-us-form');
    form.addEventListener('submit', function (event) {
      if (form.checkValidity() === false) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  });
})();