import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["query"]

  search(event) {
    const query = this.queryTarget.value
    const url = new URL(window.location.origin)
    url.searchParams.set("query", query)
    window.history.pushState({}, "", url)
    // this.element.requestSubmit()
    fetch(url, {
      headers: { accept: "application/json" }
    })
    .then(response => response.json())
    .then((data) => {
      // Update the page with the search results
      const toursGrid = document.querySelector(".tours-grid")
      toursGrid.innerHTML = data.results
      toursGrid.classList.remove("fade-in")
      void toursGrid.offsetWidth // Trigger reflow to restart the animation
      toursGrid.classList.add("fade-in")
    })
  }
}
