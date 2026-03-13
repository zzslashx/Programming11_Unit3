//Unit 4 Project!
//Cheng Cheng

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
color ivoryBlack = #2C2C2C;
//Variables
color selectedColor = ivoryBlack;
color[] palette;
void setup() {
  palette = new color[]{warmYellow, cyan, brightRed, coolYellow, coolBlue, brightOrange, warmGreen, warmBlue, pink, coolGreen, white, ivoryBlack};




  size(1000, 800);
}


void draw() {
  background (white);
  strokeWeight(2.5);
  //Left Panel
  fill(100, 70);
  rect(0, 0, 200, 800);


  //draw the palette
  for (int i = 0; i < 3; i++) {

    int x = 35 + (i * (25 + 15));
    int y = 50;
    fill(palette[i]);
    rect(x, y, 25, 25, 6.7);
  }

  for (int i = 3; i < 6; i++) {

    int x = 35 + ((i-3) * (25 + 15));
    int y = 80;
    fill(palette[i]);
    rect(x, y, 25, 25, 6.7);
  }
  for (int i = 6; i < 9; i++) {

    int x = 35 + ((i-6) * (25 + 15));
    int y = 110;
    fill(palette[i]);
    rect(x, y, 25, 25, 6.7);
  }
  for (int i = 9; i < 12; i++) {

    int x = 35 + ((i-9) * (25 + 15));
    int y = 140;
    fill(palette[i]);
    rect(x, y, 25, 25, 6.7);
  }

  //palette panel
  fill(0);
  textSize(15);
  textAlign(CENTER, CENTER);
  text("Click To Pick", 80, 15);
  fill(255, 80);
  square(20, 35, 140);
  //indicator
  fill(selectedColor);
  rect(50, 225, 30,30,50);
  fill(0);


  text("Your Color: ", 80, 200);
}

void mouseDragged() {
}

void mousePressed() {
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
}
