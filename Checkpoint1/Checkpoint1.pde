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
  size(600, 600);
  strokeWeight(5);
  stroke(darkestBlue);
  selectedColor = fullBlue;
}
void draw() {
  
  background(fullBlue);

  // BUTTONS

  // Button 1
  if (dist(100, 100, mouseX, mouseY) < 50) {
    stroke(white);
  } else {
    stroke(darkestBlue);
  }
  fill(lightestBlue);
  circle(100, 100, 100);

  // Button 2
  if (dist(300, 100, mouseX, mouseY) < 50) {
    stroke(white);
  } else {
    stroke(darkestBlue);
  }
  fill(midBlue);
  circle(300, 100, 100);

  // Button 3
  if (dist(500, 100, mouseX, mouseY) < 50) {
    stroke(white);
  } else {
    stroke(darkestBlue);
  }
  fill(darkerBlue);
  circle(500, 100, 100);

  // INDICATOR 
  stroke(darkestBlue);
  fill(selectedColor);
  square(175, 250, 300);

  textSize(25);
  fill(0);
  text("Color Selected", 185, 470);
}
void mouseReleased() {

  if (dist(100, 100, mouseX, mouseY) < 50) {
    selectedColor = lightestBlue;

  } else if (dist(300, 100, mouseX, mouseY) < 50) {
    selectedColor = midBlue;

  } else if (dist(500, 100, mouseX, mouseY) < 50) {
    selectedColor = darkerBlue;
  }
}
