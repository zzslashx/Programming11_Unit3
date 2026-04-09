//Unit 4 Project!
//Cheng Cheng
//Sketch Pad




//stamp images
PImage lemon, rip, trash, apple, cookie, star, moon;
boolean lemonOn, ripOn, appleOn, cookieOn, starOn, moonOn;
//Pen Type
int drawType;
float lastDotX, lastDotY;
float dotSpacing = 10;
//Colors
//stampBg

//essential primaries
color warmYellow= #FFDF00;
color coolYellow = #F1FF5E;
color white =  #F9F6F0;
color cyan =   #00FFFF;
color warmBlue = #180A8F;
color coolBlue= #0055A4;
color pink =  #FF69B4;
//Earth Tones
color brightRed = #FF0000;
color brightOrange = #FF5F1F;
color warmGreen  = #7BB661;
color coolGreen = #00A86B;
//black
color ivoryBlack = #000000;
//Variables
color selectedColor = ivoryBlack;
color[] palette;
float sliderY;
float weight;

void setup() {//setup----------------------------------
  size(1000, 800);
  background (white);
  pixelDensity(1);
  lemonOn=false;
  ripOn=false;
  cookieOn=false;
  starOn = false;
  moonOn=false;
  lemon = loadImage("Lemon.png");
  rip = loadImage("rip.png");
  trash= loadImage("trash.png");
  apple = loadImage("apple12.png");
  cookie = loadImage("cookie.png");
  star = loadImage("star.png");
  moon = loadImage("moon.png");

  palette = new color[]{warmYellow, cyan, brightRed, coolYellow, coolBlue, brightOrange, warmGreen, warmBlue, pink, coolGreen, white, ivoryBlack};
  sliderY=400;

  drawType=1;
  imageMode(CENTER);
} // end setup---------------------------


void draw() {// draw-----------------------------------------

  strokeWeight(2.5);



  //lemon button
  pushStyle();
  stampBorder(lemonOn);
  rectButton(white, 200, 0, 100, 100);
  image(lemon, 250, 45, 100, 100);
  popStyle();


  //rip button
  pushStyle();
  stampBorder(ripOn);
  rectButton(white, 300, 0, 100, 100);
  image(rip, 350, 50, 80, 80);
  popStyle();


  //apple button
  pushStyle();
  stampBorder(appleOn);
  rectButton(white, 400, 0, 100, 100);
  image(apple, 450, 50, 80, 80);
  popStyle();

  //cookie button
  pushStyle();
  stampBorder(cookieOn);
  rectButton(white, 500, 0, 100, 100);
  image(cookie, 550, 50, 80, 80);
  popStyle();

  //star button
  pushStyle();
  stampBorder(starOn);
  rectButton(white, 600, 0, 100, 100);
  image(star, 650, 50, 80, 80);
  popStyle();

  // moon button
  pushStyle();
  stampBorder(moonOn);
  rectButton(white, 700, 0, 100, 100);  // next to star
  image(moon, 750, 50, 80, 80);
  popStyle();
  // Trash button
  pushStyle();
  circleButton(white, 950, 750, 100);
  image(trash, 950, 750, 80, 80);
  popStyle();

  // draw top panel
  fill(200, 70);  // semi-transparent gray
  stroke(0);
  rect(200, 0, 800, 110);

  fill(0);        // black text
  textSize(30);
  text("← Stamps", 900, 50);

  //Left Panel
  fill(200, 70);
  rect(0, 0, 200, 800);



  //palette panel
  fill(255, 30);
  rect(10, 20, 180, 180, 10);

  // Draw the color palette
  draw1Row(0, 3, 60);
  draw1Row(3, 6, 90);
  draw1Row(6, 9, 120);
  draw1Row(9, 12, 150);


  stroke(0);
  fill(0);
  textSize(15);
  textAlign(CENTER, CENTER);
  text("Click To Pick", 100, 40);

  //indicator section
  fill(255, 30);
  rect(10, 210, 180, 100, 10);
  pushStyle();
  strokeWeight(1);
  fill(0);
  text("Your Color + weight:", 100, 230);
  fill(selectedColor);
  circle(90, 270, 30);
  if(selectedColor==ivoryBlack)
  fill(255);
  else{
  fill(0);
  }
  circle(90,270,weight);
  popStyle();

  //StrokeWeight Slider
  fill(255, 30);
  rect(10, 320, 180, 200, 10);

  fill(0);
  text("Stroke Weight", 100, 340);

  pushStyle();
  if (mouseX>50 && mouseX <110 && mouseY > 350 && mouseY < 450) {
    strokeWeight(5);
    stroke(255);
  }
  line(80, 370, 80, 470);
  circle(80, sliderY, 15);
  popStyle();

  text("low", 120, 370);
  text("high", 120, 470);
  text("Value: " + nf(weight, 0, 1), 100, 500);



  //Pen Type:
  fill(255, 30);
  rect(10, 540, 180, 120, 10);

  fill(0);
  text("Pen Type:", 100, 560);

  tactileRect(30, 580, 60, 30);
  rect(30, 580, 60, 30);
  fill(0);
  text("normal", 60, 595);

  tactileRect(110, 580, 60, 30);
  rect(110, 580, 60, 30);
  fill(0);
  text("Dotted", 140, 595);

  if (drawType==1) {
    text("selected: normal", 100, 630);
    weight = map(sliderY, 370, 470, 1, 20);
  }
  if (drawType==2) {
    text("selected: dotted", 100, 630);
    weight = map(sliderY, 370, 470, 1, 20);
  }

  //save button
  strokeWeight(3);
  stroke(0);
  rectButton(1, 40, 700, 120, 30);
  fill(0);
  text("save", 100, 715);

  //load button
  rectButton(1, 40, 740, 120, 30);
  fill(0);
  text("load", 100, 755);
} // end draw------------------------------------------------------

