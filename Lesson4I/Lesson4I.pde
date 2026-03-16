PImage apple;

void setup(){
size(800,600);
background(100);
pixelDensity(1);
apple = loadImage("Apple.png");

}
void draw(){
  fill(255);
  rect(200,100,100,100);
image(apple, 200,100, 95,100);

}
