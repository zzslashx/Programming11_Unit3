//color pallette
color lightestBlue=#94E2FF;
color midBlue=#6BD4FA;
color darkerBlue= #4AB3FF;
color fullBlue = #0094FF;
color darkestBlue = #00748C;

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
  fill(lightestBlue);
  circle(100, 100, 100);
  fill(midBlue);
  circle(100, 300, 100);
  fill(darkerBlue);
  circle(100, 500, 100);
  //indicator
  fill(selectedColor);
  square(300, 100, 400);
  textSize(25);
  fill(0);
  text("Color Selected", 500, 300);
}
