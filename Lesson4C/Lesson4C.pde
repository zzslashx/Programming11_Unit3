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
  size(800, 600);
  strokeWeight(5);
  stroke(darkestBlue);
  selectedColor = fullBlue;
}
void draw() {
  
  background(fullBlue);
  //buttons
  
    if (dist(100, 100, mouseX, mouseY)<50) {
      stroke(white);
    }
    else{
    stroke(darkestBlue);
    }
  
  fill(lightestBlue);
  circle(100, 100, 100);
    
    if (dist(100, 300, mouseX, mouseY)<50) {
      stroke(white);
    }
    else{
    stroke(darkestBlue);
    }
  fill(midBlue);
  circle(100, 300, 100);
  fill(darkerBlue);
    
    if (dist(100, 500, mouseX, mouseY)<50) {
      stroke(white);
    }
    else{
    stroke(darkestBlue);
    }
  circle(100, 500, 100);
  //indicator
  stroke(darkestBlue);
  fill(selectedColor);
  square(300, 100, 400);
  textSize(25);
  fill(0);
  text("Color Selected", 500, 300);
}
void mouseReleased() {

  if (dist(100, 100, mouseX, mouseY)<50) {
    selectedColor = lightestBlue;
  } else if (dist(100, 300, mouseX, mouseY)<50) {
    selectedColor = midBlue;
  } else if (dist(100, 500, mouseX, mouseY)<50) {

    selectedColor= darkerBlue;
  }
}
