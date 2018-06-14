function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    const courseAddress = document.querySelector('.location-autocomplete');
    if (courseAddress) {
      var autocomplete = new google.maps.places.Autocomplete(courseAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(courseAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
