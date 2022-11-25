import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "popup" ]

  chooseItem(data) {
    $.ajax({
      url: 'api/curb',
      type: 'get',
      data:  { item_name: this.popupTargets[0].classList[1] },
      success: (data) => {
        console.log(data.attachmentPartial)
        setTimeout(
          function() {
            $('#results-popup' ).empty();
            $('#results-popup').append(data.attachmentPartial);
            $(location).prop('href', '#results-popup')
          }, 3000
        );
      }
    })
  }
}
