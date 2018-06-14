function slider() {

let slider = document.getElementById("myRange");
const priceSliderValue = document.querySelector(".slider-output");

if (slider === undefined) {return};

// Display the default slider value

// Update the current slider value (each time you drag the slider handle)
slider.oninput = function() {
    priceSliderValue.innerHTML = `Maximum Price: ${this.value}`;
}};

export { slider };
