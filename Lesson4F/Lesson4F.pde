//Palette
color darkPurple = #230F2B;
color pink       = #F21D41;
color lightGreen = #EBEBBC;
color medGreen   = #BCE3C5;
color darkGreen  = #82B3AE;

float sliderX;
float shade;

void setup() {
  size(800, 600);
  strokeWeight(5);
  stroke(pink);
  fill(pink);
  sliderX = 400;
}

void draw() {
  shade = map(sliderX, 100,700, 0, 255);
  background(shade);
  line(100, 300, 700, 300);
  circle(sliderX, 300, 50);
}
void mouseDragged(){
controlSlider();

}
void mouseReleased(){

controlSlider();

}
void controlSlider(){

  if (mouseX>100 && mouseX <700 && mouseY < 325 && mouseY > 275){
  sliderX = mouseX;
  }
  shade = map(sliderX, 100,700, 0, 255);

}
