// test sketch
float testmark;
float percent;

void setup(){
size(800,600);
textAlign(CENTER,CENTER);
testmark = 17; // out of 29

//            dependent var  range of testmark  range of percent 
percent = map(testmark,      0, 20,             0, 50);
}

void draw(){
background(0);
textSize(100);
text(nf(percent,0,2),400,300);

}
