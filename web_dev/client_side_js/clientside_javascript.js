function addBackgroundColor(event){
  event.target.style.background = 'yellow';
}

function removeBackgroundColor(event){
  event.target.style.background = 'white';
}

var paragraph = document.getElementsByTagName('p');

for (i = 0; i < paragraph.length; i++) {
  paragraph[i].addEventListener("mouseover", addBackgroundColor);
  paragraph[i].addEventListener("mouseout", removeBackgroundColor);
}

// some jquery that would make a message pop when any "button" tag is clicked.
// $("button").on("click", function() {
// 	alert("Go to the top!");
// });

function appendFunction() {
  var para = document.createElement("P");
  var t = document.createTextNode("This is a paragraph.");
  para.appendChild(t);
  document.body.appendChild(para)
}

function showToggleFunction() {
  var x = document.getElementsByClassName("passions");
  for (i = 0; i < x.length; i++) {
    if (x[i].style.display === 'none') {
        x[i].style.display = 'block';
    } else {
        x[i].style.display = 'none';
    }
  }
}

function displayDate() {
    document.getElementById("display_date").innerHTML = Date();
}
var date_button = document.getElementById("date_button");
date_button.addEventListener("click", displayDate)