void mouseDragged() {//------------------------------------------
  controlSlider();
  stroke(selectedColor);
  strokeWeight(weight);
  if (lemonOn != true && ripOn!=true && appleOn!=true && cookieOn!=true && starOn!=true && moonOn!=true && mouseX>200 && mouseY > 100) {
    //pen draw
    drawLineOrDots();
  }
  //stamps
  drawStamp(lemon, lemonOn);
  drawStamp(rip, ripOn);
  drawStamp(apple, appleOn);
  drawStamp(cookie, cookieOn);
  drawStamp(star, starOn);
  drawStamp(moon, moonOn);
  stroke(0);
}//------------------------------------------

void mousePressed() {//------------------------------------------
  controlSlider();

  lastDotX = mouseX;
  lastDotY = mouseY;

  //checks which color the mouse hits when prssed
  checkColorRow(0, 3, 60);
  checkColorRow(3, 6, 90);
  checkColorRow(6, 9, 120);
  checkColorRow(9, 12, 150);

  if (lemonOn != true && ripOn!=true && appleOn!=true && cookieOn!=true && starOn!=true && moonOn!=true &&mouseX>200 && mouseY > 100) {
    //pen draw
    drawLineOrDots();
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
    if (cookieOn==true&& mouseX>200 && mouseY > 100) {
      image(cookie, mouseX, mouseY, weight*5+50, weight*5+50);
    }
    if (starOn && mouseX > 200 && mouseY > 100) {
      image(star, mouseX, mouseY, weight*5+50, weight*5+50);
    }
    if (moonOn && mouseX > 200 && mouseY > 100) {
      image(moon, mouseX, mouseY, weight*5+50, weight*5+50);
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

  if (mouseX>50 && mouseX <110 && mouseY > 370 && mouseY < 470) {
    sliderY = mouseY;
  }
}//------------------------------------------

void tactileRect(int x, int y, int w, int h) {//------------------------------------------
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(255, 255, 0);
  } else {
    fill(255);
  }
}//------------------------------------------
void stampBorder(boolean isOn) {
  if (isOn) {
    stroke(255, 0, 0);
    strokeWeight(6);
  } else {
    stroke(0);
    strokeWeight(3);
  }
}//------------------------------------------
void mouseReleased() {//------------------------------------------
  //dotted drawing vs normal
  if (mouseX>30 && mouseX < 90 && mouseY>580 && mouseY<610) {

    drawType=1; //normal
  }
  if (mouseX>110 && mouseX < 170 && mouseY>580 && mouseY<610) {

    drawType=2; // dotted
  }
  //lemon button
  if ( mouseX > 200 && mouseX <300 && mouseY>0 && mouseY<100) {
    if (lemonOn==true)
      lemonOn=false;
    else {
      deselectStamps();
      lemonOn = !lemonOn;
    }
  }
  //wilted rose button
  if ( mouseX > 300 && mouseX <400 && mouseY>0 && mouseY<100) {
    if (ripOn==true)
      ripOn=false;
    else {
      deselectStamps();
      ripOn = !ripOn;
    }
  }
  //apple button
  if ( mouseX > 400 && mouseX <500 && mouseY>0 && mouseY<100) {
    if (appleOn==true)
      appleOn=false;
    else {
      deselectStamps();
      appleOn = !appleOn;
    }
  }
  //cookie button
  if ( mouseX > 500 && mouseX <600 && mouseY>0 && mouseY<100) {
    if (cookieOn==true)
      cookieOn=false;
    else {
      deselectStamps();
      cookieOn = !cookieOn;
    }
  }
  //star button
  if (mouseX > 600 && mouseX < 700 && mouseY > 0 && mouseY < 100) {
    if (starOn==true)
      starOn=false;
    else {
      deselectStamps();
      starOn = !starOn;
    }
  }
  //moon button
  if (mouseX > 700 && mouseX < 800 && mouseY > 0 && mouseY < 100) {
    if (moonOn==true)
      moonOn=false;
    else {
      deselectStamps();
      moonOn = !moonOn;
    }
  }
  //trash button
  if (dist(950, 750, mouseX, mouseY)<50) {
    //background(255);
    fill(white);
    rect(200, 110, 800, 800);
  }
  //save button
  // 70, 730, 50, 25
  if (mouseX >40 && mouseX<160 && mouseY > 700 && mouseY<730)
    selectOutput ("Choose a name your new image file", "saveImage");
  //load button
  // 70, 760, 50, 25
  if (mouseX >40 && mouseX<160 && mouseY > 740 && mouseY<770)
    selectInput ("Pick an image to load", "openImage");
}//------------------------------------------
void openImage(File f) {
  if (f != null) {
    PImage pic = loadImage(f.getPath());
    image(pic, width/2 + 100, height/2 + 50, 400, 400);
  }
}
void saveImage(File f) {
  if (f!=null) {
    PImage canvas = get(71, 1, width-71, height-1);
    canvas.save(f.getAbsolutePath());
  }
}
void tactileCircle(int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY)<r/2) {
    stroke(0, 255, 255);
  } else {
    stroke(0);
  }
}

