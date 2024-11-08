// import { Controller } from "@hotwired/stimulus";
// import Swal from "sweetalert2";

// export default class extends Controller {
//   static values = {
//     title: String,
//     text: String,
//     confirmButtonText: String,
//     cancelButtonText: String,
//   };

//   confirm(event) {
//     event.preventDefault(); // Prevenir el envío del formulario

//     Swal.fire({
//       title: this.titleValue,
//       text: this.textValue,
//       icon: "warning",
//       showCancelButton: true,
//       confirmButtonText: this.confirmButtonTextValue,
//       cancelButtonText: this.cancelButtonTextValue,
//     }).then((result) => {
//       if (result.isConfirmed) {
//         // Si el usuario confirma, realiza el envío del formulario
//         event.target.click(); // Simula un clic en el enlace original
//       }
//     });
//   }
// }

// app/javascript/controllers/alert_controller.js

import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

export default class extends Controller {
  static values = {
    icon: String,
    title: String,
    html: String,
    confirmButtonText: String,
    showCancelButton: Boolean,
    cancelButtonText: String
  }
  initSweetalert(event) {
    // console.log(this.iconValue)
    // console.log(this.titleValue)
    // console.log(this.htmlValue)
    // console.log(this.confirmButtonTextValue)
    // console.log(this.showCancelButtonValue)
    // console.log(this.cancelButtonTextValue)
    event.preventDefault(); // Prevent the form to be submited after the submit button has been clicked
    Swal.fire({
      icon: this.iconValue,
      title: this.titleValue,
      html: this.htmlValue,
      confirmButtonText: this.confirmButtonTextValue,
      showCancelButton: this.showCancelButtonValue,
      cancelButtonText: this.cancelButtonTextValue,
      reverseButtons: true
    }).then((action) => {
      if (action.isConfirmed) {
        event.target[event.type](); // "submit"
      }
    })
    .catch(event.preventDefault())
  }
}
