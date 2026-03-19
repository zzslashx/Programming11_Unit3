//Unit 4 Project!
//Cheng Cheng
//Sketch Pad


//stamp images
PImage lemon, rip, trash, apple;
boolean lemonOn, ripOn, appleOn;
//Pen Type
int drawType;
float lastDotX, lastDotY;
float dotSpacing = 10;
//Colors
//essential primaries
color warmYellow= #FFDF00;
color coolYellow = #F1FF5E;
color white =  #F9F6F0;
color cyan =   #00FFFF;
color warmBlue = #180A8F;
color coolBlue= #0055A4;
//Earth Tones
color brightRed = #FF0000;
color brightOrange = #FF5F1F;
color warmGreen  = #7BB661;
color coolGreen = #00A86B;
//white and black
color pink =  #FF69B4;
color ivoryBlack = #000000;
//Variables
color selectedColor = ivoryBlack;
color[] palette;
float sliderY;
float weight;

void setup() {//setup----------------------------------
  background (white);
  pixelDensity(1);
  lemonOn=false;
  ripOn=false;
  lemon = loadImage("Lemon.png");
  rip = loadImage("rip.png");
  trash= loadImage("trash.png");
  apple = loadImage("apple12.png");
  palette = new color[]{warmYellow, cyan, brightRed, coolYellow, coolBlue, brightOrange, warmGreen, warmBlue, pink, coolGreen, white, ivoryBlack};
  sliderY=350;
  size(1000, 800);
  drawType=1;
  imageMode(CENTER);
} // end setup---------------------------


void draw() {// draw-----------------------------------------

  strokeWeight(2.5);

  fill(100, 50);

  //lemon button
  pushStyle();
  tactile(200, 0, 100, 100);
  lemonOnOff();
  rect(200, 0, 100, 100);
  image(lemon, 250, 45, 100, 100);
  popStyle();

  //rip button
  pushStyle();
  tactile(300, 0, 100, 100);
  ripOnOff();
  rect(300, 0, 100, 100);
  image(rip, 350, 50, 80, 80);
  popStyle();

  //apple button
  pushStyle();
  tactile(400, 0, 100, 100);
  appleOnOff();
  rect(400, 0, 100, 100);
  image(apple, 450, 50, 80, 80);
  popStyle();

  //trash button
  pushStyle();
  tactile(900, 700, 100, 100);
  rect(900, 700, 100, 100);
  image(trash, 950, 750, 80, 80);
  popStyle();

  //StrokeWeight Slider
  //weight set later
  fill(0);
  textSize(15);
  textAlign(CENTER, CENTER);
  text("Stroke Weight", 80, 325);
  //slider tactile
  pushStyle();
if (mouseX>50 && mouseX <110 && mouseY > 350 && mouseY < 450) {
   strokeWeight(5);
   stroke(255);
  }
  line(80, 350, 80, 450);
   circle(80, sliderY, 15);
   popStyle();
  text("low", 55, 350);
  text("high", 55, 450);
 
  text("Value: ", 125, 400);
  text(nf(weight, 0, 1), 125, 430);

  //Left Panel
  fill(200, 70);
  rect(0, 0, 200, 800);
  
  //top panel
  rect(200, 0, 800, 110);
  fill(0);
  textSize(30);
  text("← Stamps", 900, 50);

  //draw the palette
  for (int i = 0; i < 3; i++) {

    int x = 35 + (i * (25 + 15));
    int y = 50;
    checkHover(x, y);
    fill(palette[i]);
    rect(x, y, 25, 25, 6.7);
  }

  for (int i = 3; i < 6; i++) {

    int x = 35 + ((i-3) * (25 + 15));
    int y = 80;
    fill(palette[i]);
    checkHover(x, y);
    rect(x, y, 25, 25, 6.7);
  }
  for (int i = 6; i < 9; i++) {

    int x = 35 + ((i-6) * (25 + 15));
    int y = 110;
    fill(palette[i]);
    checkHover(x, y);
    rect(x, y, 25, 25, 6.7);
  }
  for (int i = 9; i < 12; i++) {

    int x = 35 + ((i-9) * (25 + 15));
    int y = 140;
    fill(palette[i]);
    checkHover(x, y);
    rect(x, y, 25, 25, 6.7);
    stroke(0);
  }

  //palette panel
  fill(0);
  textSize(15);
  textAlign(CENTER, CENTER);
  text("Click To Pick", 80, 15);
  fill(255, 50);
  square(20, 35, 140);
  //indicator
  fill(selectedColor);
  rect(65, 225, 30, 30, 50);
  fill(0);
  
 //Stroke Indicator
 //strokeWeight(weight);
 circle(80,510,weight);
 strokeWeight(1);
 
 text("size\nof pen ↓",80,480);
  text("Your Color: ", 80, 200);
  text("Pen Type: ", 80,580);
  textAlign(TOP,LEFT);
  tactile(100,600,50,20);
  rect(100,600,50,20);
  fill(0);
   text("Dotted", 102,615);
    tactile(25,600,50,20);
    
  rect(25,600,50,20);
  fill(0);
  text("normal", 27,615);
  textAlign(CENTER,CENTER);
  if(drawType==1){
  text("selected type: \n normal", 83.5,645);
  weight = map(sliderY, 350, 450, 1, 20);
  }
  if(drawType==2){
  text("selected type: \n dotted", 83.5,645);
  weight = map(sliderY, 350, 450, 5, 25);
  }
} // end draw------------------------------------------------------