void rectButton(color fillColor, int x, int y, int w, int h) {
  pushStyle();
  tactileRect(x, y, w, h);

  rect(x, y, w, h);
  popStyle();
}
void circleButton(color fillColor, int x, int y, int r) {
  pushStyle();
  tactileCircle(x, y, r);
  fill(fillColor);
  circle(x, y, r);
  popStyle();
}
void deselectStamps() {
  lemonOn = false;
  ripOn = false;
  appleOn = false;
  cookieOn = false;
  starOn = false;
  moonOn = false;
}



void draw1Row(int start, int end, int y) {
  for (int i = start; i < end; i++) {
    int x = 45 + ((i - start) * (25 + 15));
    checkHover(x, y);
    fill(palette[i]);
    rect(x, y, 25, 25, 6.7);
  }
}
void checkColorRow(int start, int end, int y) {
  for (int i = start; i < end; i++) {
    int x = 45 + ((i - start) * (25 + 15)); // same fix as before

    if (mouseX > x && mouseX < x + 25 && mouseY > y && mouseY < y + 25) {
      selectedColor = palette[i];
      deselectStamps();
    }
  }
}
void drawStamp(PImage img, boolean isOn) {
  if (isOn && mouseX > 200 && mouseY > 100) {
    image(img, mouseX, mouseY, weight*5+50, weight*5+50);
  }
}
void drawLineOrDots() {
  if (drawType == 1) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  } else {
    float d = dist(mouseX, mouseY, lastDotX, lastDotY);
    if (d > dotSpacing) {
      point(mouseX, mouseY);
      lastDotX = mouseX;
      lastDotY = mouseY;
    }
  }
}
