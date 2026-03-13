//Palette
color darkPurple = #230F2B;
color pink       = #F21D41;
color lightGreen = #EBEBBC;
color medGreen   = #BCE3C5;
color darkGreen  = #82B3AE;

float sliderY;
float shade;

void setup() {
  size(800, 800);
  strokeWeight(5);
  stroke(pink);
  fill(pink);
  sliderY = 400;
}

void draw() {
  shade = map(sliderY, 100,700, 0, 255);
  background(shade);
  line(400, 700, 400, 100);
  circle(400, sliderY, 50);
}
void mouseDragged(){
controlSlider();

}
void mouseReleased(){

controlSlider();

}
void controlSlider(){

  if (mouseX>375 && mouseX <425 && mouseY < 700 && mouseY > 100){
  sliderY = mouseY;
  }
  shade = map(sliderY, 100,700, 0, 255);

}
