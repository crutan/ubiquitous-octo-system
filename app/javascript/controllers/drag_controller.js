import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      sort: true,
      handle: '.handle',
      animation: 150,
      onEnd: this.save.bind(this)
    })
  }

  async save(event) {
    let data = new FormData()
    data.append("slide[position]", event.newIndex + 1)

    await fetch(event.item.dataset.dragUrl, {
      method: "PATCH",
      headers: {
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
      },
      body: data,
    });

    // Click the slide preview link if the slide is visible - this will fix slide numbering and prev/next weirdness
    if (document.querySelector('div.slide#'+event.item.dataset.dragActive)) {
      document.querySelector('#'+event.item.id+' li a').click();
    }
  }

}
