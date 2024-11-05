import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "star"]

  connect() {
    this.rating = 0
    this.updateStars()
  }

  rate(event) {
    const star = event.currentTarget
    this.rating = parseInt(star.dataset.value)
    this.inputTarget.value = this.rating
    this.updateStars()
  }

  highlight(event) {
    const star = event.currentTarget
    const value = parseInt(star.dataset.value)
    this.starTargets.forEach((star, index) => {
      if (index < value) {
        star.classList.remove('far')
        star.classList.add('fas')
      } else {
        star.classList.remove('fas')
        star.classList.add('far')
      }
    })
  }

  reset() {
    this.updateStars()
  }

  updateStars() {
    this.starTargets.forEach((star, index) => {
      if (index < this.rating) {
        star.classList.remove('far')
        star.classList.add('fas')
      } else {
        star.classList.remove('fas')
        star.classList.add('far')
      }
    })
  }
}
