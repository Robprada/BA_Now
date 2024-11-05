import { Controller } from "@hotwired/stimulus";
import Swal from "sweetalert2";

export default class extends Controller {
  static values = {
    title: String,
    text: String,
    confirmButtonText: String,
    cancelButtonText: String,
  };

  confirm(event) {
    event.preventDefault(); // Prevenir el envío del formulario

    Swal.fire({
      title: this.titleValue,
      text: this.textValue,
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: this.confirmButtonTextValue,
      cancelButtonText: this.cancelButtonTextValue,
    }).then((result) => {
      if (result.isConfirmed) {
        // Si el usuario confirma, realiza el envío del formulario
        event.target.click(); // Simula un clic en el enlace original
      }
    });
  }
}
