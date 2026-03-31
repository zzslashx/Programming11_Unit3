//color pallette
color lightestBlue=#94E2FF;
color midBlue=#6BD4FA;
color darkerBlue= #4AB3FF;
color fullBlue = #0094FF;
color darkestBlue = #00748C;
color white = #FFFFFF; 

//variable for color selection
color selectedColor;

void setup() {
  size(650, 600);
  strokeWeight(5);
  stroke(darkestBlue);
  selectedColor = fullBlue;
}
void draw() {
  
  background(fullBlue);

  // BUTTONS

// Button 1
if (mouseX > 100 && mouseX < 200 && mouseY > 100 && mouseY < 200) {
  stroke(white);
} else {
  stroke(darkestBlue);
}
fill(lightestBlue);
rect(100, 100, 100,75);

// Button 2
if (mouseX > 300 && mouseX < 400 && mouseY > 100 && mouseY < 175) {
  stroke(white);
} else {
  stroke(darkestBlue);
}
fill(midBlue);
rect(300, 100, 100,75);

// Button 3
if (mouseX > 500 && mouseX < 600 && mouseY > 100 && mouseY < 175) {
  stroke(white);
} else {
  stroke(darkestBlue);
}
fill(darkerBlue);
rect(500, 100, 100,75);

  // INDICATOR 
  stroke(darkestBlue);
  fill(selectedColor);
  square(175, 250, 300);

  textSize(25);
  fill(0);
  text("Color Selected", 185, 470);
}


  void mouseReleased() {

  if (mouseX > 100 && mouseX < 200 && mouseY > 100 && mouseY < 175) {
    selectedColor = lightestBlue;

  } else if (mouseX > 300 && mouseX < 400 && mouseY > 100 && mouseY < 175) {
    selectedColor = midBlue;

  } else if (mouseX > 500 && mouseX < 600 && mouseY > 100 && mouseY < 175) {
    selectedColor = darkerBlue;
  }
}
