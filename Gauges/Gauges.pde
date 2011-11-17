PFont font;

float fontScale = 18.0;

int x = 912;
int previousFoodX = x;
  
void setup() {

  size(1024, 768);
  smooth();
  
  font = loadFont("Century-18.vlw");
  textFont(font);
}

void draw() {
  
  gaugesStatic();
  gaugesDynamic();
  
 // delay(1000);
}

void gaugesStatic() {
  
  fill(239,233,208);//apply fill colour to ellipses
//  menGauge();
  foodGauge();
//  coalGauge();
}

void menGauge() {
  ellipse(912, 184, 145, 145);//men circle
  
  pushStyle();//save previous style
  fill(77,76,76);//apply fill colour to text
  
  strokeWeight(2);//define stroke for startline only
  stroke(165, 0, 0);//define stroke colour for pointer only
  
  line(912,112,912,174);//red pointer
  text("Men",902,204);
  
  popStyle();//restore previous style
}

void foodGauge() {
  ellipse(912, 384, 145, 145);//food circle
  
  pushStyle();//save previous style
  fill(77,76,76);//apply fill colour to text
  
  strokeWeight(2);//define stroke for startline only
  stroke(165, 0, 0);//define stroke colour for pointer only
  
  line(912,312,912,374);//red pointer
  
//  pushMatrix();

  textSize(10);
  text("Food",901,404);

//  popMatrix();

  popStyle();//restore previous style
}

void coalGauge() {
  ellipse(912, 584, 145, 145);//coal circle
  
  pushStyle();//save previous style
  fill(77,76,76);//apply fill colour to text
  
  strokeWeight(2);//define stroke for startline only
  stroke(165, 0, 0);//define stroke colour for pointer only
  
  line(912,512,912,574);//red pointer
  text("Coal",901,604);
    
  popStyle();//restore previous style
}

void gaugesDynamic() {
  
//  menNumbers();
  foodNumbers();
//  coalNumbers();
}

void menNumbers() {
  
}

void foodNumbers() {
  int[] foodUnits = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
  int[] foodX = {850, 868, 888, 912, 936, 956, 974};
  int foodY = 375;
//  int x = 912;
  int y = 375;
  
  pushStyle();//save previous style
  
  fill(77,76,76);//apply fill colour to text
  
//  textAlign(CENTER, TOP);
//  textSize(fontScale);
////  text(foodUnits[14],x,y);
//  text("10",x,y);

  boolean scrolling = false;
  
  if(previousFoodX > x || previousFoodX < x) {
    scrolling = true;
//    println("scrolling is true");
  }
  
  if(!scrolling) {
    if(x > 946 && x < 956) {
      x = 956; // ease this value from previousFoodX
    }
//    print("scrolling is false");
  }
  
  textAlign(CENTER, TOP);
  textSize(fontScale); // fontScale = 18.0, but will decrement to 10.0 depending on input data by rotary motor
  text(foodUnits[9],x,y); // x is data input by rotary motor
  
  previousFoodX = x;
  
  if(x < 950) {
    x++;
  }

///

  textAlign(CENTER, TOP);
  textSize(10);
  text("7",850,375);
  
  textAlign(CENTER, TOP);
  textSize(12);
  text("8",868,375);  
    
  textAlign(CENTER, TOP);
  textSize(14);
  text("9",888,375);
  
///

  textAlign(CENTER, TOP);
  textSize(14);
  text("11",936,375);
  
  textAlign(CENTER, TOP);
  textSize(12);
  text("12",956,375);
  
  textAlign(CENTER, TOP);
  textSize(10);
  text("13",974,375);
  
//  if(fontScale > 10.05) {
//    fontScale = fontScale - 0.05;
//  }
//  
//  println(fontScale);
  
  popStyle();//restore previous style
}

void coalNumbers() {

}
