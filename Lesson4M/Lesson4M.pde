PImage lemon;
boolean lemonOn;
void setup() {
  lemonOn = false;
  size(800, 600);
  background(255);
  pixelDensity(1);
  lemon = loadImage("Lemon.png");
}
void draw() {
 
  fill(255);
 //toolbar
 stroke(0);
 strokeWeight(1);
 fill(100,50);
 rect(0,0,800,125);
  //lemon button
  tactile(0, 0, 100, 100);
  lemonOnOff();
  rect(0, 0, 100, 100);
  image(lemon, 0, -5, 100, 100);
}
void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(255, 255, 0);
  } else {
    fill(255);
  }
}
void mouseDragged() {
  if (lemonOn != true) {
    //squiggly line
    
    line(pmouseX, pmouseY, mouseX, mouseY);
  } else {
    //lemon drawing
    image(lemon,mouseX-50,mouseY-50,100,100);
    
  }
}
void mousePressed() {
  if (lemonOn != true) {
    //squiggly line
    
    line(pmouseX, pmouseY, mouseX, mouseY);
  } else {
    //lemon drawing
    image(lemon,mouseX-50,mouseY-50,100,100);
    
  }
}
void mouseReleased(){
//lemon button
if( mouseX > 0 && mouseX <100 && mouseY>0 && mouseY<100){

lemonOn = !lemonOn; 
}

}
void lemonOnOff(){
if (lemonOn==true){
  stroke(255,0,0);
  strokeWeight(6);
}else{
stroke(0);
strokeWeight(3);
}



}
