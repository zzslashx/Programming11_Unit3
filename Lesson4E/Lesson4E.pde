// Palette
color darkPurple = #230F2B;
color pink       = #F21D41;
color lightGreen = #EBEBBC;
color medGreen   = #BCE3C5;
color darkGreen  = #82B3AE;

int toggle;

void setup() {
  size(800, 600);
  strokeWeight(5);
  textSize(30);
  toggle = 1;
}

void draw() {
  background(darkPurple);

  fill(darkGreen);
  stroke(lightGreen);
  rect(200, 400, 150, 200);

  stroke(pink);

  if (toggle > 0) {
    guideline();
    fill(lightGreen);   // ← reset text color
    text("on", 275, 500);
  } else {
    fill(lightGreen);   // ← reset text color
    text("off", 275, 500);
  }
}

void mouseClicked() {
  if (mouseX > 200 && mouseX < 350 && mouseY > 400 && mouseY < 600) {
    toggle = -toggle;
  }
}

void guideline() {
  // Crosshair lines
  stroke(pink);
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);

  // Coordinates
  fill(255, 0, 0);
  text("x: " + mouseX, mouseX + 10, mouseY - 10);
  text("y: " + mouseY, mouseX + 10, mouseY + 15);

  // Reset fill so other text doesn't disappear
  fill(lightGreen);
}