void mouseDragged() {//------------------------------------------
  controlSlider();
  stroke(selectedColor);
  strokeWeight(weight);
  if (lemonOn != true && ripOn!=true && appleOn!=true && mouseX>200 && mouseY > 100) {
    //squiggly line
    if(drawType==1)
    line(pmouseX, pmouseY, mouseX, mouseY);

    else{
     float d = dist(mouseX, mouseY, lastDotX, lastDotY);
      
      if (d > dotSpacing) {
        point(mouseX, mouseY);
        // Update the last dot position to current
        lastDotX = mouseX;
        lastDotY = mouseY;
      }
    }
    
  }
  if (lemonOn==true&& mouseX>200 && mouseY > 100) {
    //lemon drawing
    image(lemon, mouseX, mouseY, weight*5+50, weight*5+50);
  }
  if (ripOn==true&& mouseX>200 && mouseY > 100) {
    image(rip, mouseX, mouseY, weight*5+50, weight*5+50);
  }
  if (appleOn==true&& mouseX>200 && mouseY > 100) {
    image(apple, mouseX, mouseY, weight*5+50, weight*5+50);
  }
  stroke(0);
}//------------------------------------------

void mousePressed() {//------------------------------------------
  controlSlider();
  
   lastDotX = mouseX;
  lastDotY = mouseY;
  

  for (int i = 0; i < 12; i++) {
    int col = i % 3;
    int row = i / 3;

    float x = 35 + (col * 40);
    float y = 50 + (row * 30);

    // Check if the mouse is inside this specific square
    if (mouseX > x && mouseX < x + 25 && mouseY > y && mouseY < y + 25) {
      selectedColor = palette[i];
    }
  }
  if (lemonOn != true && ripOn!=true && appleOn!=true && mouseX>200 && mouseY > 100) {
    //squiggly line
    if(drawType==1)
    line(pmouseX, pmouseY, mouseX, mouseY);
    if(drawType==2)
     point(mouseX, mouseY);
  }
  if (lemonOn==true&& mouseX>200 && mouseY > 100) {
    //lemon drawing
    image(lemon, mouseX, mouseY, weight*5+50, weight*5+50);
  }
  if (ripOn==true&& mouseX>200 && mouseY > 100) {
    image(rip, mouseX, mouseY, weight*5+50, weight*5+50);
  }
  if (appleOn==true&& mouseX>200 && mouseY > 100) {
    image(apple, mouseX, mouseY, weight*5+50, weight*5+50);
  }
}//------------------------------------------
void checkHover(float x, float y) {//------------------------------------------
  if (mouseX > x && mouseX < x + 25 && mouseY > y && mouseY < y + 25) {
    stroke(255); // white outline
  } else {
    stroke(0);   // black outline
  }
}//------------------------------------------
void controlSlider() {//------------------------------------------

  if (mouseX>50 && mouseX <110 && mouseY > 350 && mouseY < 450) {
    sliderY = mouseY;
  }
}//------------------------------------------

void tactile(int x, int y, int w, int h) {//------------------------------------------
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(255, 255, 0);
  } else {
    fill(255);
  }
}//------------------------------------------
void lemonOnOff() {//------------------------------------------

  if (lemonOn==true) {
    stroke(255, 0, 0);
    strokeWeight(6);
  } else {
    stroke(0);
    strokeWeight(3);
  }
}//------------------------------------------
void ripOnOff() {//------------------------------------------

  if (ripOn==true) {
    stroke(255, 0, 0);
    strokeWeight(6);
  } else {
    stroke(0);
    strokeWeight(3);
  }
}//------------------------------------------
void appleOnOff() {//------------------------------------------

  if (appleOn==true) {
    stroke(255, 0, 0);
    strokeWeight(6);
  } else {
    stroke(0);
    strokeWeight(3);
  }
}//------------------------------------------
void mouseReleased() {//------------------------------------------
   //dotted drawing vs normal
    if(mouseX>25 && mouseX < 75 && mouseY>600 && mouseY<620){
  
  drawType=1; //normal
  }
  if(mouseX>100 && mouseX < 150 && mouseY>600 && mouseY<620){
  
  drawType=2; // dotted
  }
  //lemon button
  if ( mouseX > 200 && mouseX <300 && mouseY>0 && mouseY<100) {

    lemonOn = !lemonOn;
    appleOn=false;
    ripOn=false;
  }
  if ( mouseX > 300 && mouseX <400 && mouseY>0 && mouseY<100) {

    ripOn = !ripOn;
    appleOn= false;
    lemonOn= false;
  }
  if ( mouseX > 400 && mouseX <500 && mouseY>0 && mouseY<100) {

    appleOn = !appleOn;
    ripOn =false;
    lemonOn = false;
  }
  if ( mouseX > 900 && mouseX <1000 && mouseY>700 && mouseY<800) {

    background(255);
  }

}//------------------------------------------
