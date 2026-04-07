//Palette
color darkPurple = #230F2B;
color pink       = #F21D41;
color lightGreen = #EBEBBC;
color medGreen   = #BCE3C5;
color darkGreen  = #82B3AE;

float sliderY;
float dia;

void setup() {
  size(800, 800);
  strokeWeight(5);
  stroke(pink);
  fill(pink);
  sliderY = 400;
}

void draw() {
  background(22,29,100);
  if (mouseX>365 && mouseX <435 && mouseY < 700 && mouseY > 100){
  stroke(255);
  }
  else{
  stroke(55,55,55);
  }
  line(400, 700, 400, 100);
  circle(400, sliderY, 50);
  stroke(0);
    dia = map(sliderY, 100,700, 100, 200);
circle(150,300,dia);
  
}
  
  

void mouseDragged(){
controlSlider();

}
void mouseReleased(){

controlSlider();

}
void controlSlider(){

  if (mouseX>365 && mouseX <435 && mouseY < 700 && mouseY > 100){
  sliderY = mouseY;
  }
  dia = map(sliderY, 100,700, 0, 255);

}
